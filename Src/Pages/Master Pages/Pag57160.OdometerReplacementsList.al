page 57160 "Odometer Replacements List"
{
    ApplicationArea = All;
    Caption = 'Odometer Replacements';
    PageType = List;
    SourceTable = "Odometer Replacements";
    UsageCategory = Lists;
    CardPageId = "Odometer Replacements Card";
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    layout
    {
        area(content)
        {
            repeater(General)
            {
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
