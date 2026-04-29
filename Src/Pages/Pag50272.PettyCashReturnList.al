page 50272 "Petty Cash Return"
{
    ApplicationArea = All;
    Caption = 'Petty Cash Return';
    PageType = List;
    SourceTable = "Petty Cash Return";
    UsageCategory = Lists;
    Editable = false;
    DeleteAllowed = false;
    CardPageId = "Petty Cash Return Card";



    layout
    {
        area(content)
        {
            repeater(General)
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

                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;

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

                field(Posted; Rec.Posted)
                {
                    ApplicationArea = All;
                    Visible = false;
                }

            }
        }
    }
}
