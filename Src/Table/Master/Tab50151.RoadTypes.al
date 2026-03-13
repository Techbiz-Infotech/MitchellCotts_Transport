table 50151 "Road Types"
{
    Caption = 'Road Types';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Road Types List";
    LookupPageId = "Road Types List";

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[50])
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
