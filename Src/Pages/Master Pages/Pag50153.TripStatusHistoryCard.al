page 50153 "Trip Status History Card"
{
    Caption = 'Trip Status History';
    PageType = Card;
    SourceTable = "Trip Status History";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

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
