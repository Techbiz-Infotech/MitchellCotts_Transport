tableextension 57017 "GL Entry Ext1" extends "G/L Entry"
{
    fields
    {
        field(60100; "Expense Prepayment Reversed"; Boolean)
        {
            Caption = 'Expense Prepayment Reversed';
            DataClassification = ToBeClassified;
        }
        field(60101; "Revenue Accrual Reversed"; Boolean)
        {
            Caption = 'Revenue Accrual Reversed';
            DataClassification = ToBeClassified;
        }
    }
}