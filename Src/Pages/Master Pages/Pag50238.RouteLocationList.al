page 50238 "Route Location List"
{
    ApplicationArea = All;
    Caption = 'Route Location';
    PageType = List;
    SourceTable = "Route Location";
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
