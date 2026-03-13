tableextension 50116 "GL Entry Ext" extends "G/L Entry"
{
    fields
    {
        field(50100; "Expense Prepayment Reversed"; Boolean)
        {
            Caption = 'Expense Prepayment Reversed';
            DataClassification = ToBeClassified;
        }
        field(50101; "Revenue Accrual Reversed"; Boolean)
        {
            Caption = 'Revenue Accrual Reversed';
            DataClassification = ToBeClassified;
        }
    }
}