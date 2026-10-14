table 57051 "Vehicle Type"
{
    Caption = 'Vehicle Type';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Vehicle Type List";
    LookupPageId = "Vehicle Type List";


    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(3; "Forecast replacement value"; Decimal)
        {
            Caption = 'Forecast replacement value';
            DataClassification = ToBeClassified;
        }
        field(4; "Replacement Distance"; Decimal)
        {
            Caption = 'Replacement Distance';
            DataClassification = ToBeClassified;
        }
        field(5; "Yearly O Licence Charge"; Decimal)
        {
            Caption = 'Yearly O Licence Charge';
            DataClassification = ToBeClassified;
        }
        field(6; "Service Priority"; Integer)
        {
            Caption = 'Service Priority';
            DataClassification = ToBeClassified;
        }
        field(7; "Is Commercial?"; Boolean)
        {
            Caption = 'Is Commercial?';
            DataClassification = ToBeClassified;
        }
        field(8; "Replacement Months"; Integer)
        {
            Caption = 'Replacement Months';
            DataClassification = ToBeClassified;
        }
        field(9; "Five Yearly O Licence Charge"; Decimal)
        {
            Caption = 'Five Yearly O Licence Charge';
            DataClassification = ToBeClassified;
        }
        field(10; "Service Allowable Period"; Boolean)
        {
            Caption = 'Service Allowable Period';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
