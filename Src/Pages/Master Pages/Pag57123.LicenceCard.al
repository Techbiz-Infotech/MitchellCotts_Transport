page 57123 "Driver Licence Card"
{
    Caption = 'Driver Licence';
    PageType = Card;
    SourceTable = "Driver Licence";

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
                field("Driver Licence type"; Rec."Driver Licence type")
                {
                    ApplicationArea = All;
                }
                field("Licence No.";Rec."Licence No.")
                {
                    ApplicationArea = All;
                }
                field("Licence Expiry"; Rec."Licence Expiry")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
