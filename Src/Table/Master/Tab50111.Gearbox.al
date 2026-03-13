table 50111 "Gearbox Type"
{
    Caption = 'Gearbox Type';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Gearbox Type List";
    LookupPageId = "Gearbox Type List";

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
        key(PK1; "Code")
        {
            Clustered = true;
        }
    }
}