codeunit 50100 "Event Handler"
{
    Permissions = tabledata "G/L Entry" = rmid;
    //Attachment on Trip
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", OnBeforeInsertItemLedgEntry, '', false, false)]
    local procedure OnBeforeInsertItemLedgEntry(var ItemLedgerEntry: Record "Item Ledger Entry"; ItemJournalLine: Record "Item Journal Line"; TransferItem: Boolean; OldItemLedgEntry: Record "Item Ledger Entry"; ItemJournalLineOrigin: Record "Item Journal Line");
    begin
        ItemLedgerEntry."Trip ID" := ItemJournalLine."Trip ID";
    end;

    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Factbox", 'OnBeforeDrillDown', '', false, false)]
    local procedure OnBeforeDrillDown(DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef);
    var
        Trip: Record Trip;
        PettyCash: Record "Petty Cash Expenses Detail";
        Inspection: Record "Inspection Header";
    begin
        case DocumentAttachment."Table ID" of
            DATABASE::Trip:
                begin
                    RecRef.Open(DATABASE::Trip);
                    if Trip.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(Trip);
                end;
        end;
        case DocumentAttachment."Table ID" of
            DATABASE::"Petty Cash Expenses Detail":
                begin
                    RecRef.Open(DATABASE::"Petty Cash Expenses Detail");
                    if PettyCash.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(PettyCash);
                end;
        end;
        case DocumentAttachment."Table ID" of
            DATABASE::"Inspection Header":
                begin
                    RecRef.Open(DATABASE::"Inspection Header");
                    if Inspection.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(Inspection);
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Details", 'OnAfterOpenForRecRef', '', false, false)]
    local procedure OnAfterOpenForRecRef(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef);
    var
        FieldRef: FieldRef;
        RecNo: Code[20];
        Inspection: Record "Inspection Header";
    begin
        case RecRef.Number of
            DATABASE::Trip:
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
        end;
        case RecRef.Number of
            DATABASE::"Petty Cash Expenses Detail":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
        end;
        case RecRef.Number of
            DATABASE::"Inspection Header":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Document Attachment", 'OnAfterInitFieldsFromRecRef', '', false, false)]
    local procedure OnAfterInitFieldsFromRecRef(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    var
        FieldRef: FieldRef;
        RecNo: Code[20];
    begin
        case RecRef.Number of
            DATABASE::Trip:
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
        end;
        case RecRef.Number of
            DATABASE::"Petty Cash Expenses Detail":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
        end;
        case RecRef.Number of
            DATABASE::"Inspection Header":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
        end;
    end;
    //Attachment on Trip

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesLine', '', true, true)]
    local procedure OnAfterPostSalesLine(var SalesHeader: record "Sales Header"; var SalesLine: Record "Sales Line"; var SalesInvLine: record "Sales Invoice Line")
    var
        GLSetup: Record "General Ledger Setup";
        Trip2, Trip : Record Trip;
        InvShuntingTrip: Record "Invoicing Shunting Trips";
        ShuntingTrip: Record "Shunting Details";
        GLEntry: Record "G/L Entry";
        DimValue: Record "Dimension Value";
        UnigroupSetup: record "Unigroup Setup";
        GLAccount: Record "G/L Account";
        SalesHead: Record "Sales Header";
        TempJnlLine: Record "Gen. Journal Line" temporary;
        TmpDimSetEntry: Record "Dimension Set Entry" temporary;
        DimMgmt: Codeunit DimensionManagement;
        TempTripID: Code[20];
        GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";

    begin
        //Prepayment begin
        if (SalesLine."Document Type" = SalesLine."Document Type"::Invoice) AND (SalesLine."Shortcut Dimension 3 Code" <> '') then begin
            tempTripID := '';
            Trip.reset();
            Trip.SetRange("Alternate Trip ID", Salesline."Shortcut Dimension 3 Code");
            if Trip.FindFirst() then
                TempTripID := Trip."Trip ID"
            else
                TempTripID := '';
            GLSetup.Get();
            UnigroupSetup.Get();
            GLEntry.Reset();
            GLEntry.SetRange("G/L Account No.", UnigroupSetup."Trip Prepayment From", UnigroupSetup."Trip Prepayment To");
            if TempTripID <> '' then
                GLEntry.SetFilter("Shortcut Dimension 3 Code", '=%1|=%2', Salesline."Shortcut Dimension 3 Code", TempTripID)
            else
                GLEntry.SetRange("Shortcut Dimension 3 Code", SalesLine."Shortcut Dimension 3 Code");
            GLEntry.SetRange("Expense Prepayment Reversed", false);
            if GLEntry.FindSet() then begin
                repeat
                    TempJnlLine.Reset();
                    TempJnlLine.Init();
                    TempJnlLine.Validate("Journal Template Name", 'GENERAL');
                    TempJnlLine.Validate("Journal Batch Name", 'DEFAULT');
                    TempJnlLine.Validate("Line No.", 10000 * (TempJnlLine.Count + 1));
                    SalesLine.CalcFields("Posting Date");
                    TempJnlLine.Validate("Posting Date", SalesLine."Posting Date");
                    TempJnlLine.Validate("Document Type", 0);
                    TempJnlLine.Validate("Document No.", GLEntry."Document No.");
                    TempJnlLine.Validate("Account Type", TempJnlLine."Account Type"::"G/L Account");
                    GLAccount.Get(GLEntry."G/L Account No.");
                    TempJnlLine.Validate("Account No.", GLAccount."Prepayment Reversal Account");
                    GLEntry.CalcFields("G/L Account Name", "Shortcut Dimension 3 Code");
                    TempJnlLine.Validate(Description, SalesLine."Document No." + '-Reversal-' + GLEntry."Shortcut Dimension 3 Code" + ' ' + GLEntry."G/L Account Name");
                    TempJnlLine.Validate(Amount, GLEntry.Amount);
                    TempJnlLine.Validate("Bal. Account Type", TempJnlLine."Bal. Account Type"::"G/L Account");
                    TempJnlLine.Validate("Bal. Account No.", GLEntry."G/L Account No.");
                    TempJnlLine.Validate("Expense Prepayment Reversed", true);

                    TmpDimSetEntry.DeleteAll();
                    if DimValue.get(GLSetup."Global Dimension 1 Code", SalesLine."Shortcut Dimension 1 Code") then begin
                        TmpDimSetEntry.init;
                        TmpDimSetEntry.Validate("Dimension Code", GLSetup."Global Dimension 1 Code");
                        TmpDimSetEntry.Validate("Dimension Value Code", SalesLine."Shortcut Dimension 1 Code");
                        TmpDimSetEntry.insert;
                    end;
                    if DimValue.get(GLSetup."Global Dimension 2 Code", SalesLine."Shortcut Dimension 2 Code") then begin
                        TmpDimSetEntry.Init;
                        TmpDimSetEntry.Validate("Dimension Code", GLSetup."Global Dimension 2 Code");
                        TmpDimSetEntry.Validate("Dimension Value Code", SalesLine."Shortcut Dimension 2 Code");
                        TmpDimSetEntry.Insert;
                    end;
                    if DimValue.Get(GLSetup."Shortcut Dimension 3 Code", GLEntry."Shortcut Dimension 3 Code") then begin
                        TmpDimSetEntry.Init;
                        TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 3 Code");
                        TmpDimSetEntry.Validate("Dimension Value Code", GLEntry."Shortcut Dimension 3 Code");
                        TmpDimSetEntry.Insert;
                    end;
                    if DimValue.Get(GLSetup."Shortcut Dimension 4 Code", SalesLine."Shortcut Dimension 4 Code") then begin
                        TmpDimSetEntry.Init();
                        TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 4 Code");
                        TmpDimSetEntry.Validate("Dimension Value Code", SalesLine."Shortcut Dimension 4 Code");
                        TmpDimSetEntry.Insert;
                    end;
                    if DimValue.Get(GLSetup."Shortcut Dimension 5 Code", SalesLine."Shortcut Dimension 5 Code") then begin
                        TmpDimSetEntry.Init;
                        TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 5 Code");
                        TmpDimSetEntry.Validate("Dimension Value Code", SalesLine."Shortcut Dimension 5 Code");
                        TmpDimSetEntry.Insert;
                    end;
                    if DimValue.Get(GLSetup."Shortcut Dimension 6 Code", SalesLine."Shortcut Dimension 6 Code") then begin
                        TmpDimSetEntry.Init;
                        TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 6 Code");
                        TmpDimSetEntry.Validate("Dimension Value Code", SalesLine."Shortcut Dimension 6 Code");
                        TmpDimSetEntry.Insert();
                    end;
                    if DimValue.Get(GLSetup."Shortcut Dimension 7 Code", SalesLine."Shortcut Dimension 7 Code") then begin
                        TmpDimSetEntry.Init;
                        TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 7 Code");
                        TmpDimSetEntry.Validate("Dimension Value Code", SalesLine."Shortcut Dimension 7 Code");
                        TmpDimSetEntry.Insert();
                    end;
                    if DimValue.Get(GLSetup."Shortcut Dimension 8 Code", SalesLine."Shortcut Dimension 8 Code") then begin
                        TmpDimSetEntry.Init;
                        TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 8 Code");
                        TmpDimSetEntry.Validate("Dimension Value Code", SalesLine."Shortcut Dimension 8 Code");
                        TmpDimSetEntry.Insert();
                    end;
                    TempJnlLine.validate("Dimension Set ID", DimMgmt.GetDimensionSetID(TmpDimSetEntry));
                    TempJnlLine.insert(true);
                    GenJnlPostLine.RunWithCheck(TempJnlLine);
                    GLEntry."Expense Prepayment Reversed" := true;
                    GLEntry.Modify(true);
                until GLEntry.Next() = 0;
            end;

            //Prepayment end

            //Revenue Accrual begin
            GLSetup.Get();
            UnigroupSetup.Get();
            GLAccount.Reset();
            GLAccount.SetRange("Revenue Accrual Reversal", true);
            if GLAccount.FindFirst() then
                repeat
                    GLEntry.Reset();
                    GLEntry.SetRange("G/L Account No.", GLAccount."No.");
                    GLEntry.SetRange("Shortcut Dimension 3 Code", SalesLine."Shortcut Dimension 3 Code");
                    GLEntry.SetRange("Revenue Accrual Reversed", false);
                    if GLEntry.FindSet() then begin
                        repeat
                            TempJnlLine.Reset();
                            TempJnlLine.Init();
                            TempJnlLine.Validate("Journal Template Name", 'GENERAL');
                            TempJnlLine.Validate("Journal Batch Name", 'DEFAULT');
                            TempJnlLine.Validate("Line No.", 10000 * (TempJnlLine.count + 1));
                            SalesLine.CalcFields("Posting Date");
                            TempJnlLine.Validate("Posting Date", SalesLine."Posting Date");
                            TempJnlLine.Validate("Document Type", 0);
                            TempJnlLine.Validate("Document No.", GLEntry."Document No.");
                            TempJnlLine.Validate("Account Type", TempJnlLine."Account Type"::"G/L Account");
                            TempJnlLine.Validate("Account No.", GLEntry."Bal. Account No.");
                            TempJnlLine.Validate(Description, SalesLine."Document No." + '-Reversal-' + GLEntry."Shortcut Dimension 3 Code" + ' ' + GLEntry."G/L Account Name");
                            TempJnlLine.Validate(Amount, GLEntry.Amount);
                            TempJnlLine.Validate("Bal. Account Type", TempJnlLine."Bal. Account Type"::"G/L Account");
                            TempJnlLine.Validate("Bal. Account No.", GLEntry."G/L Account No.");
                            TempJnlLine.Validate("Revenue Accrual Reversed", true);

                            TmpDimSetEntry.DeleteAll();
                            if DimValue.get(GLSetup."Global Dimension 1 Code", SalesLine."Shortcut Dimension 1 Code") then begin
                                TmpDimSetEntry.init;
                                TmpDimSetEntry.Validate("Dimension Code", GLSetup."Global Dimension 1 Code");
                                TmpDimSetEntry.Validate("Dimension Value Code", SalesLine."Shortcut Dimension 1 Code");
                                TmpDimSetEntry.insert;
                            end;
                            if DimValue.get(GLSetup."Global Dimension 2 Code", SalesLine."Shortcut Dimension 2 Code") then begin
                                TmpDimSetEntry.Init;
                                TmpDimSetEntry.Validate("Dimension Code", GLSetup."Global Dimension 2 Code");
                                TmpDimSetEntry.Validate("Dimension Value Code", SalesLine."Shortcut Dimension 2 Code");
                                TmpDimSetEntry.Insert;
                            end;
                            if DimValue.Get(GLSetup."Shortcut Dimension 3 Code", SalesLine."Shortcut Dimension 3 Code") then begin
                                TmpDimSetEntry.Init;
                                TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 3 Code");
                                TmpDimSetEntry.Validate("Dimension Value Code", SalesLine."Shortcut Dimension 3 Code");
                                TmpDimSetEntry.Insert;
                            end;
                            if DimValue.Get(GLSetup."Shortcut Dimension 4 Code", SalesLine."Shortcut Dimension 4 Code") then begin
                                TmpDimSetEntry.Init();
                                TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 4 Code");
                                TmpDimSetEntry.Validate("Dimension Value Code", SalesLine."Shortcut Dimension 4 Code");
                                TmpDimSetEntry.Insert;
                            end;
                            if DimValue.Get(GLSetup."Shortcut Dimension 5 Code", SalesLine."Shortcut Dimension 5 Code") then begin
                                TmpDimSetEntry.Init;
                                TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 5 Code");
                                TmpDimSetEntry.Validate("Dimension Value Code", SalesLine."Shortcut Dimension 5 Code");
                                TmpDimSetEntry.Insert;
                            end;
                            if DimValue.Get(GLSetup."Shortcut Dimension 6 Code", SalesLine."Shortcut Dimension 6 Code") then begin
                                TmpDimSetEntry.Init;
                                TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 6 Code");
                                TmpDimSetEntry.Validate("Dimension Value Code", SalesLine."Shortcut Dimension 6 Code");
                                TmpDimSetEntry.Insert();
                            end;
                            if DimValue.Get(GLSetup."Shortcut Dimension 7 Code", SalesLine."Shortcut Dimension 7 Code") then begin
                                TmpDimSetEntry.Init;
                                TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 7 Code");
                                TmpDimSetEntry.Validate("Dimension Value Code", SalesLine."Shortcut Dimension 7 Code");
                                TmpDimSetEntry.Insert();
                            end;
                            if DimValue.Get(GLSetup."Shortcut Dimension 8 Code", SalesLine."Shortcut Dimension 8 Code") then begin
                                TmpDimSetEntry.Init;
                                TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 8 Code");
                                TmpDimSetEntry.Validate("Dimension Value Code", SalesLine."Shortcut Dimension 8 Code");
                                TmpDimSetEntry.Insert();
                            end;
                            TempJnlLine.validate("Dimension Set ID", DimMgmt.GetDimensionSetID(TmpDimSetEntry));
                            TempJnlLine.insert(true);
                            GenJnlPostLine.RunWithCheck(TempJnlLine);
                            GLEntry."Revenue Accrual Reversed" := true;
                            GLEntry.Modify(true);
                        until GLEntry.Next() = 0;
                    end;
                until GLAccount.Next() = 0;

            //Revenue Accrual
            if SalesLine."Document Type" = SalesLine."Document Type"::Invoice then begin
                if (SalesLine."Shortcut Dimension 2 Code" = 'SHUNTING') or (SalesLine."Shortcut Dimension 2 Code" = '3PL') then begin
                    InvShuntingTrip.Reset();
                    InvShuntingTrip.SetRange(Posted, false);
                    InvShuntingTrip.SetRange("Trip Id", SalesLine."Shortcut Dimension 3 Code");
                    InvShuntingTrip.SetRange("Invoice No.", SalesLine."Document No.");
                    if InvShuntingTrip.FindFirst() then
                        repeat
                            ShuntingTrip.Reset();
                            ShuntingTrip.SetRange("Trip Id", SalesLine."Shortcut Dimension 3 Code");
                            ShuntingTrip.SetRange("Shunting Trip ID", InvShuntingTrip."Shunting Trip ID");
                            if ShuntingTrip.FindFirst() then
                                repeat
                                    ShuntingTrip."Billing Status" := ShuntingTrip."Billing Status"::Invoiced;
                                    ShuntingTrip."Posted Invoice No." := SalesInvLine."Document No.";
                                    ShuntingTrip.Modify();
                                until ShuntingTrip.Next() = 0;
                            InvShuntingTrip.Posted := true;
                            Invshuntingtrip."Posted Invoice No." := SalesInvLine."Document No.";
                            Invshuntingtrip."Posted Invoice Line No." := SalesInvLine."Line No.";
                            InvShuntingTrip.Modify();
                        until InvShuntingTrip.Next() = 0;
                end;
            end;
            Trip2.Reset();
            Trip2.SetRange("Trip ID", SalesLine."Shortcut Dimension 3 Code");
            if (SalesLine."Shortcut Dimension 2 Code" = 'SHUNTING') or (SalesLine."Shortcut Dimension 2 Code" = '3PL') then
                Trip2.Setfilter("Trip Status", '=%1|%2', trip2."Trip Status"::Live, Trip2."Trip Status"::Completed)
            Else
                Trip2.SetRange("Trip Status", Trip2."Trip Status"::Completed);
            Trip2.SetRange(Invoiced, false);
            if Trip2.FindFirst() then
                repeat
                    if (Trip2."Global Dimension 2 Code" = 'SHUNTING') or (Trip2."Global Dimension 2 Code" = '3PL') then begin
                        ShuntingTrip.Reset();
                        shuntingTrip.Setrange("Trip Id",Trip2."Trip ID");
                        ShuntingTrip.SetFilter("Billing Status", '<>%1', ShuntingTrip."Billing Status"::Invoiced);
                        if not ShuntingTrip.FindSet() then begin
                            Trip2.Invoiced := true;
                            Trip2."Trip Status" := Trip2."Trip Status"::Invoiced;
                            Trip2."Trip Stage" := Trip2."Trip Stage"::"Billing Completed";
                            Trip2.Modify();
                        end;
                    end else begin
                        Trip2.Invoiced := true;
                        Trip2."Trip Status" := Trip2."Trip Status"::Invoiced;
                        Trip2."Trip Stage" := Trip2."Trip Stage"::"Billing Completed";
                        Trip2.Modify();
                    end;
                until Trip2.Next() = 0;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", OnAfterPurchRcptLineInsert, '', false, false)]
    local procedure OnAfterPurchRcptLineInsert(PurchaseLine: Record "Purchase Line"; var PurchRcptLine: Record "Purch. Rcpt. Line"; ItemLedgShptEntryNo: Integer; WhseShip: Boolean; WhseReceive: Boolean; CommitIsSupressed: Boolean; PurchInvHeader: Record "Purch. Inv. Header"; var TempTrackingSpecification: Record "Tracking Specification" temporary; PurchRcptHeader: Record "Purch. Rcpt. Header"; TempWhseRcptHeader: Record "Warehouse Receipt Header"; xPurchLine: Record "Purchase Line"; var TempPurchLineGlobal: Record "Purchase Line" temporary);
    var
        TransferorderHeader: Record "Transfer Header";
        Transferorderline: Record "Transfer Line";
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgt: Codeunit "No. Series";
        LineNo: Integer;
        Trip: Record Trip;
        TransferOrderPostTransfer: Codeunit "TransferOrder-Post Transfer";
        TransferPostShipment: Codeunit "TransferOrder-Post Shipment";
        TransferPostReceipt: Codeunit "TransferOrder-Post Receipt";
        DimSetID2, DimSetID : Integer;
    begin
        If PurchaseLine."Shortage?" then begin
            PurchaseLine.TestField("Shortage Quantity");
            TransferorderHeader.Init();
            Unigroupsetup.get;
            TransferorderHeader.VALIDATE(TransferorderHeader."No.", PurchRcptLine."No.");
            TransferorderHeader.Validate("Transfer-from Code", PurchRcptLine."Location Code");
            TransferorderHeader.Validate("Transfer-to Code", Unigroupsetup."Default Var Fuel Location");
            TransferorderHeader."Posting Date" := PurchRcptLine."Posting Date";
            TransferorderHeader."Direct Transfer" := true;
            TransferorderHeader.Validate("Shipment Date", PurchRcptLine."Posting Date");
            TransferorderHeader.Validate("Receipt Date", PurchRcptLine."Posting Date");
            // DimSetID := GetDimSetID(Rec."Global Dimension 1 Code", Rec."Global Dimension 2 Code",
            // Rec."Shortcut Dimension 3 Code", Rec."Shortcut Dimension 4 Code", Rec."Shortcut Dimension 5 Code",
            // Rec."Shortcut Dimension 6 Code", Rec."Shortcut Dimension 7 Code", Rec."Shortcut Dimension 8 Code");
            //TransferorderHeader.Validate("Dimension Set ID", DimSetID);
            TransferorderHeader.Status := TransferorderHeader.Status::Released;
            TransferorderHeader.Insert();
            LineNo += 10000;
            Transferorderline.Init();
            Transferorderline."Document No." := TransferorderHeader."No.";
            Transferorderline."Line No." := 10000;
            Transferorderline.Validate("Item No.", PurchRcptLine."No.");
            Transferorderline.Validate(Quantity, PurchaseLine."Shortage Quantity");
            // DimSetID2 := GetDimSetID(Rec."Global Dimension 1 Code", Rec."Global Dimension 2 Code",
            // Rec."Shortcut Dimension 3 Code", Rec."Shortcut Dimension 4 Code", Rec."Shortcut Dimension 5 Code",
            // Rec."Shortcut Dimension 6 Code", Rec."Shortcut Dimension 7 Code", Rec."Shortcut Dimension 8 Code");
            //TransferorderLine.Validate("Dimension Set ID", DimSetID2);
            Transferorderline.Insert();
            TransferOrderPostTransfer.Run(TransferorderHeader);
        end;
    end;

    procedure GetFuelItem(FuelType: Integer) Item: Code[20]
    var
        UnigroupSetup: Record "Unigroup Setup";
    begin
        UnigroupSetup.Get();
        if FuelType = 1 then
            Item := UnigroupSetup."Default Item for Diesel";
        if FuelType = 2 then
            item := UnigroupSetup."Default Item for Petrol";
        exit(item);
    end;

    procedure GetScrapLocation(Loc: Code[20]) ScrapLoc: Code[20]
    var
        Location: Record Location;
    begin
        if Location.get(loc) then
            ScrapLoc := Location."Scrap Location"
        else
            error('Scrap Location not found');
        exit(ScrapLoc);
    end;

    procedure GetDefaultDimension(TableID: Integer; No: code[20]; DimNumber: Integer) DimValue: Code[20]
    var
        DefaultDimension: Record "Default Dimension";
        GLSetup: Record "General Ledger Setup";
        DimCode: Code[20];
    begin
        GLSetup.get();
        if DimNumber = 1 then
            DimCode := GLSetup."Global Dimension 1 Code";
        if DimNumber = 2 then
            DimCode := GLSetup."Global Dimension 2 Code";
        if DimNumber = 3 then
            DimCode := GLSetup."Shortcut Dimension 3 Code";
        if DimNumber = 4 then
            DimCode := GLSetup."Shortcut Dimension 4 Code";
        if DimNumber = 5 then
            DimCode := GLSetup."Shortcut Dimension 5 Code";
        if DimNumber = 6 then
            DimCode := GLSetup."Shortcut Dimension 6 Code";
        if DimNumber = 7 then
            DimCode := GLSetup."Shortcut Dimension 7 Code";
        if DimNumber = 8 then
            DimCode := GLSetup."Shortcut Dimension 8 Code";

        DefaultDimension.Reset();
        DefaultDimension.SetRange("Table ID", TableID);
        DefaultDimension.SetRange("No.", No);
        DefaultDimension.SetRange("Dimension Code", DimCode);
        if DefaultDimension.FindFirst() then
            DimValue := DefaultDimension."Dimension Value Code"
        else
            DimValue := '';
        exit(DimValue);
    end;

    [EventSubscriber(ObjectType::Table, Database::"G/L Entry", 'OnAfterCopyGLEntryFromGenJnlLine', '', true, true)]
    local procedure OnAfterCopyGLEntryFromGenJnlLine(var GLEntry: Record "G/L Entry"; var GenJournalLine: Record "Gen. Journal Line")
    begin
        GLEntry."Expense Prepayment Reversed" := GenJournalLine."Expense Prepayment Reversed";
        GLEntry."Revenue Accrual Reversed" := GenJournalLine."Revenue Accrual Reversed";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Cust. Ledger Entry", 'OnAfterCopyCustLedgerEntryFromGenJnlLine', '', true, true)]
    local procedure OnAfterCopyCustLedgerEntryFromGenJnlLine(var CustLedgerEntry: Record "Cust. Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        //  CustLedgerEntry."IMS Document Type" := GenJournalLine."IMS Document Type";
    end;

    // [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", OnAfterAccountNoOnValidateGetGLAccount, '', false, false)]
    // local procedure OnAfterAccountNoOnValidateGetGLAccount(var GenJournalLine: Record "Gen. Journal Line"; var GLAccount: Record "G/L Account"; CallingFieldNo: Integer);
    // begin
    //     GenJournalLine."Revenue Accrual Reversed" := glaccount."Revenue Accrual Reversal";
    // end;
}
