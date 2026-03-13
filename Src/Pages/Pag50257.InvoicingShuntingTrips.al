page 50257 InvoicingShuntingTrips
{
    ApplicationArea = All;
    Caption = 'Invoicing Trip Details';
    PageType = ListPart;
    SourceTable = "Invoicing Shunting Trips";
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.';
                    Visible = false;
                }
                field("Shunting Trip ID"; Rec."Shunting Trip ID")
                {
                    ToolTip = 'Specifies the value of the Shunting Trip ID field.';
                }
                field("Trip Id"; Rec."Trip Id")
                {
                    ToolTip = 'Specifies the value of the Trip Id field.';
                }
                field("Container No."; Rec."Container No.")
                {
                    ToolTip = 'Specifies the value of the Container No. field.';
                }
                field("Container Size"; Rec."Container Size")
                {
                    ToolTip = 'Specifies the value of the Container Size field.';
                }
                field("Cargo type"; Rec."Cargo type")
                {
                    ToolTip = 'Specifies the value of the Cargo Type field.';
                }
                field("Invoice No."; Rec."Invoice No.")
                {
                    ToolTip = 'Specifies the value of the Invoice No. field.';
                    Visible = false;
                }
                field("Posted Invoice No."; Rec."Posted Invoice No.")
                {
                    ToolTip = 'Specifies the value of the Posted Invoice No. field.';
                    Visible = false;
                }
                field("Invoice Line No."; Rec."Invoice Line No.")
                {
                    ToolTip = 'Specifies the value of the Invoice Line No. field.';
                    Visible = false;
                }
                field("Posted Invoice Line No."; Rec."Posted Invoice Line No.")
                {
                    ToolTip = 'Specifies the value of the Posted Invoice Line No. field.';
                    Visible = false;
                }

                field("Delivery Note No"; Rec."Delivery Note No")
                {
                    ToolTip = 'Specifies the value of the Delivery Note No. field.';
                }
                field("Booking No"; Rec."Booking No")
                {
                    ToolTip = 'Specifies the value of the Booking field.';
                }
                field("Additional Remarks"; Rec."Additional Remarks")
                {
                    ToolTip = 'Specifies the value of the Additional Remarks field.';
                }
                field("Trip Date"; Rec."Trip Date")
                {
                    ToolTip = 'Specifies the value of the Trip Date field.';
                }
                field("Shunting Trip Date"; Rec."Shunting Trip Date")
                {
                    ToolTip = 'Specifies the value of the Shunting Trip Date field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.';
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 5 Code field.';
                }
                field("Shortcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 6 Code field.';
                }
                field("Shortcut Dimension 7 Code"; Rec."Shortcut Dimension 7 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 7 Code field.';
                }
                field("Shortcut Dimension 8 Code"; Rec."Shortcut Dimension 8 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 8 Code field.';
                }
            }
        }
    }
}
