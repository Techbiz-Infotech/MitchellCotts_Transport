page 50266 "Workshop and Stock"
{
    ApplicationArea = All;
    Caption = 'Workshop and Stock';
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
            part(JobsMaintenance; "Jobs & Maintenance Activities")
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
            group("Workshop & Stock")
            {
                Caption = 'Workshop & Stock';
                Image = Sales;
                action(Maintenances)
                {
                    Caption = 'Workshop Jobs';
                    RunObject = Page "Workshop Jobs List";
                    ApplicationArea = All;
                }
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
                action("Stock Return")
                {
                    Caption = 'Stock Return';
                    RunObject = Page "Stock Return List";
                    ApplicationArea = All;
                }

            }
        }
    }
}
profile MyProfile3
{
    ProfileDescription = 'Workshop & Stock';
    RoleCenter = "Workshop and Stock";
    Caption = 'Workshop & Stock';
}
