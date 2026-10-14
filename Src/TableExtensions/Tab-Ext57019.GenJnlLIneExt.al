tableextension 57019 "GenJnlLine Ext1" extends "Gen. Journal Line"
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
