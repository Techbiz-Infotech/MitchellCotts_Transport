page 50148 "Route List"
{
    PageType = List;
    Caption = 'Routes';
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Route;
    CardPageId = "Routes Card";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Route Code"; Rec."Route Code")
                {
                    ApplicationArea = All;

                }
                field("Route From"; Rec."Route From")
                {
                    ApplicationArea = All;
                }
                field("Route To"; Rec."Route To")
                {
                    ApplicationArea = All;
                }
                field(KM; Rec."Route KM")
                {
                    ApplicationArea = All;
                }
                field("Standard Route Price"; Rec."Standard Route Price")
                {
                    ApplicationArea = All;
                }
                field("Fuel Allocation"; Rec."Fuel Allocation")
                {
                    ApplicationArea = All;
                }
                field("Allowance Per Day"; Rec."Allowance Per Day")
                {
                    ApplicationArea = All;
                }
                field("TAT In Days"; Rec."TAT In Days")
                {
                    ApplicationArea = All;
                }
                field("Route Type"; Rec."Route Type")
                {
                    ApplicationArea = All;
                }
                field("Route Approval Status"; Rec."Route Approval Status")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}