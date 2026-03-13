pageextension 50121 PurchOrdLineExt extends "Purchase Order Subform"
{
    layout
    {
        addafter(Quantity)
        {
            field("Shortage?"; Rec."Shortage?")
            {
                ApplicationArea = All;
                trigger OnValidate()
                var
                    myInt: Integer;
                begin
                    ShortageEdit;
                    //CurrPage.Update(false);
                end;
            }
            field("Shortage Quantity"; Rec."Shortage Quantity")
            {
                ApplicationArea = All;
            }

        }
    }
    var
        ShortageEditable: Boolean;

    procedure ShortageEdit()
    var
        myInt: Integer;
    begin
        if Rec."Shortage?" then
            ShortageEditable := true
        else
            ShortageEditable := false;
    end;
}

