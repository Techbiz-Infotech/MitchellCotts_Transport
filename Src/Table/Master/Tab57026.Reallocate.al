table 57026 Reallocate
{
    Caption = 'Reallocate';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Reallocation No."; Code[20])
        {
            Caption = 'Reallocation No.';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Unigroupsetup: Record "Unigroup Setup";
                NoSeriesMgmt: Codeunit "No. Series";
            begin
                if "Reallocation No." <> xRec."Reallocation No." then begin
                    Unigroupsetup.Get;
                    NoSeriesMgmt.TestManual(Unigroupsetup."Reallocation No.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Vehicle No."; Code[20])
        {
            Caption = 'Vehicle No.';
            DataClassification = ToBeClassified;
            trigger OnLookup()
            var
                FA: Record "Fixed Asset";
            begin
                FA.SetRange("Is trailer", false);
                if PAGE.RunModal(PAGE::"Vehicle List", FA) = ACTION::LookupOK then
                    Rec.Validate("Vehicle No.", FA."No.");
            end;
        }
        field(3; Odometer; Decimal)
        {
            Caption = 'Odometer';
            DataClassification = ToBeClassified;
        }
        field(4; "Previous date"; Date)
        {
            Caption = 'Previous Date';
            DataClassification = ToBeClassified;
        }
        field(5; "Start date"; Date)
        {
            Caption = 'Start Date';
            DataClassification = ToBeClassified;
        }
        field(6; "Location code"; Text[50])
        {
            Caption = 'Location code';
            DataClassification = ToBeClassified;
            TableRelation = Location where("Use As In-Transit" = const(false));
        }

        field(8; "Vehicle status"; Enum "Vehicle Status")
        {
            Caption = 'Vehicle status';
            DataClassification = ToBeClassified;
        }
        field(9; "Allocation reason"; Text[150])
        {
            Caption = 'Allocation reason';
            DataClassification = ToBeClassified;
        }
        field(10; "Make code"; Text[50])
        {
            Caption = 'Make code';
            DataClassification = ToBeClassified;
            TableRelation = Make;
        }
        field(11; Derivate; Text[50])
        {
            Caption = 'Derivate';
            DataClassification = ToBeClassified;
        }
        field(12; "Model code"; Text[50])
        {
            Caption = 'Model code';
            DataClassification = ToBeClassified;
            TableRelation = "Model Code";
        }
        field(14; Comments; Text[250])
        {
            Caption = 'Comments';
            DataClassification = ToBeClassified;
        }
        field(15; "No. Series"; Code[20])
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
        key(PK; "Vehicle No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        if "Reallocation No." = '' then begin
            Unigroupsetup.Get;
            Unigroupsetup.TestField("Reallocation No.");
            "No. Series" := Unigroupsetup."Reallocation No.";
            if NoSeriesMgmt.AreRelated(Unigroupsetup."Reallocation No.", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "Reallocation No." := NoSeriesMgmt.GetNextNo("No. Series");
        end;
    end;

    procedure AssistEdit(ReallocationNoRec: Record Reallocate): Boolean
    var
        ReallocationNo: Record Reallocate;
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        ReallocationNo := Rec;
        Unigroupsetup.Get;
        Unigroupsetup.TestField("Reallocation No.");
        if NoSeriesMgmt.LookupRelatedNoSeries(Unigroupsetup."Reallocation No.", ReallocationNoRec."No. Series", ReallocationNo."No. Series") then begin
            NoSeriesMgmt.GetNextNo(ReallocationNo."Reallocation No.", WorkDate(), true);
            Rec := ReallocationNo;
            exit(true);
        end;
    end;
}
