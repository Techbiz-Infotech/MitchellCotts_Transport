table 50101 "Invoicing Shunting Trips"
{
    Caption = 'Invoicing Shunting Trips';
    DataClassification = ToBeClassified;


    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Shunting Trip ID"; Code[20])
        {
            Caption = 'Shunting Trip ID';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Unigroupsetup: Record "Unigroup Setup";
                NoSeriesMgmt: Codeunit "No. Series";
            begin
                if "Shunting Trip ID" <> xRec."Shunting Trip ID" then begin
                    Unigroupsetup.Get;
                    NoSeriesMgmt.TestManual(Unigroupsetup."Shunting Trip No.");
                    "No. Series" := '';
                end;
            end;
        }

        field(3; "Trip Id"; Code[20])
        {
            Caption = 'Trip Id';
            DataClassification = ToBeClassified;
            TableRelation = Trip;
        }

        field(4; "Container No."; Code[30])
        {
            Caption = 'Container No.';
            DataClassification = ToBeClassified;
        }
        field(5; "Container Size"; Enum "Container Size")
        {
            Caption = 'Container Size';
            DataClassification = ToBeClassified;
        }
        field(6; "Cargo type"; Enum "cargo Type")
        {
            Caption = 'Cargo Type';
            DataClassification = ToBeClassified;
        }
        field(7; "Invoice No."; Code[20])
        {
            Caption = 'Invoice No.';
            DataClassification = ToBeClassified;
        }
        field(8; "Posted Invoice No."; Code[20])
        {
            Caption = 'Posted Invoice No.';
            DataClassification = ToBeClassified;
        }
        field(9; "Invoice Line No."; Integer)
        {
            Caption = 'Invoice Line No.';
            DataClassification = ToBeClassified;
        }
        field(10; "Posted Invoice Line No."; Integer)
        {
            Caption = 'Posted Invoice Line No.';
            DataClassification = ToBeClassified;
        }
        field(11; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
        }
        field(12; Posted; Boolean)
        {
            Caption = 'Posted';
            DataClassification = ToBeClassified;
        }
        field(13; "Booking No"; Code[20])
        {
            Caption = 'Booking No.';
            DataClassification = ToBeClassified;
        }
        field(14; "Additional Remarks"; Text[500])
        {
            Caption = 'Additional Remarks';
            DataClassification = ToBeClassified;
        }
        field(15; "Interchange No"; Code[20])
        {
            Caption = 'Interchange No.';
            DataClassification = ToBeClassified;
        }
        field(16; "Container Charge"; Decimal)
        {
            Caption = 'Container Charge';
            DataClassification = ToBeClassified;
        }


        field(17; "Delivery Note No"; Code[20])
        {
            Caption = 'Delivery Note No.';
            DataClassification = ToBeClassified;
        }
        field(18; "Trip Date"; Date)
        {
            Caption = 'Trip Date';
            DataClassification = ToBeClassified;
        }
        field(19; "Shunting Trip Date"; Date)
        {
            Caption = 'Shunting Trip Date';
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
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin

    end;




}