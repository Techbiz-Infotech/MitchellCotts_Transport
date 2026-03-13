table 50147 "Fuel Cards"
{
    Caption = 'Fuel Cards';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Fuel Card No."; Code[20])
        {
            Caption = 'Fuel Card No.';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Unigroupsetup: Record "Unigroup Setup";
                NoSeriesMgmt: Codeunit "No. Series";
            begin
                if "Fuel Card No." <> xRec."Fuel Card No." then begin
                    Unigroupsetup.Get;
                    NoSeriesMgmt.TestManual(Unigroupsetup."Fuel Card No.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Transaction limit"; Text[50])
        {
            Caption = 'Transaction Limit';
            DataClassification = ToBeClassified;
        }
        field(3; "Fuel Type"; Enum "Fuel Type")
        {
            Caption = 'Fuel Type';
            DataClassification = ToBeClassified;
        }
        field(4; "Payroll No"; Code[20])
        {
            Caption = 'Payroll No';
            DataClassification = ToBeClassified;
            TableRelation = Employee;
        }
        field(6; Department; Text[100])
        {
            Caption = 'Department';
            DataClassification = ToBeClassified;
        }
        field(7; System; Text[50])
        {
            Caption = 'System';
            DataClassification = ToBeClassified;
        }
        field(8; Expiry; Date)
        {
            Caption = 'Expiry';
            DataClassification = ToBeClassified;
        }
        field(9; "Vehicle No."; Code[20])
        {
            Caption = 'Vehicle No.';
            DataClassification = ToBeClassified;
            TableRelation = "Fixed Asset";
        }
        field(10; "Driver ID"; Code[20])
        {
            Caption = 'Driver ID';
            DataClassification = ToBeClassified;
            TableRelation = Employee where("Job Title" = const('Driver'));
            trigger OnValidate()
            var
                DriverIDRec: Record Employee;
            begin
                IF DriverIDRec.Get("Driver ID") THEN
                    "Driver Name" := DriverIDRec.FullName()
                ELSE
                    "Driver Name" := '';
            end;
        }
        field(11; "Driver Name"; Text[50])
        {
            Caption = 'Driver Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "Key status"; Text[50])
        {
            Caption = 'Key status';
            DataClassification = ToBeClassified;
        }
        field(13; "Key format"; Text[50])
        {
            Caption = 'Key Format';
            DataClassification = ToBeClassified;
        }
        field(14; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
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
        key(PK; "Fuel Card No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        if "Fuel Card No." = '' then begin
            Unigroupsetup.Get;
            Unigroupsetup.TestField("Fuel Card No.");
            "No. Series" := Unigroupsetup."Fuel Card No.";
            if NoSeriesMgmt.AreRelated(Unigroupsetup."Fuel Card No.", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "Fuel Card No." := NoSeriesMgmt.GetNextNo("No. Series");

        end;
    end;

    procedure AssistEdit(FuelCardNoRec: Record "Fuel Cards"): Boolean
    var
        FuelCardNo: Record "Fuel Cards";
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        FuelCardNo := Rec;
        Unigroupsetup.Get;
        Unigroupsetup.TestField(Unigroupsetup."Fuel Card No.");
        if NoSeriesMgmt.LookupRelatedNoSeries(Unigroupsetup."Fuel Card No.", FuelCardNoRec."No. Series", "No. Series") then begin
            NoSeriesMgmt.GetNextNo("Fuel Card No.");
            Rec := FuelCardNo;
            exit(true);
        end;
    end;
}
