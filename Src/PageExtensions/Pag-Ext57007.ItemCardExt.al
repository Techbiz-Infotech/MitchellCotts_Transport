pageextension 57007 ItemCardExt1 extends "Item Card"
{
    layout
    {
        addlast(Replenishment)
        {
            field("Can Scrap?"; Rec."Can Scrap?")
            {
                ApplicationArea = All;
            }
            field("Scrap Item No."; Rec."Scrap Item No.")
            {
                ApplicationArea = All;
            }
        }
        //SH 02-21-2024
        addlast(Item)
        {
            field("Disable selection in invoice"; Rec."Disable selection in invoice")
            {
                ApplicationArea = all;
            }
        }
        //SH 02-21-2024
    }
    trigger OnOpenPage()
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.get(UserId);
        if not UserSetup."Item and COA Access" then
            CurrPage.Editable := false
        else
            CurrPage.Editable := true;
    end;

    trigger OnAfterGetRecord()
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.get(UserId);
        if not UserSetup."Item and COA Access" then
            CurrPage.Editable := false
        else
            CurrPage.Editable := true;
    end;
}