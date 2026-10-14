table 57008 "Model Options"
{
    Caption = 'Model Options';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Model Options List";
    LookupPageId = "Model Options List";

    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(3; "Monthly Value"; Decimal)
        {
            Caption = 'Monthly Value';
            DataClassification = ToBeClassified;
        }
        field(4; Retail; Decimal)
        {
            Caption = 'Retail';
            DataClassification = ToBeClassified;
        }
        field(5; "Model Option Type"; Boolean)
        {
            Caption = 'Model Option Type';
            DataClassification = ToBeClassified;
        }
        field(6; "Make Code"; Text[100])
        {
            Caption = 'Make Code';
            DataClassification = ToBeClassified;
            TableRelation = Make;
        }
        field(7; "Model Code"; Text[100])
        {
            Caption = 'Model Code';
            DataClassification = ToBeClassified;
            TableRelation = "Model Code";
        }
        field(8; Derivative; Text[50])
        {
            Caption = 'Derivative';
            DataClassification = ToBeClassified;
        }
        field(9; "CAP No."; Integer)
        {
            Caption = 'CAP No.';
            DataClassification = ToBeClassified;
        }
        field(10; "Default Selection"; Boolean)
        {
            Caption = 'Default Selection';
            DataClassification = ToBeClassified;
        }
        field(11; "Effective Date"; Date)
        {
            Caption = 'Effective Date';
            DataClassification = ToBeClassified;
        }
        field(12; "Retail Inc VAT"; Decimal)
        {
            Caption = 'Retail Inc VAT';
            DataClassification = ToBeClassified;
        }
        field(13; "Glass/ICME ID"; Text[50])
        {
            Caption = 'Glass/ICME ID';
            DataClassification = ToBeClassified;
        }
        field(14; Expiry; Date)
        {
            Caption = 'Expiry';

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
