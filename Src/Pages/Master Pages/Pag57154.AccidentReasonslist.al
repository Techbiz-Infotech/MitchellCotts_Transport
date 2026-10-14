page 57154 "Accident Reasons list"
{
    ApplicationArea = All;
    Caption = 'Accident Reasons';
    PageType = List;
    SourceTable = "Accident Reasons";
    UsageCategory = Lists;
    CardPageId = "Accident Reasons Card";
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
                field("Is Road Traffic Accident"; Rec."Is Road Traffic Accident")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
