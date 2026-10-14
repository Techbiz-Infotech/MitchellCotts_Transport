table 57025 "Contract option code"
{
    Caption = 'Contract option code';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Contract option List";
    LookupPageId = "Contract option List";


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
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
