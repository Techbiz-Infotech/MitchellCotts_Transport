table 57010 "National Vehicle Type"
{
    Caption = 'National Vehicle Type';
    DataClassification = ToBeClassified;
    DrillDownPageId = "National Vehicle Type List";
    LookupPageId = "National Vehicle Type List";


    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(3; Country; Text[100])
        {
            Caption = 'Country';
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region";
        }
        field(4; "Fuel Tax Reclaim %"; Decimal)
        {
            Caption = 'Fuel Tax Reclaim %';
            DataClassification = ToBeClassified;
        }
        field(5; "Misc Tax Reclaim %"; Decimal)
        {
            Caption = 'Misc Tax Reclaim %';
            DataClassification = ToBeClassified;
        }
        field(6; Active; Text[50])
        {
            Caption = 'Active';
            DataClassification = ToBeClassified;
        }
        field(7; "Ddtype Id"; Code[20])
        {
            Caption = 'Ddtype Id';
            DataClassification = ToBeClassified;
        }
        field(8; "Ddtype allias"; Text[100])
        {
            Caption = 'Ddtype allias';
            DataClassification = ToBeClassified;
        }
        field(9; "Ddtype Name"; Text[50])
        {
            Caption = 'Ddtype Name';
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
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
