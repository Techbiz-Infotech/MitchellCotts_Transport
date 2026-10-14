table 57009 "Brake Types"
{
    Caption = 'Brake Types';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Brake Types List";
    LookupPageId = "Brake Types List";


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
