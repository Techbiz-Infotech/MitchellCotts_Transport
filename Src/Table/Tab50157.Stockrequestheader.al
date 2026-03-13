table 50157 "Stock request header"
{
    Caption = 'Stock request header';
    DataClassification = ToBeClassified;
    DataCaptionFields = "Stock Request No.";

    fields
    {
        field(1; "Stock Request No."; Code[20])
        {
            Caption = 'Stock Request No.';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Unigroupsetup: Record "Unigroup Setup";
                NoSeriesMgmt: Codeunit "No. Series";
            begin
                if "Stock Request No." <> xRec."Stock Request No." then begin
                    Unigroupsetup.Get;
                    NoSeriesMgmt.TestManual(Unigroupsetup."Stock Request No.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Stock Request Date"; Date)
        {
            Caption = 'Stock Request Date';
            DataClassification = ToBeClassified;
        }
        // field(3; "Stock Request Status"; Enum "Stock request status")
        // {
        //     Caption = 'Stock Request Status';
        //     DataClassification = ToBeClassified;
        // }
        field(4; "Requested By"; Text[50])
        {
            Caption = 'Requested By';
            DataClassification = ToBeClassified;
            TableRelation = user."User Name";
            Editable = false;
        }
        field(5; "Job Card No."; Code[20])
        {
            Caption = 'Job Card No.';
            DataClassification = ToBeClassified;
            TableRelation = "Workshop Jobs";
            Editable = false;
        }
        field(6; "Job Card Type"; Enum "Job Card Type")
        {
            Caption = 'Job Card Type';
            ObsoleteState = Removed;
            ObsoleteReason = 'Removed';
        }
        field(7; "Vehicle No."; Code[20])
        {
            Caption = 'Vehicle No.';
            DataClassification = ToBeClassified;
            Editable = false;
            trigger OnLookup()
            var
                FA: Record "Fixed Asset";
            begin
                FA.SetRange("Is trailer", false);
                if PAGE.RunModal(PAGE::"Vehicle List", FA) = ACTION::LookupOK then
                    Rec.Validate("Vehicle No.", FA."No.");
            end;
        }
        field(8; "Driver ID"; Code[20])
        {
            Caption = 'Driver ID';
            DataClassification = ToBeClassified;
            TableRelation = Employee where("Job Title" = const('Driver'));
            Editable = false;
        }
        field(9; "Issued To"; Code[20])
        {
            Caption = 'Issued To';
            DataClassification = ToBeClassified;
            TableRelation = Employee;

        }
        field(10; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
        }
        field(11; "Mechanic No."; Code[20])
        {
            Caption = 'Mechanic No.';
            DataClassification = ToBeClassified;
            TableRelation = Employee;
            trigger OnValidate()
            var
                Mechn: Record Employee;
            begin
                if Mechn.Get("Mechanic No.") then
                    "Mechanic Name" := Mechn.FullName()
                else
                    "Mechanic Name" := '';
            end;
        }
        field(12; "Mechanic Name"; Text[50])
        {
            Caption = 'Mechanic Name';
            DataClassification = ToBeClassified;
        }
        field(13; "Job Type"; Code[20])
        {
            Caption = 'Job Type';
            DataClassification = ToBeClassified;
            TableRelation = "Job Type";
        }
        field(100; "Created By"; Code[20])
        {
            Caption = 'Created By';
            DataClassification = ToBeClassified;
        }
        field(101; "Created Date"; Date)
        {
            Caption = 'Created Date';
            DataClassification = ToBeClassified;
        }
        field(102; "Last Modified by"; Code[20])
        {
            Caption = 'Last Modified by';
            DataClassification = ToBeClassified;
        }
        field(103; "Last Modified Date"; Date)
        {
            Caption = 'Last Modified Date';
            DataClassification = ToBeClassified;
        }
        field(104; "Global Dimension 1 Code"; Code[20])
        {
            Caption = 'Global Dimension 1 Code';
            DataClassification = ToBeClassified;
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(105; "Global Dimension 2 Code"; Code[20])
        {
            Caption = 'Global Dimension 2 Code';
            DataClassification = ToBeClassified;
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(106; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
        }
        field(107; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
        }
        field(108; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
        }
        field(109; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));

        }
        field(110; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
        }
        field(111; "Shortcut Dimension 8 Code"; Code[20])
        {
            CaptionClass = '1,2,8';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(8),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
        }

    }
    keys
    {
        key(PK; "Stock Request No.")
        {
            Clustered = true;
        }
    }


    trigger OnInsert()
    var
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        if "Stock Request No." = '' then begin
            Unigroupsetup.Get;
            Unigroupsetup.TestField("Stock Request No.");
            "No. Series" := Unigroupsetup."Stock Request No.";
           if NoSeriesMgmt.AreRelated(Unigroupsetup."Stock Request No.", xRec."No. Series")then
            "No. Series" := xRec."No. Series";
            "Stock Request No." := NoSeriesMgmt.GetNextNo("No. Series");

        end;
    end;

    procedure AssistEdit(StockRequestNoRec: Record "Stock request header"): Boolean
    var
        StockRequestNo: Record "Stock request header";
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        StockRequestNo := Rec;
        Unigroupsetup.Get;
        Unigroupsetup.TestField(Unigroupsetup."Stock Request No.");
        if NoSeriesMgmt.LookupRelatedNoSeries(Unigroupsetup."Stock Request No.", StockRequestNoRec."No. Series", "No. Series") then begin
            NoSeriesMgmt.GetNextNo(StockRequestNo."Stock Request No.", WorkDate(), true);
            Rec := StockRequestNo;
            exit(true);
        end;
    end;

    procedure PostStockRequest()
    var
        StockIssueHeader: Record "Stock Issue header";
        StockIssueline: Record "Stock Issue line";
        UnigroupSetup: Record "Unigroup Setup";
        NoSeriesMgt: Codeunit "No. Series";
        StockRequestHeader: Record "Stock request header";
        SRL, StockRequestline : Record "Stock request line";
        RequestPartServicesline: Record "Requested Parts/Service Line";
        LineNo: Integer;
        TempItemJnlLine2, TempItemJnlLine : Record "Item Journal Line" temporary;
        TmpDimSetEntry: Record "Dimension Set Entry" temporary;
        DimValue: Record "Dimension Value";
        DimMgmt: Codeunit DimensionManagement;
        GLSetup: Record "General Ledger Setup";
        JournalBatch: Record "Item Journal Batch";
        ItemJnlPostline2, ItemJnlPostline : Codeunit "Item Jnl.-Post Line";
        EventHandler: Codeunit "Event Handler";
    begin
        if not Confirm('Do you want to Issue Stock?', true) then
            exit else begin
            srl.Reset();
            SRL.SetRange("Document No.", Rec."Stock Request No.");
            SRL.SetFilter("Qty to Issue", '<>%1', 0);
            if not SRL.FindSet() then
                Error('There is nothing to post')
            else begin
                UnigroupSetup.Get();
                StockIssueHeader.Init();
                StockIssueHeader."Stock Issue No." := NoSeriesMgt.GetNextNo(UnigroupSetup."Stock Issue No.", Today, true);
                StockIssueHeader.Validate("Stock Issue Date", Today);
                StockIssueHeader.Validate("Job Card No.", Rec."Job Card No.");
                StockIssueHeader.Validate("Job Type", Rec."Job Type");
                StockIssueHeader.Validate("Driver ID", Rec."Driver ID");
                StockIssueHeader.Validate("Vehicle No.", Rec."Vehicle No.");
                StockIssueHeader.Validate("Issued To", Rec."Issued To");
                StockIssueHeader.Validate("Mechanic No.", Rec."Mechanic No.");
                StockIssueHeader.Validate("Mechanic Name", Rec."Mechanic Name");
                StockIssueHeader.Validate("Requested By", UserId);
                StockIssueHeader.Validate("Global Dimension 1 Code", Rec."Global Dimension 1 Code");
                StockIssueHeader.Validate("Global Dimension 2 Code", Rec."Global Dimension 2 Code");
                StockIssueHeader.Validate("Shortcut Dimension 3 Code", Rec."Shortcut Dimension 3 Code");
                StockIssueHeader.Validate("Shortcut Dimension 4 Code", Rec."Shortcut Dimension 4 Code");
                StockIssueHeader.Validate("Shortcut Dimension 5 Code", Rec."Shortcut Dimension 5 Code");
                StockIssueHeader.Validate("Shortcut Dimension 6 Code", Rec."Shortcut Dimension 6 Code");
                StockIssueHeader.Validate("Shortcut Dimension 7 Code", Rec."Shortcut Dimension 7 Code");
                StockIssueHeader.Validate("Shortcut Dimension 8 Code", Rec."Shortcut Dimension 8 Code");
                StockIssueHeader.Insert();
                StockRequestline.Reset();
                StockRequestline.SetRange("Document No.", Rec."Stock Request No.");
                StockRequestline.SetFilter("Qty to Issue", '<>%1', 0);
                if StockRequestline.FindFirst() then
                    repeat
                        LineNo += 10000;
                        StockIssueline.Init();
                        StockIssueline."Document No." := StockIssueHeader."Stock Issue No.";
                        StockIssueline."Line No." := LineNo;
                        StockIssueline."Job Card No." := StockIssueHeader."Job Card No.";
                        StockIssueline."Stock Request No." := StockRequestline."Document No.";
                        StockIssueline.Validate("No.", StockRequestline."No.");
                        StockIssueline.Validate(Description, StockRequestline.Description);
                        StockIssueline.Validate(Quantity, StockRequestline."Qty to Issue");
                        StockIssueline.Validate("Scrap Item No.", StockRequestline."Scrap Item No.");
                        StockIssueline."Job Line No." := StockRequestline."Job Line No.";
                        StockIssueline.Validate("Global Dimension 1 Code", StockRequestline."Global Dimension 1 Code");
                        StockIssueline.Validate("Global Dimension 2 Code", StockRequestline."Global Dimension 2 Code");
                        StockIssueline.Validate("Shortcut Dimension 3 Code", StockRequestline."Shortcut Dimension 3 Code");
                        StockIssueline.Validate("Shortcut Dimension 4 Code", StockRequestline."Shortcut Dimension 4 Code");
                        StockIssueline.Validate("Shortcut Dimension 5 Code", StockRequestline."Shortcut Dimension 5 Code");
                        StockIssueline.Validate("Shortcut Dimension 6 Code", StockRequestline."Shortcut Dimension 6 Code");
                        StockIssueline.Validate("Shortcut Dimension 7 Code", StockRequestline."Shortcut Dimension 7 Code");
                        StockIssueline.Validate("Shortcut Dimension 8 Code", StockRequestline."Shortcut Dimension 8 Code");
                        StockIssueline.Insert();
                        //ItemJnlLine
                        TempItemJnlLine.Init();
                        Unigroupsetup.Get();
                        TempItemJnlLine."Journal Template Name" := Unigroupsetup."Fuel Consumption Template Name";
                        TempItemJnlLine."Journal Batch Name" := Unigroupsetup."Fuel Consumption Batch Name";
                        TempItemJnlLine."Line No." := StockIssueline."Line No.";
                        TempItemJnlLine."Entry Type" := TempItemJnlLine."Entry Type"::"Negative Adjmt.";
                        TempItemJnlLine."Posting Date" := WorkDate();
                        TempItemJnlLine."Document No." := StockRequestline."Document No.";
                        TempItemJnlLine.Validate("Item No.", StockRequestline."No.");
                        TempItemJnlLine.Validate(Quantity, StockRequestline."Qty to Issue");
                        TempItemJnlLine.Validate("Location Code", StockRequestline."Shortcut Dimension 6 Code");
                        TempItemJnlLine.Insert(true);
                        ItemJnlPostline.RunWithCheck(TempItemJnlLine);
                        if StockRequestline."Scrap Applicable?" then begin
                            //Scrap
                            if StockRequestline."Scrap Quantity" = 0 then
                                error('Scrap Quantity should not be 0');

                            TempItemJnlLine2.Init();
                            Unigroupsetup.Get();
                            TempItemJnlLine2."Journal Template Name" := Unigroupsetup."Fuel Consumption Template Name";
                            TempItemJnlLine2."Journal Batch Name" := Unigroupsetup."Fuel Consumption Batch Name";
                            TempItemJnlLine2."Line No." := StockIssueline."Line No.";
                            TempItemJnlLine2."Entry Type" := TempItemJnlLine2."Entry Type"::"Positive Adjmt.";
                            TempItemJnlLine2."Posting Date" := WorkDate();
                            TempItemJnlLine2."Document No." := StockRequestline."Document No.";
                            TempItemJnlLine2.Validate("Item No.", StockRequestline."Scrap Item No.");
                            TempItemJnlLine2.Validate(Quantity, StockRequestline."Scrap Quantity");
                            TempItemJnlLine2.Validate("Location Code", EventHandler.GetScrapLocation(StockRequestline."Shortcut Dimension 6 Code"));
                            TempItemJnlLine2.Insert(true);
                            ItemJnlPostline.RunWithCheck(TempItemJnlLine2);
                        end;
                        StockRequestline."Qty Issued" := StockRequestline."Qty Issued" + StockRequestline."Qty to Issue";
                        StockRequestline.Modify();
                        StockRequestline."Qty to Issue" := StockRequestline.quantity - StockRequestline."Qty Issued";
                        StockRequestline.Modify();

                    until StockRequestline.Next() = 0;
                Message('Stock issued successfully with Issue No. %1', StockIssueHeader."Stock Issue No.");
            end;
        end;
    end;

    procedure CreatePurchaseOrder()
    var
        PurchaseQuoteHeader: Record "Purchase Header";
        PurchaseorderHeader: Record "Purchase Header";
        PurchaseQuoteline: Record "Purchase Line";
        PurchaseOrderline: Record "Purchase Line";
        purchSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit "No. Series";
        StockRequestline: Record "Stock request line";
        StockRequestHeader: Record "Stock request header";
        LineNo: Integer;
    begin
        if not Confirm('Do you want to create Purchase Order?', true) then
            exit else begin
            StockRequestline.Reset();
            StockRequestline.SetCurrentKey("Vendor No.");
            StockRequestline.SetRange("Document No.", Rec."Stock Request No.");
            StockRequestline.SetFilter("Purchase Quote No.", '<>%1', '');
            if StockRequestline.FindFirst then
                repeat
                    PurchaseQuoteHeader.Reset();
                    PurchaseQuoteHeader.SetRange("Document Type", PurchaseQuoteHeader."Document Type"::Quote);
                    PurchaseQuoteHeader.SetRange("No.", StockRequestline."Purchase Quote No.");
                    PurchaseQuoteHeader.SetFilter(Status, '%1', PurchaseQuoteHeader.Status::Released);
                    if PurchaseQuoteHeader.FindFirst then begin
                        purchSetup.Get();
                        PurchaseorderHeader.Init();
                        PurchaseorderHeader."Document Type" := PurchaseorderHeader."Document Type"::Order;
                        PurchaseorderHeader."No." := NoSeriesMgt.GetNextNo(purchSetup."Order Nos.", Today, true);
                        PurchaseorderHeader.Validate("Buy-from Vendor No.", PurchaseQuoteHeader."Buy-from Vendor No.");
                        PurchaseorderHeader.Validate("Posting Date", Today);
                        PurchaseorderHeader.Validate("Job Card No.", PurchaseQuoteHeader."Job Card No.");
                        PurchaseorderHeader.Insert();
                        PurchaseQuoteline.Reset();
                        PurchaseQuoteline.SetRange("Document Type", PurchaseQuoteline."Document Type"::Quote);
                        PurchaseQuoteline.SetRange("Document No.", PurchaseQuoteHeader."No.");
                        if PurchaseQuoteline.FindFirst() then
                            repeat
                                LineNo += 10000;
                                PurchaseOrderline.Init();
                                PurchaseOrderline."Document Type" := PurchaseOrderline."Document Type"::Order;
                                PurchaseOrderline."Document No." := PurchaseorderHeader."No.";
                                PurchaseOrderline."Line No." := LineNo;
                                PurchaseOrderline.Type := PurchaseQuoteline.Type;
                                PurchaseOrderline.Validate("No.", PurchaseQuoteline."No.");
                                PurchaseOrderline.Validate(Description, PurchaseQuoteline.Description);
                                PurchaseOrderline.Validate(Quantity, PurchaseQuoteline.Quantity);
                                PurchaseOrderline.Validate("Unit of Measure", PurchaseQuoteline."Unit of Measure");
                                PurchaseOrderline.Validate("Unit Cost", PurchaseQuoteline."Unit Cost");
                                PurchaseOrderline.Insert();
                                StockRequestline.Modify();
                            until PurchaseQuoteline.Next() = 0;
                    end;
                until StockRequestline.Next() = 0;
        end;
    end;
}