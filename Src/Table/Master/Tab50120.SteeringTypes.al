table 50120 "Steering Types"
{
    Caption = 'Steering Types';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Steering Types List";
    LookupPageId = "Steering Types List";
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
