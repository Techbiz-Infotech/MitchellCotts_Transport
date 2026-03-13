page 50213 "Road Types List"
{
    ApplicationArea = All;
    Caption = 'Road Types';
    PageType = List;
    SourceTable = "Road Types";
    UsageCategory = Lists;
    CardPageId = "Road Types card";
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
