page 57150 "Job Card Services List"
{
    ApplicationArea = All;
    Caption = 'Job Card Services';
    PageType = List;
    SourceTable = "Job Card Services";
    UsageCategory = Lists;


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
