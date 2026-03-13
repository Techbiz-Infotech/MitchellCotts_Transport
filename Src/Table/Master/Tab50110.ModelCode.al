table 50110 "Model Code"
{
    Caption = 'Model Code';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Model Code List";
    LookupPageId = "Model Code List";

    fields
    {
        field(1; "Model Code"; Code[20])
        {
            Caption = 'Model Code';
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
        key(PK1; "Model Code")
        {
            Clustered = true;
        }
    }
}