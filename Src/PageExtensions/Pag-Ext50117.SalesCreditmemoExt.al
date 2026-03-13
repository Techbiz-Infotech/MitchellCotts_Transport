pageextension 50117 SalesCreditmemoExt extends "Sales Credit Memo"
{
    layout
    {
        modify("Applies-to ID")
        {
            Visible = false;
        }
        addlast(General)
        {
            field("CU Number"; Rec."CU Number")
            {
                ApplicationArea = All;
                Caption = 'Related Posted Sales Invoice CU Number';
            }
        }
    }
}
