page 50261 "Posted Stock Return List"
{
    ApplicationArea = All;
    Caption = 'Posted Stock Return';
    PageType = List;
    SourceTable = "Stock Return Header";
    UsageCategory = Lists;
    CardPageId = "Posted Stock Return";
    Editable = false;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Stock Return No."; Rec."Stock Return No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Stock Return No. field.';
                }
                field("Stock Return Date"; Rec."Stock Return Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Stock Return No Date field.';
                }
                field("Job Card No."; Rec."Job Card No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Job Card No field.';
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
                field("Issued To"; Rec."Issued To")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Issued To field.';
                }
                field("Mechanic No"; Rec."Mechanic No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mechanic No field.';
                }
                field("Mechanic Name"; Rec."Mechanic Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mechanic Name field.';
                }
                field("Return By"; Rec."Return By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Requested By field.';
                }

            }

        }
    }
}
