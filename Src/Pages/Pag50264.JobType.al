page 50264 "Job Type"
{
    ApplicationArea = All;
    Caption = 'Job Type';
    PageType = List;
    SourceTable = "Job Type";
    UsageCategory = Lists;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Job Type"; Rec."Job Type")
                {
                    ToolTip = 'Specifies the value of the Job Type field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Due Days"; Rec."Due Days")
                {
                    ToolTip = 'Specifies the value of the Due Days field.';
                }
            }
        }
    }
}
