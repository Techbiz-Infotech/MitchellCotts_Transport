table 50163 "Route Location"
{
    Caption = 'Route Location';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Route Location List";
    LookupPageId = "Route Location List";

    fields
    {
        field(1; "Code"; Code[50])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[100])
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
