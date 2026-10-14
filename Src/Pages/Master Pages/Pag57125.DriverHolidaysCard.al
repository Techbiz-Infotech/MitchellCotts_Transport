page 57125 "Driver Holidays Card"
{
    Caption = 'Driver Holidays';
    PageType = Card;
    SourceTable = "Driver Holidays";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Driver Id"; Rec."Driver Id")
                {
                    ApplicationArea = All;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = All;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }

            }
        }
    }
}
