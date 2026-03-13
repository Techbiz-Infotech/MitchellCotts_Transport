page 50217 "Road conditions List"
{
    ApplicationArea = All;
    Caption = 'Road conditions';
    PageType = List;
    SourceTable = "Road conditions";
    UsageCategory = Lists;
    CardPageId = "Road conditions Card";
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
                }
            }
        }
    }
}
