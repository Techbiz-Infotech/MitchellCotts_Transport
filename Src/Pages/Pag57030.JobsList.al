page 57030 "Workshop Jobs List"
{
    ApplicationArea = All;
    Caption = 'Workshop Jobs';
    PageType = List;
    SourceTable = "Workshop Jobs";
    SourceTableView = SORTING("Job Card No.") ORDER(Descending);
    UsageCategory = Lists;
    CardPageId = "Workshop Jobs Card";
    Editable = false;
    DeleteAllowed = false;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Job Card No."; Rec."Job Card No.")
                {
                    ApplicationArea = All;
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ApplicationArea = All;
                }
                field("Make Code"; Rec."Make Code")
                {
                    ApplicationArea = All;
                }
                field("Model Code"; Rec."Model Code")
                {
                    ApplicationArea = All;
                }
                field("Job Status"; Rec."Job Status")
                {
                    ApplicationArea = All;
                }
                field("Job Type"; Rec."Job Type")
                {
                    ApplicationArea = All;
                }
                // field("Driver ID"; Rec."Driver ID")
                // {
                //     ApplicationArea = All;
                // }
                // field("Driver Name"; Rec."Driver Name")
                // {
                //     ApplicationArea = All;
                // }
                field("Odometer In"; Rec."Odometer In")
                {
                    ApplicationArea = All;
                }
                field("Odometer Out"; Rec."Odometer Out")
                {
                    ApplicationArea = All;
                }
                field("Appointed Mechanic Name"; Rec."Appointed Mechanic Name")
                {
                    ApplicationArea = All;
                }
                field("Appointed Welder Name"; Rec."Appointed Welder Name")
                {
                    ApplicationArea = All;
                }
                field("Appointed Tyreman Name"; Rec."Appointed Tyreman Name")
                {
                    ApplicationArea = All;
                }
                field("Appointed Electrician Name"; Rec."Appointed Electrician Name")
                {
                    ApplicationArea = All;
                }
                field("Appointed Panel Beater Name"; Rec."Appointed Panel Beater Name")
                {
                    ApplicationArea = All;
                }
                // field("Chassis No."; Rec."Chassis No.")
                // {
                //     ApplicationArea = All;
                // }
                // field("Date Registered"; Rec."Date Registered")
                // {
                //     ApplicationArea = All;
                // }
                field("Job Date"; Rec."Job Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
