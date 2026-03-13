pageextension 50109 DimensionValueExt extends "Dimension Values"
{
    trigger OnOpenPage()
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.get(UserId);
        if not UserSetup."All Setup Access" then
            CurrPage.Editable := false
        else
            CurrPage.Editable := true;
    end;

    trigger OnAfterGetRecord()
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.get(UserId);
        if not UserSetup."All Setup Access" then
            CurrPage.Editable := false
        else
            CurrPage.Editable := true;
    end;
}
