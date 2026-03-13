table 50171 "Job Type"
{
    Caption = 'Job Type';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Job Type"; Code[30])
        {
            Caption = 'Job Type';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Due Days"; DateFormula)
        {
            Caption = 'Due Days';
        }
    }
    keys
    {
        key(PK; "Job Type")
        {
            Clustered = true;
        }
    }
}
