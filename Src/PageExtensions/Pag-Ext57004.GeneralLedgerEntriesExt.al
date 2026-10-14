pageextension 57004 GeneralLedgerEntriesExt1 extends "General Ledger Entries"
{
    layout
    {
        addafter(Reversed)
        {
            field("Revenue Accrual Reversed"; Rec."Revenue Accrual Reversed")
            {
                ApplicationArea = All;
            }
            field("Expense Prepayment Reversed"; Rec."Expense Prepayment Reversed")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        //addafter("Bank Accounts")
        addbefore(Dimensions)
        {
            action("Print Voucher1")
            {
                Caption = 'Print Voucher';
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Report;
                trigger OnAction()
                var
                    GLLedg: Record "G/L Entry";
                begin
                    GLLedg.reset;
                    GLLedg.SetRange("Document No.", rec."Document No.");
                    GLLedg.SetRange("Posting Date", rec."Posting Date");
                    IF GLLedg.FindFirst() then
                        Report.Run(50132, true, true, GLLedg);
                end;
            }
        }
    }
}
