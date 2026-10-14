page 57158 "Odometer History List"
{
    ApplicationArea = All;
    Caption = 'Odometer History';
    PageType = List;
    SourceTable = "Odometer History";
    UsageCategory = Lists;
    CardPageId = "Odometer History Card";
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No.";Rec."Entry No.")
                {
                    ApplicationArea = All;
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ApplicationArea = All;
                }
                field("Odometer start"; Rec."Odometer start")
                {
                    ApplicationArea = All;
                }
                field("Odometer end"; Rec."Odometer end")
                {
                    ApplicationArea = All;
                }
                field("Distance travelled"; Rec."Distance travelled")
                {
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }
                field("Company code"; Rec."Company code")
                {
                    ApplicationArea = All;
                }
                field(Country; Rec.Country)
                {
                    ApplicationArea = All;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                }
                field("Actual Value"; Rec."Actual Value")
                {
                    ApplicationArea = All;
                }
                field(MPG; Rec.MPG)
                {
                    ApplicationArea = All;
                }
                field("Co2 KG"; Rec."Co2 KG")
                {
                    ApplicationArea = All;
                }
                field("Period start"; Rec."Period start")
                {
                    ApplicationArea = All;
                }
                field("Period end"; Rec."Period end")
                {
                    ApplicationArea = All;
                }
                field("Cost per Mile";Rec."Cost per Mile")
                {
                    ApplicationArea = All;
                }
                field("Fuel Type"; Rec."Fuel Type")
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
