table 57007 "Tax Class"
{
    Caption = 'Tax Class';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Tax Class List";
    LookupPageId = "Tax Class List";

    fields
    {
        field(1; "Tax Code"; Code[20])
        {
            Caption = 'Tax Code';
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(3; Types; Text[50])
        {
            Caption = 'Types';
            DataClassification = ToBeClassified;
        }
        field(4; "Fuel Types"; Enum "Fuel Type")
        {
            Caption = 'Fuel Types';
            DataClassification = ToBeClassified;

        }
        field(5; "Min Date Reg"; Date)
        {
            Caption = 'Min Date Reg';
            DataClassification = ToBeClassified;
        }
        field(6; "Max Date Reg"; Date)
        {
            Caption = 'Max Date Reg';
            DataClassification = ToBeClassified;
        }
        field(7; "Min Co2gkm"; Decimal)
        {
            Caption = 'Min Co2gkm';
            DataClassification = ToBeClassified;
        }
        field(8; "Max Co2gkm"; Decimal)
        {
            Caption = 'Max Co2gkm';
            DataClassification = ToBeClassified;
        }
        field(9; "Value"; Decimal)
        {
            Caption = 'Value';
            DataClassification = ToBeClassified;
        }
        field(10; "Value 6 Months"; Decimal)
        {
            Caption = 'Value 6 Months';
            DataClassification = ToBeClassified;
        }
        field(11; "First Year Value"; Decimal)
        {
            Caption = 'First Year Value';
            DataClassification = ToBeClassified;
        }
        field(12; "First Year Value 6 Months"; Decimal)
        {
            Caption = 'First Year Value 6 Months';
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
    }
    keys
    {
        key(PK; "Tax Code")
        {
            Clustered = true;
        }
    }
}
