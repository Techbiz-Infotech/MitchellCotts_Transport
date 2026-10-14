tableextension 57018 GLAccountExt extends "G/L Account"
{
    fields
    {
        // field(50100; "Prepayment Reversal Account"; Code[20])
        // {
        //     Caption = 'Prepayment Reversal Account';
        //     DataClassification = ToBeClassified;
        //     TableRelation = "G/L Account";
        // }
        field(50101; "Revenue Accrual Reversal"; Boolean)
        {
            Caption = 'Revenue Accrual Reversal';
            DataClassification = ToBeClassified;
        }
    }
}