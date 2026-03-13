page 50219 "Weather List"
{
    ApplicationArea = All;
    Caption = 'Weather';
    PageType = List;
    SourceTable = Weather;
    UsageCategory = Lists;
    CardPageId = "Weather Card";
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
