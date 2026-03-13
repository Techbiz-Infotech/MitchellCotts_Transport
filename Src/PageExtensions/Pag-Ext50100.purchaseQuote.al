pageextension 50100 purchaseQuote extends "Purchase Quote"
{
    layout
    {
        addlast(General)
        {
            field("Job Card No."; Rec."Job Card No.")
            {
                ApplicationArea = All;
            }
        }
    }
}
