page 50114 "Make List"
{
    ApplicationArea = All;
    Caption = 'Make';
    PageType = List;
    CardPageId = "Make Card";
    SourceTable = Make;
    UsageCategory = Lists;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Make Code"; Rec."Make Code")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }

    }
}