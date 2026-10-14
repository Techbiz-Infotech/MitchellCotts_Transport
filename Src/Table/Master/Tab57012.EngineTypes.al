table 57012 "Engine Types"
{
    Caption = 'Engine Types';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Engine Types List";
    LookupPageId = "Engine Types List";
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
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
