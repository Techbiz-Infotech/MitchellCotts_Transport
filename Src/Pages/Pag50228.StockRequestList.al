page 50228 "Stock Request list"
{
    ApplicationArea = All;
    Caption = 'Stock Requests';
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "Stock request header";
    CardPageId = "Stock Request";
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Stock Request No."; Rec."Stock Request No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Stock Request No. field.';
                }
                field("Stock Request Date"; Rec."Stock Request Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Stock Request Date field.';
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
                field("Issued To"; Rec."Issued To")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Issued To field.';
                }
                field("Requested By"; Rec."Requested By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Requested By field.';
                }
                
            }

        }
    }


}

