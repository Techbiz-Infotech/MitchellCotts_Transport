table 50149 "Odometer History"
{
    Caption = 'Odometer History';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; "Vehicle No."; Code[20])
        {
            Caption = 'Vehicle No.';
            DataClassification = ToBeClassified;
            TableRelation = "Fixed Asset";
        }
        field(3; "Odometer start"; Decimal)
        {
            Caption = 'Odometer Start';
            DataClassification = ToBeClassified;
        }
        field(4; "Odometer end"; Decimal)
        {
            Caption = 'Odometer End';
            DataClassification = ToBeClassified;
        }
        field(5; "Distance travelled"; Integer)
        {
            Caption = 'Distance Travelled';
            DataClassification = ToBeClassified;
        }
        field(8; "Location Code"; Text[50])
        {
            Caption = 'Location Code';
            DataClassification = ToBeClassified;
            TableRelation = Location where("Use As In-Transit" = const(false));
        }
        field(9; "Company code"; Text[100])
        {
            Caption = 'Company code';
            DataClassification = ToBeClassified;
        }
        field(10; Country; Text[50])
        {
            Caption = 'Country';
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region";
        }
        field(11; Department; Text[50])
        {
            Caption = 'Department';
            DataClassification = ToBeClassified;
        }
        field(12; "Actual Value"; Integer)
        {
            Caption = 'Actual Value';
            DataClassification = ToBeClassified;
        }
        field(13; MPG; Text[50])
        {
            Caption = 'MPG';
            DataClassification = ToBeClassified;
        }
        field(14; "Co2 KG"; Integer)
        {
            Caption = 'Co2 KG';
            DataClassification = ToBeClassified;
        }
        field(15; "Period start"; Date)
        {
            Caption = 'Period Start';
            DataClassification = ToBeClassified;
        }
        field(16; "Period end"; Date)
        {
            Caption = 'Period End';
            DataClassification = ToBeClassified;
        }
        field(17; "Cost per Mile"; Decimal)
        {
            Caption = 'Cost Per Mile';
            DataClassification = ToBeClassified;
        }
        field(18; "Fuel Type"; Enum "Fuel Type")
        {
            Caption = 'Fuel Type';
            DataClassification = ToBeClassified;
        }
        field(19; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = ToBeClassified;
        }
        field(20; "No. Series"; Code[20])
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
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var

    begin
    
    end;
}
