pageextension 50127 GetReceiptLinesExt extends "Get Receipt Lines"
{
    layout
    {
        addafter("Document No.")
        {
            field("Fuel Issue No.";Rec."Fuel Issue No.")
            {
                ApplicationArea = All;
            }
        }
    }
}
