codeunit 57008 "Disposal management"
{
    var
        MethodNotAllowedErr: Label 'Disposal method %1 is not allowed for %2.', Comment = '%1 = method, %2 = asset/inventory/fuel';
        InsufficientStockErr: Label 'Only %1 %2 of item %3 is available at location %4, but %5 is to be disposed.', Comment = '%1 = available, %2 = UoM, %3 = item, %4 = location, %5 = qty';
        AlreadyDisposedErr: Label 'Fixed asset %1 has already been disposed of on %2.', Comment = '%1 = FA No., %2 = date';
        ProceedsRequiredErr: Label 'Proceeds Amount and Official Receipt No. are required for disposal method %1.', Comment = '%1 = method';
        RejectQst: Label 'Reject disposal %1 and send it back to Finance for re-assessment?', Comment = '%1 = No.';
        FAJnlCreatedMsg: Label 'An FA disposal line has been created in journal %1 / %2. Add the balancing account and post it from the FA G/L Journal.', Comment = '%1 = template, %2 = batch';
        ItemPostedMsg: Label 'Item %1 has been written off (negative adjustment of %2).', Comment = '%1 = item, %2 = qty';
        SupplierReturnMsg: Label 'Stock is not adjusted here for a supplier return. Post a purchase return order for item %1 instead.', Comment = '%1 = item';

    // 10.2 -> 10.3
    procedure SubmitRequest(var Disposal: Record Disposal)
    begin
        Disposal.TestField(Status, Disposal.Status::Open);
        Disposal.TestField("Disposal Need");
        Disposal.TestField(Type);
        Disposal.TestField("Asset/Item No.");
        Disposal.TestField(Quantity);
        Disposal.TestField("Reason for Disposal");
        SetStatus(Disposal, Disposal.Status::"Technical Inspection");
    end;

    // 10.3 / 10.4 -> 10.5
    procedure CompleteInspection(var Disposal: Record Disposal)
    begin
        Disposal.TestField(Status, Disposal.Status::"Technical Inspection");
        Disposal.TestField("Condition Assessment");
        Disposal.TestField("Repair vs Replace Analysis");
        Disposal.TestField(Recommendation);
        Disposal.TestField("Technical Report");
        Disposal."Inspected By" := CurrentUser();
        Disposal."Inspection Date" := Today();
        SetStatus(Disposal, Disposal.Status::"Inventory Verification");
    end;

    // 10.5 -> 10.6
    procedure VerifyInventory(var Disposal: Record Disposal)
    begin
        Disposal.TestField(Status, Disposal.Status::"Inventory Verification");
        Disposal.TestField("Quantity Confirmed", Disposal.Quantity);
        Disposal.TestField("Asset Register Validated", true);
        Disposal.TestField("Ownership Confirmed", true);

        case Disposal.Type of
            Disposal.Type::Item:
                CheckItemStock(Disposal);
            Disposal.Type::Asset:
                CheckAssetNotDisposed(Disposal);
        end;

        Disposal."Verified By" := CurrentUser();
        Disposal."Verification Date" := Today();
        SetStatus(Disposal, Disposal.Status::"Financial Assessment");
    end;

    // 10.6 -> 10.7
    procedure CompleteFinancialAssessment(var Disposal: Record Disposal)
    begin
        Disposal.TestField(Status, Disposal.Status::"Financial Assessment");
        Disposal.TestField("Impairment Review");

        // Refresh value at the point of assessment
        if Disposal.Type = Disposal.Type::Asset then
            Disposal."Net Book Value" := Disposal.GetFABookValue()
        else
            Disposal.CalcItemValue();

        Disposal."Assessed By" := CurrentUser();
        Disposal."Rejection Comment" := '';
        SetStatus(Disposal, Disposal.Status::"Pending Approval");
    end;

    // 10.8 Yes
    procedure Approve(var Disposal: Record Disposal)
    begin
        Disposal.TestField(Status, Disposal.Status::"Pending Approval");
        OnBeforeApprove(Disposal); // hook for approver-level checks / standard approvals
        Disposal."Approved By" := CurrentUser();
        Disposal."Approval Date" := Today();
        SetStatus(Disposal, Disposal.Status::Approved);
    end;

    // 10.8 No -> back to 10.6
    procedure Reject(var Disposal: Record Disposal)
    begin
        Disposal.TestField(Status, Disposal.Status::"Pending Approval");
        Disposal.TestField("Rejection Comment");
        if not Confirm(RejectQst, false, Disposal."No.") then
            exit;
        Disposal."Rejection Count" += 1;
        SetStatus(Disposal, Disposal.Status::"Financial Assessment");
    end;

    // 10.9 - 10.13
    procedure ExecuteDisposal(var Disposal: Record Disposal)
    begin
        Disposal.TestField(Status, Disposal.Status::Approved);
        Disposal.TestField("Disposal Method");
        CheckMethodAllowed(Disposal);
        Disposal.TestField("Execution Date");
        Disposal.TestField("Operations Witness");
        Disposal.TestField("Finance Witness");

        if Disposal."Disposal Method" in [Disposal."Disposal Method"::Auction,
                                          Disposal."Disposal Method"::Tender,
                                          Disposal."Disposal Method"::"Trade-in"] then
            if (Disposal."Proceeds Amount" = 0) or (Disposal."Receipt No." = '') then
                Error(ProceedsRequiredErr, Disposal."Disposal Method");

        SetStatus(Disposal, Disposal.Status::Executed);
    end;

    // 10.14 / 10.15
    procedure UpdateSystem(var Disposal: Record Disposal)
    begin
        Disposal.TestField(Status, Disposal.Status::Executed);
        Disposal."Gain/Loss Amount" := Disposal."Proceeds Amount" - Disposal."Net Book Value";

        case Disposal.Type of
            Disposal.Type::Item:
                PostItemDisposal(Disposal);
            Disposal.Type::Asset:
                CreateFADisposalJnlLine(Disposal);
        end;

        Disposal."System Updated By" := CurrentUser();
        Disposal."System Update Date" := Today();
        SetStatus(Disposal, Disposal.Status::"System Updated");
    end;

    // 10.16
    procedure CompleteReview(var Disposal: Record Disposal)
    begin
        Disposal.TestField(Status, Disposal.Status::"System Updated");
        Disposal.TestField("Review Notes");
        Disposal."Reviewed By" := CurrentUser();
        Disposal."Review Date" := Today();
        SetStatus(Disposal, Disposal.Status::Closed);
    end;

    // 10.9 routing: asset -> 10.10, inventory -> 10.11, fuel -> 10.12
    procedure CheckMethodAllowed(Disposal: Record Disposal)
    var
        M: Enum "Disposal Method";
    begin
        M := Disposal."Disposal Method";
        case true of
            Disposal."Disposal Need" = Disposal."Disposal Need"::"Contaminated Oil/Fuel":
                if not (M in [M::"Controlled Draining", M::"Supplier Return", M::"Write Off"]) then
                    Error(MethodNotAllowedErr, M, 'fuel');
            Disposal.Type = Disposal.Type::Asset:
                if not (M in [M::Auction, M::Tender, M::Scrap, M::"Trade-in"]) then
                    Error(MethodNotAllowedErr, M, 'assets');
            Disposal.Type = Disposal.Type::Item:
                if not (M in [M::Scrap, M::"Supplier Return", M::"Write Off"]) then
                    Error(MethodNotAllowedErr, M, 'inventory');
        end;
    end;



    local procedure CheckItemStock(Disposal: Record Disposal)
    var
        Item: Record Item;
    begin
        Item.Get(Disposal."Asset/Item No.");
        if Disposal."Location Code" <> '' then
            Item.SetRange("Location Filter", Disposal."Location Code");
        Item.CalcFields(Inventory);
        if Item.Inventory < Disposal.Quantity then
            Error(InsufficientStockErr, Item.Inventory, Disposal."Unit of Measure Code",
                  Item."No.", Disposal."Location Code", Disposal.Quantity);
    end;

    local procedure CheckAssetNotDisposed(Disposal: Record Disposal)
    var
        FASetup: Record "FA Setup";
        FADeprBook: Record "FA Depreciation Book";
    begin
        FASetup.Get();
        if FADeprBook.Get(Disposal."Asset/Item No.", FASetup."Default Depr. Book") then
            if FADeprBook."Disposal Date" <> 0D then
                Error(AlreadyDisposedErr, Disposal."Asset/Item No.", FADeprBook."Disposal Date");
    end;

    local procedure PostItemDisposal(Disposal: Record Disposal)
    var
        ItemJnlLine: Record "Item Journal Line";
        ItemJnlPostLine: Codeunit "Item Jnl.-Post Line";
    begin
        if Disposal."Disposal Method" = Disposal."Disposal Method"::"Supplier Return" then begin
            Message(SupplierReturnMsg, Disposal."Asset/Item No.");
            exit;
        end;

        ItemJnlLine.Init();
        ItemJnlLine.Validate("Posting Date", Disposal."Execution Date");
        ItemJnlLine."Document No." := Disposal."No.";
        ItemJnlLine.Validate("Entry Type", ItemJnlLine."Entry Type"::"Negative Adjmt.");
        ItemJnlLine.Validate("Item No.", Disposal."Asset/Item No.");
        ItemJnlLine.Validate("Location Code", Disposal."Location Code");
        ItemJnlLine.Validate(Quantity, Disposal.Quantity);
        ItemJnlLine.Description := CopyStr(StrSubstNo('Disposal %1 - %2', Disposal."No.", Disposal."Disposal Method"),
                                           1, MaxStrLen(ItemJnlLine.Description));
        OnBeforePostItemDisposal(Disposal, ItemJnlLine);
        ItemJnlPostLine.RunWithCheck(ItemJnlLine);
        Message(ItemPostedMsg, Disposal."Asset/Item No.", Disposal.Quantity);
    end;

    local procedure CreateFADisposalJnlLine(Disposal: Record Disposal)
    var
        InvSetup: Record "Unigroup Setup";
        FASetup: Record "FA Setup";
        GenJnlLine: Record "Gen. Journal Line";
        LineNo: Integer;
    begin
        InvSetup.Get();
        InvSetup.TestField("Disposal FA Jnl. Template");
        InvSetup.TestField("Disposal FA Jnl. Batch");
        FASetup.Get();

        GenJnlLine.SetRange("Journal Template Name", InvSetup."Disposal FA Jnl. Template");
        GenJnlLine.SetRange("Journal Batch Name", InvSetup."Disposal FA Jnl. Batch");
        if GenJnlLine.FindLast() then
            LineNo := GenJnlLine."Line No.";

        GenJnlLine.Init();
        GenJnlLine."Journal Template Name" := InvSetup."Disposal FA Jnl. Template";
        GenJnlLine."Journal Batch Name" := InvSetup."Disposal FA Jnl. Batch";
        GenJnlLine."Line No." := LineNo + 10000;
        GenJnlLine.Validate("Posting Date", Disposal."Execution Date");
        GenJnlLine."Document No." := Disposal."No.";
        GenJnlLine.Validate("Account Type", GenJnlLine."Account Type"::"Fixed Asset");
        GenJnlLine.Validate("Account No.", Disposal."Asset/Item No.");
        GenJnlLine.Validate("FA Posting Type", GenJnlLine."FA Posting Type"::Disposal);
        GenJnlLine.Validate("Depreciation Book Code", FASetup."Default Depr. Book");
        GenJnlLine.Validate(Amount, -Disposal."Proceeds Amount");
        GenJnlLine."External Document No." := Disposal."Receipt No.";
        GenJnlLine.Description := CopyStr(StrSubstNo('Disposal %1 - %2', Disposal."No.", Disposal."Disposal Method"),
                                          1, MaxStrLen(GenJnlLine.Description));
        OnBeforeInsertFADisposalJnlLine(Disposal, GenJnlLine);
        GenJnlLine.Insert(true);

        Message(FAJnlCreatedMsg, GenJnlLine."Journal Template Name", GenJnlLine."Journal Batch Name");
    end;

    local procedure SetStatus(var Disposal: Record Disposal; NewStatus: Enum "Disposal Status")
    begin
        Disposal.Status := NewStatus;
        Disposal.Modify(true);
    end;

    local procedure CurrentUser(): Code[50]
    begin
        exit(CopyStr(UserId(), 1, 50));
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeApprove(var Disposal: Record Disposal)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforePostItemDisposal(Disposal: Record Disposal; var ItemJnlLine: Record "Item Journal Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeInsertFADisposalJnlLine(Disposal: Record Disposal; var GenJnlLine: Record "Gen. Journal Line")
    begin
    end;
}

