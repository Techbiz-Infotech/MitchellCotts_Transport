page 50236 "Driver Licence type List"
{
    ApplicationArea = All;
    Caption = 'Driver Licence type';
    PageType = List;
    SourceTable = "Driver Licence type";
    UsageCategory = Lists;
    CardPageId = "Driver Licence type card";
    InsertAllowed = false;
    ModifyAllowed = false;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }
}
