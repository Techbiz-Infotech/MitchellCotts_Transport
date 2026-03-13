pageextension 50108 PurchInvExt extends "Purchase Invoice"
{
    layout
    {
        addlast(General)
        {
            field("CU Number";Rec."CU Number")
            {
                ApplicationArea = All;
            }
        }

    }
actions
    {

        modify("post")
        {
            trigger OnBeforeAction()
            var
            begin
                Rec.TestField("CU Number");
                Rec.TestField("Vendor Invoice No.");
            end;

        }
        modify(CopyDocument)
        {
            Visible = false;
        }

    }
}