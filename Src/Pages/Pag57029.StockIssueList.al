page 57029 "Stock Issue list"
{
    ApplicationArea = All;
    Caption = 'Stock Issues';
    PageType = List;
    SourceTable = "Stock Issue header";
    UsageCategory = Lists;
    CardPageId = "Stock Issue Document";
    Editable = false;
    DeleteAllowed = false;
    layout
    {
        area(content)
        {
            repeater(General)
            {

                field("Stock Issue No."; Rec."Stock Issue No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Stock Issue No. field.';
                }
                field("Stock Issue Date"; Rec."Stock Issue Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Stock Issue Date field.';
                }
                field("Job Card No."; Rec."Job Card No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Job Card No field.';
                }
                field("Job Type"; Rec."Job Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type Of Job field.';
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vehicle No. field.';
                }
                field("Driver ID"; Rec."Driver ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Driver ID field.';
                }
                field("Mechanic No."; Rec."Mechanic No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mechanic No field.';
                }
                field("Mechanic Name";Rec."Mechanic Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mechanic Name field.';
                }
            }

        }
    }
}

