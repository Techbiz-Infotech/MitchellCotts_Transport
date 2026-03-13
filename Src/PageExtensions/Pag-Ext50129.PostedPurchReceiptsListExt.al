pageextension 50129 PostedPurchReceiptsListExt extends "Posted Purchase Receipts"
{
    layout
    {
        addafter("No.")
        {
            field("Fuel Issue No.";Rec."Fuel Issue No.")
            {
                ApplicationArea = All;
            }
        }
    }
}
