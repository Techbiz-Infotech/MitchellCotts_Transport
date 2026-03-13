page 50212 "Odometer Replacements Card"
{
    Caption = 'Odometer Replacements';
    PageType = Card;
    SourceTable = "Odometer Replacements";
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ApplicationArea = All;
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                }
                field("Time"; Rec."Time")
                {
                    ApplicationArea = All;
                }
                field("Old Odometer"; Rec."Old Odometer")
                {
                    ApplicationArea = All;
                }
                field("New Odometer"; Rec."New Odometer")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
