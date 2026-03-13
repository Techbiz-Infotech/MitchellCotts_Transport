pageextension 50116 PostedSalesInvsList extends "Posted Sales Invoices"
{
    layout
    {
        addafter("Currency Code")
        {
            field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
            {
                ApplicationArea = All;
            }
            field("Route Code"; Rec."Route Code")
            {
                ApplicationArea = All;
            }
        }

    }
}