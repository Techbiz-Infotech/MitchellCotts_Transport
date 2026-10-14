page 57134 "Posted Allocation List"
{

    ApplicationArea = All;
    Caption = 'Posted Allocation';
    PageType = List;
    SourceTable = Allocation;
    UsageCategory = Lists;
    InsertAllowed = false;
    ModifyAllowed = false;
    CardPageId = "Posted Allocation Card";
    SourceTableView = where(Posted = filter(true));
    Editable = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Driver ID"; Rec."Driver ID")
                {
                    ApplicationArea = All;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = All;
                }
             
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }
                field(Lock; Rec.Lock)
                {
                    ApplicationArea = All;
                }
                field("Company Code"; Rec."Company Code")
                {
                    ApplicationArea = All;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                }
                field(Odometer; Rec.Odometer)
                {
                    ApplicationArea = All;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                }
                field("Allocation Reason"; Rec."Allocation Reason")
                {
                    ApplicationArea = All;
                }
                field("End Odometer"; Rec."End Odometer")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
