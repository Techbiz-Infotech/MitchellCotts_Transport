table 50139 "Third Party"
{
    Caption = 'Third Party';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Third Party No."; Code[20])
        {
            Caption = 'Third Party No.';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Unigroupsetup: Record "Unigroup Setup";
                NoSeriesMgmt: Codeunit "No. Series";
            begin
                if "Third Party No." <> xRec."Third Party No." then begin
                    Unigroupsetup.Get;
                    NoSeriesMgmt.TestManual(Unigroupsetup."Third Party No.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Accident ref."; Code[20])
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
        field(3; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = ToBeClassified;
            TableRelation = Item;
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
        field(6; "Address 1"; Text[250])
        {
            Caption = 'Address 1';
            DataClassification = ToBeClassified;
        }
        field(7; Telephone; Text[20])
        {
            Caption = 'Telephone';
            DataClassification = ToBeClassified;
        }
        field(8; Email; Text[100])
        {
            Caption = 'Email';
            DataClassification = ToBeClassified;
        }
        field(9; "Third Party Insurance Company"; Text[100])
        {
            Caption = 'Third Party Insurance Company';
            DataClassification = ToBeClassified;
        }
        field(10; "Tp Insur Address1"; Text[250])
        {
            Caption = 'Tp Insur Address1';
            DataClassification = ToBeClassified;
        }
        field(11; "Tp Insur Address2"; Text[250])
        {
            Caption = 'Tp Insur Address2';
            DataClassification = ToBeClassified;
        }
        field(12; "Tp Insur Address3"; Text[250])
        {
            Caption = 'Tp Insur Address3';
            DataClassification = ToBeClassified;
        }
        field(13; "Tp Insur Address4"; Text[250])
        {
            Caption = 'Tp Insur Address4';
            DataClassification = ToBeClassified;
        }
        field(14; "Tp Insur Telephone"; Text[20])
        {
            Caption = 'Tp Insur Telephone';
            DataClassification = ToBeClassified;
        }
        field(15; "Tp Policy"; Text[50])
        {
            Caption = 'Tp Policy';
            DataClassification = ToBeClassified;
        }
        field(16; "Tp dam desc"; Text[100])
        {
            Caption = 'Tp dam desc';
            DataClassification = ToBeClassified;
        }
        field(17; "Tp Veh"; Text[50])
        {
            Caption = 'Tp Veh';
            DataClassification = ToBeClassified;
        }
        field(18; "Exterior Colour"; Text[50])
        {
            Caption = 'Exterior Colour';
            DataClassification = ToBeClassified;
        }
        field(19; "Third Party Registration No."; Code[20])
        {
            Caption = 'Third Party Registration No.';
            DataClassification = ToBeClassified;
        }
        field(20; "No. Series"; Code[20])
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
        key(PK; "Third Party No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        if "Third Party No." = '' then begin
            Unigroupsetup.Get;
            Unigroupsetup.TestField("Third Party No.");
            "No. Series" := Unigroupsetup."Third Party No.";
            if NoSeriesMgmt.AreRelated(Unigroupsetup."Third Party No.", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "Third Party No." := NoSeriesMgmt.GetNextNo("No. Series");
        end;
    end;

    procedure AssistEdit(ThirdPartyNoRec: Record "Third Party"): Boolean
    var
        ThirdPartyNo: Record "Third Party";
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        ThirdPartyNo := Rec;
        Unigroupsetup.Get;
        Unigroupsetup.TestField(Unigroupsetup."Third Party No.");
        if NoSeriesMgmt.LookupRelatedNoSeries(Unigroupsetup."Third Party No.", ThirdPartyNoRec."No. Series", "No. Series") then begin
            NoSeriesMgmt.GetNextNo(ThirdPartyNo."Third Party No.", WorkDate(), true);
            Rec := ThirdPartyNo;
            exit(true);
        end;
    end;
}
