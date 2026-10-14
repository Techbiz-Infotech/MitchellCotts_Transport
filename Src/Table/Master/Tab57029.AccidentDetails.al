table 57029 "Accident Details"
{
    Caption = 'Accident Details';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Accident Details No."; Code[20])
        {
            Caption = 'Accident Details No.';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Unigroupsetup: Record "Unigroup Setup";
                NoSeriesMgmt: Codeunit "No. Series";
            begin
                if "Accident Details No." <> xRec."Accident Details No." then begin
                    Unigroupsetup.Get;
                    NoSeriesMgmt.TestManual(Unigroupsetup."Accident Details No.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Accident ref."; Code[20])
        {
            Caption = 'Accident ref.';
            DataClassification = ToBeClassified;
        }
        field(3; "Cost Type"; Enum "Cost Type")
        {
            Caption = 'Cost Type';
            DataClassification = ToBeClassified;
        }
        field(4; "Entry Date"; Date)
        {
            Caption = 'Entry Date';
            DataClassification = ToBeClassified;
        }
        field(5; "Estimate No."; Integer)
        {
            Caption = 'Estimate No.';
            DataClassification = ToBeClassified;
        }
        field(6; "Order No."; Code[20])
        {
            Caption = 'Order No.';
            DataClassification = ToBeClassified;
        }
        field(7; "Item No."; Integer)
        {
            Caption = 'Item No.';
            DataClassification = ToBeClassified;
        }
        field(8; Repairer; Text[50])
        {
            Caption = 'Repairer';
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
        field(9; "Estimate Value"; Decimal)
        {
            Caption = 'Estimate Value';
            DataClassification = ToBeClassified;
        }
        field(10; "Actual Value"; Decimal)
        {
            Caption = 'Actual Value';
            DataClassification = ToBeClassified;
        }
        field(11; "Damage Notes"; Text[1000])
        {
            Caption = 'Damage Notes';
            DataClassification = ToBeClassified;
        }
        field(12; Number; Integer)
        {
            Caption = 'Number';
            DataClassification = ToBeClassified;
        }
        field(13; "Hire Note"; Text[1000])
        {
            Caption = 'Hire Note';
            DataClassification = ToBeClassified;
        }
        field(14; "Reason For Associated Cost"; Decimal)
        {
            Caption = 'Reason For Associated Cost';
            DataClassification = ToBeClassified;
        }
        field(15; "Associated Note"; Text[1000])
        {
            Caption = 'Associated Note';
            DataClassification = ToBeClassified;
        }
        field(16; "Date Reminder Sent"; Date)
        {
            Caption = 'Date Reminder Sent';
            DataClassification = ToBeClassified;
        }
        field(17; "Payment Received Date"; Date)
        {
            Caption = 'Payment Received Date';
            DataClassification = ToBeClassified;
        }
        field(18; "Excess Notes"; Text[1000])
        {
            Caption = 'Excess Notes';
            DataClassification = ToBeClassified;
        }
        field(19; "No. Series"; Code[20])
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
        key(PK; "Accident Details No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        if "Accident Details No." = '' then begin
            Unigroupsetup.Get;
            Unigroupsetup.TestField("Accident Details No.");
            "No. Series" := Unigroupsetup."Accident Details No.";
            if NoSeriesMgmt.AreRelated(Unigroupsetup."Accident Details No.", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "Accident Details No." := NoSeriesMgmt.GetNextNo("No. Series");

        end;
    end;

    procedure AssistEdit(AccidentDetailsNoRec: Record "Accident Details"): Boolean
    var
        AccidentDetailsNo: Record "Accident Details";
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        AccidentDetailsNo := Rec;
        Unigroupsetup.Get;
        Unigroupsetup.TestField(Unigroupsetup."Accident Details No.");
        if NoSeriesMgmt.LookupRelatedNoSeries(Unigroupsetup."Accident Details No.", AccidentDetailsNoRec."No. Series", "No. Series") then begin
            NoSeriesMgmt.GetNextNo(AccidentDetailsNo."Accident Details No.", WorkDate(), true);
            Rec := AccidentDetailsNo;
            exit(true);
        end;
    end;
}
