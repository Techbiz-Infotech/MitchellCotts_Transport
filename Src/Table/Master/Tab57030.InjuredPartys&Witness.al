table 57030 "Injured Partys"
{
    Caption = 'Injured Partys';
    DataClassification = ToBeClassified;
    LookupPageId = "Injured Partys List";
    DataCaptionFields = "Injured Party ID", "Injured Party Type";
    DrillDownPageId = "Injured Partys List";

    fields
    {
        field(1; "Injured Party Type"; Enum "Injured Partys Type")
        {
            Caption = 'Injured Party Type';
            DataClassification = ToBeClassified;
        }
        field(2; "Injured Party ID"; Code[20])
        {
            Caption = 'Injured Party ID';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Unigroupsetup: Record "Unigroup Setup";
                NoSeriesMgmt: Codeunit "No. Series";
            begin
                if "Injured Party ID" <> xRec."Injured Party ID" then begin
                    Unigroupsetup.Get;
                    NoSeriesMgmt.TestManual(GetNoSeriesCode);
                    "No. Series" := '';
                end;
            end;
        }
        field(3; "Accident ref."; Code[20])
        {
            Caption = 'Accident ref.';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                AccidentrefRec: Record Accidents;
            begin
                IF AccidentrefRec.Get("Accident ref.") THEN
                    "Accident Date" := AccidentrefRec."Accident Date"
                ELSE
                    "Accident Date" := 0D;
            end;
        }
        field(4; "Accident Date"; Date)
        {
            Caption = 'Accident Date';
            DataClassification = ToBeClassified;
        }
        field(5; Name; Text[50])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
        }
        field(6; Address1; Text[250])
        {
            Caption = 'Address1';
            DataClassification = ToBeClassified;
        }
        field(7; "Injury description"; Text[100])
        {
            Caption = 'Injury description';
            DataClassification = ToBeClassified;
        }
        field(8; Known; Boolean)
        {
            Caption = 'Known';
            DataClassification = ToBeClassified;
        }
        field(9; "Injured type"; Enum "Injured Partys Type")
        {
            Caption = 'Injured type';
            DataClassification = ToBeClassified;
        }
        field(10; "Injured extent"; Text[100])
        {
            Caption = 'Injured extent';
            DataClassification = ToBeClassified;
        }
        field(11; "Injured age"; Integer)
        {
            Caption = 'Injured age';
            DataClassification = ToBeClassified;
        }
        field(12; "Hospital treatment"; Boolean)
        {
            Caption = 'Hospital treatment';
            DataClassification = ToBeClassified;
        }
        // field(13; "Witness No."; Code[20])
        // {
        //     Caption = 'Witness No.';
        //     DataClassification = ToBeClassified;
        // }
        field(14; "Witness Type"; Enum "Injured Partys Type")
        {
            Caption = 'Witness Type';
            DataClassification = ToBeClassified;
        }
        field(15; Telephone; Text[20])
        {
            Caption = 'Telephone';
            DataClassification = ToBeClassified;
        }
        field(16; Email; Text[100])
        {
            Caption = 'Email';
            DataClassification = ToBeClassified;
        }
        field(17; "No. Series"; Code[20])
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
        key(PK; "Injured Party Type", "Injured Party ID")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        if "Injured Party ID" = '' then begin
            Unigroupsetup.Get;
            Unigroupsetup.TestField("Injured Party No.");
            Unigroupsetup.TestField("Witness No.");
            NoSeriesMgmt.AreRelated(GetNoSeriesCode, xRec."Injured Party ID");
        end;
    end;

    procedure GetNoSeriesCode(): Code[10]
    var
        InjuredPartyType: Record "Injured Partys";
        Unigroupsetup: Record "Unigroup Setup";
    begin
        Unigroupsetup.Get();
        case "Injured Party Type" of
            "Injured Party Type"::Injured:
                exit(Unigroupsetup."Injured Party No.");
            "Injured Party Type"::Witness:
                exit(Unigroupsetup."Witness No.");
        end;
    end;

    procedure AssistEdit(OldInjuredRec: Record "Injured Partys"): Boolean
    var
        InjuredPartyType: Record "Injured Partys";
        Unigroupsetup: Record "Unigroup Setup";
        NoseriesMgt: Codeunit "No. Series";
    begin
        Copy(Rec);
        Unigroupsetup.Get;
        Unigroupsetup.TestField("Injured Party No.");
        Unigroupsetup.TestField("Witness No.");
        if NoseriesMgt.LookupRelatedNoSeries(GetNoSeriesCode, OldInjuredRec."no. Series", "no. Series") then begin
            NoseriesMgt.GetNextNo("Injured Party ID");
            if InjuredPartyType.Get("Injured Party Type", "Injured Party ID") then
                Rec := InjuredPartyType;
            exit(true);
        end;

    end;
}
