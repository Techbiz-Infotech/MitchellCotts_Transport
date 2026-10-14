table 57013 "Suspention types"
{
    Caption = 'Suspention types';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Suspention types list";
    LookupPageId = "Suspention types list";
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
