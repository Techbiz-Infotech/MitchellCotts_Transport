pageextension 50106 PurchOrderExt extends "Purchase Order"
{
    layout
    {
        modify("Vendor Order No.")
        {
            Caption = 'Vendor reference No.';
        }
        addlast(General)
        {
            field("CU Number"; Rec."CU Number")
            {
                ApplicationArea = All;
            }
            field("Fuel Issue No.";Rec."Fuel Issue No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
    }
}