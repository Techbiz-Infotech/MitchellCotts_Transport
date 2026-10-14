page 57128 "Mobility Details List"
{
    ApplicationArea = All;
    Caption = 'Mobility Details';
    PageType = List;
    SourceTable = "Mobility Details";
    UsageCategory = Lists;
    CardPageId = "Mobility Details Card";
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Mobility No."; Rec."Mobility No.")
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
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                }
                field("Budget Total"; Rec."Budget Total")
                {
                    ApplicationArea = All;
                }
                field("Spend Total"; Rec."Spend Total")
                {
                    ApplicationArea = All;
                }
                field("Budget Balance"; Rec."Budget Balance")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
