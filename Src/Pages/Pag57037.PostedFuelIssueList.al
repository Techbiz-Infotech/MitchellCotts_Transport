page 57037 "Posted Fuel Issue List"
{
    ApplicationArea = All;
    Caption = 'Posted Fuel Issue';
    PageType = List;
    SourceTable = "Fuel Issue";
    CardPageId = "Posted Fuel Issue card";
    UsageCategory = Lists;
    Editable = false;
    SourceTableView = where(Posted = filter(true));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Fuel Issue No."; Rec."Fuel Issue No.")
                {
                    ApplicationArea = All;
                }
                field("Issue Date"; Rec."Issue Date")
                {
                    ApplicationArea = All;
                }
                field("Fuel Type"; Rec."Fuel Type")
                {
                    ApplicationArea = All;
                }
                field("Trip ID"; Rec."Trip ID")
                {
                    ApplicationArea = All;
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ApplicationArea = All;
                }
                field("Trailer No."; Rec."Trailer No.")
                {
                    ApplicationArea = All;
                }
                field("Fuel Reversed"; Rec."Fuel Reversed")
                {
                    ApplicationArea = All;
                }
                field("Fuel Return No."; Rec."Fuel Return No.")
                {
                    ApplicationArea = All;
                }
                field("Tank Size"; Rec."Tank Size")
                {
                    ApplicationArea = All;
                }
                field("Driver ID"; Rec."Driver ID")
                {
                    ApplicationArea = All;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = All;
                }
                field(Pump; Rec.Pump)
                {
                    ApplicationArea = All;
                }
                field("Fueling Station Name"; Rec."Fueling Station Name")
                {
                    ApplicationArea = All;
                }
                field(Odometer; Rec.Odometer)
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
                {
                    ApplicationArea = All;
                }
                field("Balance Fuel in Vehicle";Rec."Balance Fuel in Truck")
                {
                    ApplicationArea = All;
                }

                field("Unit of measure"; Rec."Unit of measure")
                {
                    ApplicationArea = All;
                }

                field("Fuel Approval Status"; Rec."Fuel Approval Status")
                {
                    ApplicationArea = All;
                }
                field("Required Fuel In Litres"; Rec."Required Fuel In Litres")
                {
                    ApplicationArea = All;
                }
                field("Shortage in liters(If Any)"; Rec."Shortage in liters(If Any)")
                {
                    ApplicationArea = All;
                }
                field("Net Requirement in litres"; Rec."Net Requirement in litres")
                {
                    ApplicationArea = All;
                }
                field("Transaction Time"; Rec."Transaction Time")
                {
                    ApplicationArea = All;
                }
                field("Transaction No."; Rec."Transaction No.")
                {
                    ApplicationArea = All;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = All;
                    Visible = false;
                }
            }
        }
    }
}