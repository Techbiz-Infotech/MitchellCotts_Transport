table 50131 "Mobility Details"
{
    Caption = 'Mobility Details';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Mobility No."; Code[20])
        {
            Caption = 'Mobility No.';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Unigroupsetup: Record "Unigroup Setup";
                NoSeriesMgmt: Codeunit "No. Series";
            begin
                if "Mobility No." <> xRec."Mobility No." then begin
                    Unigroupsetup.Get;
                    NoSeriesMgmt.TestManual(Unigroupsetup."Mobility No.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Driver ID"; Code[20])
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
        field(3; "Driver Name"; Text[50])
        {
            Caption = 'Driver Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; "Start Date"; Date)
        {
            Caption = 'Start Date';
            DataClassification = ToBeClassified;
        }
        field(5; "End Date"; Date)
        {
            Caption = 'End Date';
            DataClassification = ToBeClassified;
        }
        field(6; "Budget Total"; Decimal)
        {
            Caption = 'Budget Total';
            DataClassification = ToBeClassified;
        }
        field(7; "Spend Total"; Decimal)
        {
            Caption = 'Spend Total';
            DataClassification = ToBeClassified;
        }
        field(8; "Budget Balance"; Decimal)
        {
            Caption = 'Budget Balance';
            DataClassification = ToBeClassified;
        }
        field(9; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
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
        key(PK; "Mobility No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        if "Mobility No." = '' then begin
            Unigroupsetup.Get;
            Unigroupsetup.TestField("Mobility No.");
            "No. Series" := Unigroupsetup."Mobility No.";
            if NoSeriesMgmt.AreRelated(Unigroupsetup."Mobility No.", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "Mobility No." := NoSeriesMgmt.GetNextNo("No. Series");
        end;
    end;


    procedure AssistEdit(MobilityNoRec: Record "Mobility Details"): Boolean
    var
        MobilityNo: Record "Mobility Details";
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        MobilityNo := Rec;
        Unigroupsetup.Get;
        Unigroupsetup.TestField(Unigroupsetup."Mobility No.");
        if NoSeriesMgmt.LookupRelatedNoSeries(Unigroupsetup."Mobility No.", MobilityNoRec."No. Series", "No. Series") then begin
            NoSeriesMgmt.GetNextNo(MobilityNo."Mobility No.", WorkDate(), true);
            Rec := MobilityNo;
            exit(true);
        end;
    end;
}
