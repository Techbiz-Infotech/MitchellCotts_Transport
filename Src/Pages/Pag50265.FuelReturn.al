page 50265 "Fuel Return Card"
{
    Caption = 'Fuel Return';
    PageType = Card;
    SourceTable = "Fuel Return";
    DeleteAllowed = false;
    Editable = false;
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Fuel Return No."; Rec."Fuel Return No.")
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
                field("Fuel Issue For"; Rec."Fuel Issue For")
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
                field("Trailer No."; Rec."Trailer No.")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Editable = false;
                }
                field("Tank Size"; Rec."Tank Size")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Editable = false;
                }
                field("Fuel Type"; Rec."Fuel Type")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Editable = false;
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
                field(Pump; Rec.Pump)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Fueling Station Name"; Rec."Fueling Station Name")
                {
                    ApplicationArea = All;
                }
                field(Odometer; Rec.Odometer)
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 6 Code1"; Rec."Shortcut Dimension 6 Code")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    //Editable = ForTripEditable;
                }
                field("Unit of measure"; Rec."Unit of measure")
                {
                    ApplicationArea = All;
                    Editable = ForTripEditable;
                }

                field("Fuel Approval Status"; Rec."Fuel Approval Status")
                {
                    ApplicationArea = All;
                }
                field("Transaction No."; Rec."Transaction No.")
                {
                    ApplicationArea = All;
                }
                field("Transaction Time"; Rec."Transaction Time")
                {
                    ApplicationArea = All;
                }
                group("Fuel Required")
                {
                    Caption = 'Fuel Required';
                    field("Required Fuel In Litres"; Rec."Required Fuel In Litres")
                    {
                        ApplicationArea = All;
                        ShowMandatory = true;
                        //Editable = ForTripEditable;
                    }
                    field("Balance Fuel in Vehicle"; Rec."Balance Fuel in Truck")
                    {
                        ApplicationArea = All;
                        // Editable = ForTripEditable;
                    }
                    field("Shortage in liters(If Any)"; Rec."Shortage in liters(If Any)")
                    {
                        ApplicationArea = All;
                    }
                    field("Net Requirement in litres"; Rec."Net Requirement in litres")
                    {
                        ApplicationArea = All;
                        ShowMandatory = true;
                        Editable = ForTripEditable;
                    }
                    field("Fuel Issue No."; Rec."Fuel Issue No.")
                    {
                        ApplicationArea = All;
                    }
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
