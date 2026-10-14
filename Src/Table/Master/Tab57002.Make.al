table 57002 "Make"
{
    Caption = 'Make code';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Make List";
    LookupPageId = "Make List";

    fields
    {
        field(1; "Make Code"; Code[20])
        {
            Caption = 'Make Code';
            DataClassification = ToBeClassified;


        }
        field(2; "Description"; Text[250])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(PK1; "Make Code")
        {
            Clustered = true;
        }
    }
}