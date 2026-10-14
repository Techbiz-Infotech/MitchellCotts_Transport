page 57115 "Allocation List"
{
    ApplicationArea = All;
    Caption = 'Allocation';
    PageType = List;
    SourceTable = Allocation;
    UsageCategory = Lists;
    InsertAllowed = false;
    ModifyAllowed = false;
    CardPageId = "Allocation Card";
    DeleteAllowed = false;
    SourceTableView = where(Posted = filter(false));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Allocation No"; Rec."Allocation No")

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
