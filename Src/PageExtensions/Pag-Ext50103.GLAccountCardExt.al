pageextension 50103 GLAccountCardExt extends "G/L Account Card"
{
    layout
    {
        addlast(General)
        {
            field("Prepayment Reversal Account"; Rec."Prepayment Reversal Account")
            {
                ApplicationArea = All;
            }

            field("Revenue Accrual Reversal"; Rec."Revenue Accrual Reversal")
            {
                ApplicationArea = All;
            }

        }

    }
    trigger OnOpenPage()
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.get(UserId);
        if not UserSetup."COA Access" then
            CurrPage.Editable := false
        else
            CurrPage.Editable := true;
    end;
    trigger OnAfterGetRecord()
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.get(UserId);
        if not UserSetup."COA Access" then
            CurrPage.Editable := false
        else
            CurrPage.Editable := true;
    end;
    
}
