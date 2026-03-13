page 50221 "Vehicle Colours List"
{
    ApplicationArea = All;
    Caption = 'Vehicle Colours';
    PageType = List;
    SourceTable = "Vehicle Colours";
    UsageCategory = Lists;
    CardPageId = "Vehicle Colours Card";
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
                field("Interior/Exterior"; Rec."Interior/Exterior")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
