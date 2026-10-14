table 57045 Disposal
{

    Caption = 'Disposal';
    DataClassification = CustomerContent;
    LookupPageId = "Disposal Request List";
    DrillDownPageId = "Disposal Request List";
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';

            trigger OnValidate()
            var
                NoSeries: Codeunit "No. Series";
            begin
                if "No." <> xRec."No." then begin
                    InvSetup.Get();
                    NoSeries.TestManual(InvSetup."Disposal Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Disposal Need"; Enum "Disposal Need")
        {
            Caption = 'Disposal Need';

            trigger OnValidate()
            begin
                TestStatusOpen();
                // Default the type from the need; user can still change it.
                case "Disposal Need" of
                    "Disposal Need"::"Obsolete Asset":
                        Validate(Type, Type::Asset);
                    "Disposal Need"::"Damaged Inventory",
                    "Disposal Need"::"Contaminated Oil/Fuel":
                        Validate(Type, Type::Item);
                end;
            end;
        }
        field(3; Type; Enum "Disposal Type")
        {
            Caption = 'Type';

            trigger OnValidate()
            begin
                TestStatusOpen();
                if Type <> xRec.Type then begin
                    "Asset/Item No." := '';
                    ClearSourceFields();
                    "Disposal Method" := "Disposal Method"::" ";
                end;
            end;
        }
        field(4; "Asset/Item No."; Code[20])
        {
            Caption = 'Asset/Item No.';
            TableRelation = if (Type = const(Asset)) "Fixed Asset"."No."
            else
            if (Type = const(Item)) Item."No.";

            trigger OnValidate()
            begin
                TestStatusOpen();
                if "Asset/Item No." = '' then begin
                    ClearSourceFields();
                    exit;
                end;
                TestField(Type);
                case Type of
                    Type::Asset:
                        FillFromFixedAsset();
                    Type::Item:
                        FillFromItem();
                end;
            end;
        }
        field(5; Description; Text[100])
        {
            Caption = 'Description';
            Editable = false;
        }
        field(6; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
            MinValue = 0;

            trigger OnValidate()
            begin
                TestStatusOpen();
                if Type = Type::Asset then
                    TestField(Quantity, 1);
                if Type = Type::Item then
                    CalcItemValue();
            end;
        }
        field(7; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            Editable = false;
        }
        field(8; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = if (Type = const(Asset)) "FA Location".Code
            else
            if (Type = const(Item)) Location.Code;
        }
        field(9; "Reason for Disposal"; Text[250])
        {
            Caption = 'Reason for Disposal';
        }
        field(10; "Request Date"; Date)
        {
            Caption = 'Request Date';
        }
        field(11; "Requested By"; Code[50])
        {
            Caption = 'Requested By';
            Editable = false;
            DataClassification = EndUserIdentifiableInformation;
        }
        field(12; Status; Enum "Disposal Status")
        {
            Caption = 'Status';
            Editable = false;
        }
        field(13; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }

        // ---------- 10.3 / 10.4  Technical inspection ----------
        field(20; "Condition Assessment"; Text[250]) { Caption = 'Condition Assessment'; }
        field(21; "Repair vs Replace Analysis"; Text[250]) { Caption = 'Repair vs Replace Analysis'; }
        field(22; Recommendation; Enum "Disposal Recommendation") { Caption = 'Scrap/Reusable Recommendation'; }
        field(23; "Technical Report"; Text[2048]) { Caption = 'Technical Disposal Report'; }
        field(24; "Inspected By"; Code[50])
        {
            Caption = 'Inspected By';
            Editable = false;
            DataClassification = EndUserIdentifiableInformation;
        }
        field(25; "Inspection Date"; Date) { Caption = 'Inspection Date'; Editable = false; }

        // ---------- 10.5  Inventory controller verification ----------
        field(30; "Quantity Confirmed"; Decimal)
        {
            Caption = 'Quantity Confirmed';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(31; "Asset Register Validated"; Boolean) { Caption = 'Asset Register Validated'; }
        field(32; "Ownership Confirmed"; Boolean) { Caption = 'Ownership/Control Confirmed'; }
        field(33; "Verified By"; Code[50])
        {
            Caption = 'Verified By';
            Editable = false;
            DataClassification = EndUserIdentifiableInformation;
        }
        field(34; "Verification Date"; Date) { Caption = 'Verification Date'; Editable = false; }

        // ---------- 10.6  Financial assessment ----------
        field(40; "Net Book Value"; Decimal)
        {
            Caption = 'Net Book Value';
            AutoFormatType = 1;
            Editable = false;
        }
        field(41; "Residual Value Estimate"; Decimal)
        {
            Caption = 'Residual Value Estimate';
            AutoFormatType = 1;
            MinValue = 0;
        }
        field(42; "Impairment Review"; Text[250]) { Caption = 'Impairment Review'; }
        field(43; "Assessed By"; Code[50])
        {
            Caption = 'Assessed By';
            Editable = false;
            DataClassification = EndUserIdentifiableInformation;
        }

        // ---------- 10.7 / 10.8  Approval ----------

        field(51; "Approved By"; Code[50])
        {
            Caption = 'Approved By';
            Editable = false;
            DataClassification = EndUserIdentifiableInformation;
        }
        field(52; "Approval Date"; Date) { Caption = 'Approval Date'; Editable = false; }
        field(53; "Rejection Comment"; Text[250]) { Caption = 'Rejection Comment'; }
        field(54; "Rejection Count"; Integer) { Caption = 'Rejection Count'; Editable = false; }

        // ---------- 10.9 - 10.13  Method & execution ----------
        field(60; "Disposal Method"; Enum "Disposal Method")
        {
            Caption = 'Disposal Method';

            trigger OnValidate()
            var
                DisposalMgt: Codeunit "Disposal Management";
            begin
                if "Disposal Method" <> "Disposal Method"::" " then
                    DisposalMgt.CheckMethodAllowed(Rec);
            end;
        }
        field(61; "Execution Date"; Date) { Caption = 'Execution Date'; }
        field(62; "Operations Witness"; Text[100]) { Caption = 'Operations Witness'; }
        field(63; "Finance Witness"; Text[100]) { Caption = 'Finance Witness'; }
        field(64; "Receipt No."; Code[35]) { Caption = 'Official Receipt No.'; }
        field(65; "Proceeds Amount"; Decimal)
        {
            Caption = 'Proceeds Amount';
            AutoFormatType = 1;
            MinValue = 0;
        }

        field(70; "Gain/Loss Amount"; Decimal)
        {
            Caption = 'Gain/Loss Amount';
            AutoFormatType = 1;
            Editable = false;
        }
        field(71; "System Updated By"; Code[50])
        {
            Caption = 'System Updated By';
            Editable = false;
            DataClassification = EndUserIdentifiableInformation;
        }
        field(72; "System Update Date"; Date) { Caption = 'System Update Date'; Editable = false; }

        // ---------- 10.16  Audit review ----------
        field(80; "Review Notes"; Text[250]) { Caption = 'Post-Disposal Review Notes'; }
        field(81; "Reviewed By"; Code[50])
        {
            Caption = 'Reviewed By';
            Editable = false;
            DataClassification = EndUserIdentifiableInformation;
        }
        field(82; "Review Date"; Date) { Caption = 'Review Date'; Editable = false; }
    }

    keys
    {
        key(PK; "No.") { Clustered = true; }
    }

    var
        InvSetup: Record "Unigroup Setup";

    trigger OnInsert()
    var
        NoSeries: Codeunit "No. Series";
    begin
        if "No." = '' then begin
            InvSetup.Get();
            InvSetup.TestField("Disposal Nos.");
            "No. Series" := InvSetup."Disposal Nos.";
            "No." := NoSeries.GetNextNo("No. Series");
        end;
        "Request Date" := WorkDate();
        "Requested By" := CopyStr(UserId(), 1, MaxStrLen("Requested By"));
    end;

    trigger OnDelete()
    begin
        TestStatusOpen();
    end;

    procedure TestStatusOpen()
    begin
        TestField(Status, Status::Open);
    end;

    local procedure ClearSourceFields()
    begin
        Description := '';
        Quantity := 0;
        "Unit of Measure Code" := '';
        "Location Code" := '';
        "Net Book Value" := 0;
    end;

    local procedure FillFromFixedAsset()
    var
        FixedAsset: Record "Fixed Asset";
    begin
        FixedAsset.Get("Asset/Item No.");
        FixedAsset.TestField(Blocked, false);
        FixedAsset.TestField(Inactive, false);
        Description := FixedAsset.Description;
        "Location Code" := FixedAsset."FA Location Code";
        "Unit of Measure Code" := '';
        Quantity := 1;
        "Net Book Value" := GetFABookValue();
    end;

    local procedure FillFromItem()
    var
        Item: Record Item;
    begin
        Item.Get("Asset/Item No.");
        Item.TestField(Blocked, false);
        Description := Item.Description;
        "Unit of Measure Code" := Item."Base Unit of Measure";
        if Quantity = 0 then
            Quantity := 1;
        CalcItemValue();
    end;

    procedure CalcItemValue()
    var
        Item: Record Item;
    begin
        if (Type <> Type::Item) or ("Asset/Item No." = '') then
            exit;
        Item.Get("Asset/Item No.");
        "Net Book Value" := Round(Quantity * Item."Unit Cost");
    end;

    procedure GetFABookValue(): Decimal
    var
        FASetup: Record "FA Setup";
        FADeprBook: Record "FA Depreciation Book";
    begin
        FASetup.Get();
        FASetup.TestField("Default Depr. Book");
        if not FADeprBook.Get("Asset/Item No.", FASetup."Default Depr. Book") then
            exit(0);
        FADeprBook.CalcFields("Book Value");
        exit(FADeprBook."Book Value");
    end;
}
