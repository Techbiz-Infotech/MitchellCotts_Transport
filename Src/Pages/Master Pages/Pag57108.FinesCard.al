page 57108 "Fines Card"
{
    Caption = 'Fines';
    PageType = Card;
    SourceTable = Fines;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Fine No."; Rec."Fine No.")
                {
                    ApplicationArea = All;
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field("Driver ID"; Rec."Driver ID")
                {
                    ApplicationArea = All;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Driver Name field.';
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Registration No. field.';
                }
                field("Offence Date"; Rec."Offence Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Offence Date field.';
                }
                field("Fine Amount Kshs"; Rec."Fine Amount Kshs")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fine Amount Kshs field.';
                }
                field("Fine Paid Date"; Rec."Fine Paid Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fine Paid Date field.';
                }

                field("Driver or Company"; Rec."Driver or Company")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Driver or Company field.';
                }
                field("Driver Paid Date"; Rec."Driver Paid Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Driver Paid Date field.';
                }
                field("Offence Description"; Rec."Offence Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Offence Description field.';
                }
            }
        }
    }

}