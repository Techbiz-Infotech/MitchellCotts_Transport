table 57018 "Inspection Check List Template"
{
    Caption = 'Inspection Check List Template';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }
        field(2; "Check List"; Text[100])
        {
            Caption = 'Check List';
        }
        field(3; "Inspection Category"; Code[50])
        {
            Caption = 'Inspection Category';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
    
}
