page 50273 "Petty Cash Return Card"
{
    ApplicationArea = All;
    Caption = 'Petty Cash Return Card';
    PageType = Card;
    SourceTable = "Petty Cash Return";
    DeleteAllowed = false;
    Editable = false;
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Petty Cash Return No."; Rec."Petty Cash Return No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Petty Cash For"; Rec."Petty Cash For")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Trip ID"; Rec."Trip ID")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        SetFieldEditable();
                    end;
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Editable = ForTripEditable;
                }

                field("Driver ID"; Rec."Driver ID")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Editable = false;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Expense Type"; Rec."Expense Type")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Shortcut Dimension 6 Code1"; Rec."Shortcut Dimension 6 Code")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    //Editable = ForTripEditable;
                }
                field("Transaction Reference No."; Rec."Transaction Reference No.")
                {
                    ApplicationArea = All;
                }

                field("Voucher No."; Rec."Voucher No.")
                {
                    ApplicationArea = All;
                }


            }
            group(Dimensions)
            {
                Caption = 'Dimensions';
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                    Visible = DimVisible1;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                    Visible = DimVisible2;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                    Visible = DimVisible3;
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.';
                    Visible = DimVisible4;
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 5 Code field.';
                    Visible = DimVisible5;
                }
                field("Shortcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 6 Code field.';
                    Visible = DimVisible6;
                }
                field("Shortcut Dimension 7 Code"; Rec."Shortcut Dimension 7 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 7 Code field.';
                    Visible = DimVisible7;
                }
                field("Shortcut Dimension 8 Code"; Rec."Shortcut Dimension 8 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 8 Code field.';
                    Visible = DimVisible8;
                }
            }
        }
    }
    var
        EventsHandler: Codeunit "Unigroup Workflow Events";

    trigger OnOpenPage()
    begin

        SetDimensionsVisibility();
        SetFieldEditable();

    end;

    trigger OnAfterGetRecord()
    begin

        SetDimensionsVisibility();
        SetFieldEditable();
    end;

    var
        DimVisible1: Boolean;
        DimVisible2: Boolean;
        DimVisible3: Boolean;
        DimVisible4: Boolean;
        DimVisible5: Boolean;
        DimVisible6: Boolean;
        DimVisible7: Boolean;
        DimVisible8: Boolean;

    local procedure SetDimensionsVisibility()
    var
        DimMgt: Codeunit DimensionManagement;
    begin
        DimVisible1 := false;
        DimVisible2 := false;
        DimVisible3 := false;
        DimVisible4 := false;
        DimVisible5 := false;
        DimVisible6 := false;
        DimVisible7 := false;
        DimVisible8 := false;
        DimMgt.UseShortcutDims(
          DimVisible1, DimVisible2, DimVisible3, DimVisible4, DimVisible5, DimVisible6, DimVisible7, DimVisible8);
        Clear(DimMgt);
    end;

    var
        ForTripEditable: Boolean;
        StyleExprTxt: Text;

    procedure SetFieldEditable()
    begin
        if Rec."Trip ID" = '' then
            ForTripEditable := true
        else
            ForTripEditable := false;
    end;
}
