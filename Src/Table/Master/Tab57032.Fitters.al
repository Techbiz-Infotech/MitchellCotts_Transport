table 57032 Fitters
{
    Caption = 'Fitters';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Fitter No."; Code[20])
        {
            Caption = 'Fitter No.';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Unigroupsetup: Record "Unigroup Setup";
                NoSeriesMgmt: Codeunit "No. Series";
            begin
                if "Fitter No." <> xRec."Fitter No." then begin
                    Unigroupsetup.Get;
                    NoSeriesMgmt.TestManual(Unigroupsetup."Fitter No.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Fifter Name"; Text[50])
        {
            Caption = 'Fifter Name';
            DataClassification = ToBeClassified;
        }
        field(3; "Serial No."; Integer)
        {
            Caption = 'Serial No.';
            DataClassification = ToBeClassified;
        }
        field(4; Pin; Integer)
        {
            Caption = 'Pin';
            DataClassification = ToBeClassified;
        }
        field(5; Sex; Enum "Sex Type")
        {
            Caption = 'Sex';
            DataClassification = ToBeClassified;
        }
        field(6; "Employment Status"; Text[50])
        {
            Caption = 'Employment Status';
            DataClassification = ToBeClassified;
        }
        field(7; "Start date"; Date)
        {
            Caption = 'Start Date';
            DataClassification = ToBeClassified;
        }
        field(8; "Probation period (Months)"; Integer)
        {
            Caption = 'Probation Period (Months)';
            DataClassification = ToBeClassified;
        }
        field(10; "Job title"; Text[100])
        {
            Caption = 'Job Title';
            DataClassification = ToBeClassified;
        }
        field(11; Skills; Text[50])
        {
            Caption = 'Skills';
            DataClassification = ToBeClassified;
        }
        field(12; "National ID Card No"; Code[20])
        {
            Caption = 'National ID Card No';
            DataClassification = ToBeClassified;
        }
        field(13; "Date Finished"; Date)
        {
            Caption = 'Date Finished';
            DataClassification = ToBeClassified;
        }
        field(14; "Probation End Date"; Date)
        {
            Caption = 'Probation End Date';
            DataClassification = ToBeClassified;
        }
        field(15; Department; Text[100])
        {
            Caption = 'Department';
            DataClassification = ToBeClassified;
        }
        field(17; "Location Code"; Text[50])
        {
            Caption = 'Location Code';
            DataClassification = ToBeClassified;
            TableRelation = Location where("Use As In-Transit" = const(false));
        }
        field(18; "Gross pay"; Decimal)
        {
            Caption = 'Gross Pay';
            DataClassification = ToBeClassified;
        }
        field(19; "Created By"; Text[100])
        {
            Caption = 'Created By';
            DataClassification = ToBeClassified;
        }
        field(20; "Date"; Date)
        {
            Caption = 'Date';
            DataClassification = ToBeClassified;
        }
        field(21; Address1; Text[250])
        {
            Caption = 'Address1';
            DataClassification = ToBeClassified;
        }
        field(22; Address2; Text[250])
        {
            Caption = 'Address2';
            DataClassification = ToBeClassified;
        }
        field(23; "Town/City"; Text[50])
        {
            Caption = 'Town/City';
            DataClassification = ToBeClassified;
        }
        field(24; Country; Text[50])
        {
            Caption = 'Country';
            DataClassification = ToBeClassified;
        }
        field(25; Postcode; Text[20])
        {
            Caption = 'Postcode';
            DataClassification = ToBeClassified;
        }
        field(26; Education; Text[50])
        {
            Caption = 'Education';
            DataClassification = ToBeClassified;
        }
        field(27; Telephone; Text[20])
        {
            Caption = 'Telephone';
            DataClassification = ToBeClassified;
        }
        field(28; Fax; Text[100])
        {
            Caption = 'Fax';
            DataClassification = ToBeClassified;
        }
        field(29; Email; Text[100])
        {
            Caption = 'Email';
            DataClassification = ToBeClassified;
        }
        field(30; Notes; Text[250])
        {
            Caption = 'Notes';
            DataClassification = ToBeClassified;
        }
        field(31; Qualification; Text[50])
        {
            Caption = 'Qualification';
            DataClassification = ToBeClassified;
        }
        field(32; "Contact Person"; Text[50])
        {
            Caption = 'Contact Person';
            DataClassification = ToBeClassified;
        }
        field(33; "Mobile No."; Text[20])
        {
            Caption = 'Mobile No.';
            DataClassification = ToBeClassified;
        }
        field(34; "Contact Person Relatinship"; Text[50])
        {
            Caption = 'Contact Person Relatinship';
            DataClassification = ToBeClassified;
        }
        field(35; "Rate 1"; Decimal)
        {
            Caption = 'Rate 1';
            DataClassification = ToBeClassified;
        }
        field(36; "Rate 2"; Decimal)
        {
            Caption = 'Rate 2';
            DataClassification = ToBeClassified;
        }
        field(37; "Rate 3"; Decimal)
        {
            Caption = 'Rate 3';
            DataClassification = ToBeClassified;
        }
        field(38; "Rate 4"; Decimal)
        {
            Caption = 'Rate 4';
            DataClassification = ToBeClassified;
        }
        field(39; "Rate 5"; Decimal)
        {
            Caption = 'Rate 5';
            DataClassification = ToBeClassified;
        }
        field(40; "Rate 6"; Decimal)
        {
            Caption = 'Rate 6';
            DataClassification = ToBeClassified;
        }
        field(41; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
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
        key(PK; "Fitter No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        if "Fitter No." = '' then begin
            Unigroupsetup.Get;
            Unigroupsetup.TestField("Fitter No.");
            "No. Series" := Unigroupsetup."Fitter No.";
            if NoSeriesMgmt.AreRelated(Unigroupsetup."Fitter No.", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "Fitter No." := NoSeriesMgmt.GetNextNo("No. Series");
        end;

    end;


    procedure AssistEdit(FitterNoRec: Record Fitters): Boolean
    var
        FitterNo: Record Fitters;
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        FitterNo := Rec;
        Unigroupsetup.Get;
        Unigroupsetup.TestField(Unigroupsetup."Fitter No.");
        if NoSeriesMgmt.LookupRelatedNoSeries(Unigroupsetup."Fitter No.", FitterNoRec."No. Series", "No. Series") then begin
            NoSeriesMgmt.GetNextNo(FitterNo."Fitter No.", WorkDate(), true);
            Rec := FitterNo;
            exit(true);
        end;
    end;
}
