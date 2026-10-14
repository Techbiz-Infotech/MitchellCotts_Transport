pageextension 57018 PostedsalesCreditmemoExt extends "Posted Sales Credit Memo"
{
    layout
    {
        
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
