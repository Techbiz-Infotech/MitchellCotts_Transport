page 50175 "Posted Allocation Card"
{
    Caption = 'Posted Allocation';
    PageType = List;
    SourceTable = Allocation;
    SourceTableView = where(Posted = filter(true));
    layout
    {
        area(content)
        {
            group(General)
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
                group("Period from")
                {
                    Caption = 'Period from';
                    field("Start Date"; Rec."Start Date")
                    {
                        ApplicationArea = All;
                    }
                    field(Odometer; Rec.Odometer)
                    {
                        ApplicationArea = All;
                    }
                }
                group("Period to")
                {
                    Caption = 'Period to';
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
}
