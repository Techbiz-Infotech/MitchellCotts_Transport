page 57080 "Transport Request List"
{
    CardPageId = "Request For Transport";
    ApplicationArea = All;
    Caption = 'Transport Request List';
    PageType = List;
    SourceTable = "Transport Request Header";
    UsageCategory = Lists;
    DeleteAllowed = false;
    Editable = false;


    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(" RFT No"; Rec." RFT No")
                {
                    ToolTip = 'Specifies the value of the RFT No field.', Comment = '%';
                }
                field("Shipping Line"; Rec."Shipping Line")
                {
                    ToolTip = 'Specifies the value of the Shipping Line field.', Comment = '%';
                }
                field("Application Date"; Rec."Application Date")
                {

                }
                field(Status; Rec.Status)
                {

                }
                field("B/L No"; Rec."B/L No")
                {

                }


            }
        }
    }
}

