page 50152 "Trip Status History List"
{
    ApplicationArea = All;
    Caption = 'Trip Status History List';
    PageType = List;
    SourceTable = "Trip Status History";
    UsageCategory = Lists;
    InsertAllowed = false;
    ModifyAllowed = false;
    CardPageId = "Trip Status History Card";
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Table name"; Rec."Table name")
                {
                    ApplicationArea = All;
                }
                field(RECNO; Rec.RECNO)
                {
                    ApplicationArea = All;
                }
                field("Status Code"; Rec."Status Code")
                {
                    ApplicationArea = All;
                }
                field("Status Comments"; Rec."Status Comments")
                {
                    ApplicationArea = All;
                }
                field("Status Date"; Rec."Status Date")
                {
                    ApplicationArea = All;
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = All;
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                }
                field("Duration Minutes"; Rec."Duration Minutes")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
