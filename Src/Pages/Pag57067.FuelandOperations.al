page 57067 "Fuel and Operations"
{
    ApplicationArea = All;
    Caption = 'Fuel and Operations';
    PageType = RoleCenter;
    UsageCategory = Administration;

    layout
    {
        area(rolecenter)
        {
            part(Control60; "Unigroup Headline")
            {
                ApplicationArea = RelationshipMgmt;
            }
            part(TripActivities; "Trip Activities")
            {
                ApplicationArea = Suite;
            }
            part(ApprovalsActivities; "Approvals Activities")
            {
                ApplicationArea = RelationshipMgmt;
            }
            part("Report Inbox Part"; "Report Inbox Part")
            {
                ApplicationArea = Basic, Suite;
            }
            systempart(MyNotes; MyNotes)
            {
                ApplicationArea = Basic, Suite;
            }
        }
    }
    actions
    {
        area(Sections)
        {
            group("Fuel and Operations")
            {
                Caption = 'Fuel and Operations';
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
        }
    }
}
profile MyProfile2
{
    ProfileDescription = 'Fuel and Operations';
    RoleCenter = "Fuel and Operations";
    Caption = 'Fuel and Operations';
}