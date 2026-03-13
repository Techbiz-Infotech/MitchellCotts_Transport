pageextension 50123 "Unigroup Cues Ext" extends "Business Manager Role Center"
{
    layout
    {
        addafter(Control16)
        {
            part(TripActivities; "Trip Activities")
            {
                ApplicationArea = Suite;
            }
            part(JobsMaintenance; "Jobs & Maintenance Activities")
            {
                ApplicationArea = Suite;
            }
            part("IMS PurchaseOrderActivities"; "IMS PurchaseOrderActivities")
            {
                ApplicationArea = suite;
            }
        }
        modify("User Tasks Activities")
        {
            Visible = false;
        }
        modify(Emails)
        {
            Visible = false;
        }
        modify("Intercompany Activities")
        {
            Visible = false;
        }
        modify(Control46)
        {
            Visible = false;
        }

    }

    actions
    {

        addafter(Action41)
        {


            group(Trips)
            {
                Caption = 'Trips';
                Image = FixedAssets;
                action(Trip)
                {
                    Caption = 'Trips';
                    RunObject = Page "Trip list";
                    ApplicationArea = All;
                }
                action(TripInvoice)
                {
                    Caption = 'Trip Invoices';
                    RunObject = Page "Trip Invoice List";
                    ApplicationArea = All;
                }
            }
            group(Vehicle)
            {
                Caption = 'Vehicle';
                Image = FixedAssets;
                action(Vehicles)
                {
                    Caption = 'Vehicle';
                    RunObject = Page "Vehicle List";
                    ApplicationArea = All;
                }
                action(Drivers)
                {
                    Caption = 'Drivers';
                    RunObject = Page "Driver List";
                    ApplicationArea = All;
                }
            }
            group(Fuels)
            {
                Caption = 'Fuel';
                Image = FixedAssets;
                action(Fuel)
                {
                    Caption = 'Fuel Issues';
                    RunObject = Page "Fuel Issue List";
                    ApplicationArea = All;
                }
                action(PostedFuel)
                {
                    Caption = 'Posted Fuel Issues';
                    RunObject = Page "Posted Fuel Issue List";
                    ApplicationArea = All;
                }
            }
            group(Maintenance)
            {
                Caption = 'Maintenance';
                Image = FixedAssets;
                action(Maintenances)
                {
                    Caption = 'Workshop Jobs';
                    RunObject = Page "Workshop Jobs List";
                    ApplicationArea = All;
                }
            }
            group(Stock)
            {
                Caption = 'Stock';
                Image = FixedAssets;
                action("Stock Request")
                {
                    Caption = 'Stock Requests';
                    RunObject = Page "Stock Request list";
                    ApplicationArea = All;
                }
                action("Stock Issue")
                {
                    Caption = 'Stock Issues';
                    RunObject = Page "Stock Issue list";
                    ApplicationArea = All;
                }
            }
            group(PettyCash)
            {
                Caption = 'Petty Cash';
                action("Petty Cash Expenses Details")
                {
                    Caption = 'Petty Cash Expenses';
                    RunObject = Page "Petty Cash Expenses List";
                    ApplicationArea = All;
                }
                action("Posted Petty Cash Expenses Details")
                {
                    Caption = 'Posted Petty Cash Expenses';
                    RunObject = Page "Posted Petty Cash ExpensesList";
                    ApplicationArea = All;
                }
            }
            group(Masters)
            {
                Caption = 'Masters';
                Image = FixedAssets;
                action(Route)
                {
                    Caption = 'Route';
                    RunObject = Page "Route List";
                    ApplicationArea = All;
                }
                action("Body Types")
                {
                    Caption = 'Body Types';
                    RunObject = Page "Body Type List";
                    ApplicationArea = All;
                }
                action(Make)
                {
                    Caption = 'Make';
                    RunObject = Page "Make List";
                    ApplicationArea = All;
                }
                action("Model Code")
                {
                    Caption = 'Model Code';
                    RunObject = Page "Model Code List";
                    ApplicationArea = All;
                }
                action(Drive)
                {
                    Caption = 'Drive';
                    RunObject = Page "Drive List";
                    ApplicationArea = All;
                }
                action("Gearbox Types")
                {
                    Caption = 'Gearbox Types';
                    RunObject = Page "Gearbox Type List";
                    ApplicationArea = All;
                }
                action("Brake Types")
                {
                    Caption = 'Brake Types';
                    RunObject = Page "Brake Types List";
                    ApplicationArea = All;
                }

                action("Cylinder Types")
                {
                    Caption = 'Cylinder Types';
                    RunObject = Page "Cylinder Types List";
                    ApplicationArea = All;
                }
                action("Engine Types")
                {
                    Caption = 'Engine Types';
                    RunObject = Page "Engine Types List";
                    ApplicationArea = All;
                }
                action("Suspention types")
                {
                    Caption = 'Suspention types';
                    RunObject = Page "Suspention types list";
                    ApplicationArea = All;
                }
                action(Models)
                {
                    Caption = 'Models';
                    RunObject = Page "Models List";
                    ApplicationArea = All;
                }
                action("Steering Types")
                {
                    Caption = 'Steering Types';
                    RunObject = Page "Steering Types List";
                    ApplicationArea = All;
                }
                action("Road Types")
                {
                    Caption = 'Road Types';
                    RunObject = Page "Road Types List";
                    ApplicationArea = All;
                }
                action("Vehicle Colours")
                {
                    Caption = 'Vehicle Colours';
                    RunObject = Page "Vehicle Colours List";
                    ApplicationArea = All;
                }
                action("Vehicle Type")
                {
                    Caption = 'Vehicle Type';
                    RunObject = Page "Vehicle Type List";
                    ApplicationArea = All;
                }
                action(Manufacturer)
                {
                    Caption = 'Manufacturer';
                    RunObject = Page "Manufacturer List";
                    ApplicationArea = All;
                }

            }

        }
    }

}
pageextension 50124 "Unigroup Hide CueExt" extends "O365 Activities"
{
    layout
    {
        modify(Camera)
        {
            Visible = false;
        }
    }
}