table 57050 "Petty Cash Expense Type"
{
    Caption = 'Petty Cash Expense Type';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Petty Cash Expense Code"; Code[30])
        {
            Caption = 'Petty Cash Expense Code';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Petty Cash Prepayment Account"; Code[20])
        {
            Caption = 'Petty Cash Prepayment Account';
            TableRelation = "G/L Account";
        }
        field(4; "Petty Cash Expense Account"; Code[20])
        {
            Caption = 'Petty Cash Expense Account';
            TableRelation = "G/L Account";
        }
    }
    keys
    {
        key(PK; "Petty Cash Expense Code")
        {
            Clustered = true;
        }
    }
}
