page 57079 "Shunting Details"
{
    ApplicationArea = All;
    Caption = 'Shunting Details';
    PageType = List;
    SourceTable = "Shunting Details";
    UsageCategory = Lists;
    InsertAllowed = false;
    DeleteAllowed = false;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Shunting Trip ID"; Rec."Shunting Trip ID")
                {
                    ToolTip = 'Specifies the value of the Shunting Trip No. field.';
                    ApplicationArea = all;

                }
                field("Litres Per Trip"; Rec."Litres Per Trip")
                {
                    ToolTip = 'Specifies the value of the Litres Per Trip field.';
                    ApplicationArea = all;
                }
                field("Trip Completed"; Rec."Trip Completed")
                {
                    ToolTip = 'Specifies the value of the Trip Completed field.';
                    ApplicationArea = all;
                }
                field("Billing Status"; Rec."Billing Status")
                {
                    ToolTip = 'Specifies the value of the Billing Status field.';
                    ApplicationArea = all;
                }
                field("Trip Id"; Rec."Trip Id")
                {
                    ToolTip = 'Specifies the value of the Trip Id field.';
                    ApplicationArea = all;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ToolTip = 'Specifies the value of the No. Series field.', Comment = '%';
                    ApplicationArea = all;
                }
                field("Container No."; Rec."Container No.")
                {
                    ToolTip = 'Specifies the value of the Container No. field.';
                    ApplicationArea = all;
                }
                field("Container Size"; Rec."Container Size")
                {
                    ToolTip = 'Specifies the value of the Container Size field.';
                    ApplicationArea = all;
                }
                field("Container Charge"; Rec."Container Charge")
                {
                    ToolTip = 'Specifies the value of the Container Charge field.';
                    ApplicationArea = all;
                }
                field("Cargo type"; Rec."Cargo type")
                {
                    ToolTip = 'Specifies the value of the Cargo Type field.';
                    ApplicationArea = all;
                }
                field("Delivery Note No"; Rec."Delivery Note No")
                {
                    ToolTip = 'Specifies the value of the Delivery Note No field.';
                    ApplicationArea = all;
                }
                field("Interchange No"; Rec."Interchange No")
                {
                    ToolTip = 'Specifies the value of the Interchange No field.';
                    ApplicationArea = all;
                }
                field("Booking No"; Rec."Booking No")
                {
                    ToolTip = 'Specifies the value of the Booking No field.';
                    ApplicationArea = all;
                }
                field("Additional Remarks"; Rec."Additional Remarks")
                {
                    ToolTip = 'Specifies the value of the Additional Remarks field.';
                    ApplicationArea = all;
                }
                field("Posted Invoice No."; Rec."Posted Invoice No.")
                {
                    ToolTip = 'Specifies the value of the Posted Invoice No. field.';
                    ApplicationArea = all;
                }
                field("Shunting Trip Date"; Rec."Shunting Trip Date")
                {
                    ToolTip = 'Specifies the value of the Shunting Trip Date field.';
                    ApplicationArea = all;
                }
                field("Trip Date"; Rec."Trip Date")
                {
                    ToolTip = 'Specifies the value of the Trip Date field.';
                    ApplicationArea = all;
                }
                field("Created By"; Rec."Created By")
                {
                    ToolTip = 'Specifies the value of the Created By field.', Comment = '%';
                    ApplicationArea = all;
                }
                field("Created Date"; Rec."Created Date")
                {
                    ToolTip = 'Specifies the value of the Created Date field.', Comment = '%';
                    ApplicationArea = all;
                }
                field("Last Modified by"; Rec."Last Modified by")
                {
                    ToolTip = 'Specifies the value of the Last Modified by field.', Comment = '%';
                    ApplicationArea = all;
                }
                field("Last Modified Date"; Rec."Last Modified Date")
                {
                    ToolTip = 'Specifies the value of the Last Modified Date field.', Comment = '%';
                    ApplicationArea = all;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                    ApplicationArea = all;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                    ApplicationArea = all;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                    ApplicationArea = all;
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.';
                    ApplicationArea = all;
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 5 Code field.';
                    ApplicationArea = all;
                }
                field("Shortcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 6 Code field.';
                    ApplicationArea = all;
                }
                field("Shortcut Dimension 7 Code"; Rec."Shortcut Dimension 7 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 7 Code field.';
                    ApplicationArea = all;
                }
                field("Shortcut Dimension 8 Code"; Rec."Shortcut Dimension 8 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 8 Code field.';
                    ApplicationArea = all;
                }

            }
        }
    }
}
