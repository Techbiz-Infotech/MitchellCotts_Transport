page 50172 "Drive List"
{
    ApplicationArea = All;
    Caption = 'Drive';
    PageType = List;
    SourceTable = Drives;
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
                }
            }
        }
    }
}
