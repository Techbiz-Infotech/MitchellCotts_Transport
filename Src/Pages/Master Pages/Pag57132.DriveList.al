page 57132 "Drive List"
{
    ApplicationArea = All;
    Caption = 'Driver List';
    PageType = List;
    SourceTable = Driver;
    UsageCategory = Lists;
    CardPageId = "Drive Card";
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Driver Name';
                }
                field("Port Pass No"; Rec."Port Pass No")
                {
                    ApplicationArea = All;

                }
                field("Driver ID No"; Rec."Driver ID No")
                {
                    ApplicationArea = All;

                }
            }
        }
    }
}
