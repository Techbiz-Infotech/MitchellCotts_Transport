page 57145 "Accident Details Card"
{
    Caption = 'Accident Details';
    PageType = Card;
    SourceTable = "Accident Details";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Accident Details No."; Rec."Accident Details No.")
                {
                    ApplicationArea = All;
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field("Accident ref."; Rec."Accident ref.")
                {
                    ApplicationArea = All;
                }
                field("Cost Type"; Rec."Cost Type")
                {
                    ApplicationArea = All;
                }
                field("Entry Date"; Rec."Entry Date")
                {
                    ApplicationArea = All;
                }
                field("Estimate No."; Rec."Estimate No.")
                {
                    ApplicationArea = All;
                }
                field("Order No."; Rec."Order No.")
                {
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field(Repairer; Rec.Repairer)
                {
                    ApplicationArea = All;
                }
                field("Estimate Value"; Rec."Estimate Value")
                {
                    ApplicationArea = All;
                }
                field("Actual Value"; Rec."Actual Value")
                {
                    ApplicationArea = All;
                }

            }
            group("Damage Costs")
            {
                Caption = 'Hire Costs';
                field("Damage Notes"; Rec."Damage Notes")
                {
                    ApplicationArea = All;
                }


            }
            group("Hire Costs")
            {
                Caption = 'Hire Costs';
                field(Number; Rec.Number)
                {
                    ApplicationArea = All;
                }
                field("Hire Note"; Rec."Hire Note")
                {
                    ApplicationArea = All;
                }

            }
            group("Associated Costs")
            {
                Caption = 'Associated Costs';
                field("Reason For Associated Cost"; Rec."Reason For Associated Cost")
                {
                    ApplicationArea = All;
                }
                field("Associated Note"; Rec."Associated Note")
                {
                    ApplicationArea = All;
                }



            }
            group("Excess Charges")
            {
                Caption = 'Excess Charges';
                field("Date Reminder Sent"; Rec."Date Reminder Sent")
                {
                    ApplicationArea = All;
                }
                field("Payment Received Date"; Rec."Payment Received Date")
                {
                    ApplicationArea = All;
                }
                field("Excess Notes"; Rec."Excess Notes")
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
    trigger OnOpenPage()
    begin

        SetDimensionsVisibility();

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
}
