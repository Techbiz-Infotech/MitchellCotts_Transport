pageextension 57002 PurchQuoteLineExt extends "Purchase Quote Subform"
{
    layout
    {
        addafter("No.")
        {
            field("Job Card No."; Rec."Job Card No.")
            {
                ApplicationArea = All;
            }
        }
    }
}
