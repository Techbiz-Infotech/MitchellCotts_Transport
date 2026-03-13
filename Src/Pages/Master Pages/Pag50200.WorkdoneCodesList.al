page 50200 "Workdone Codes List"
{
    ApplicationArea = All;
    Caption = 'Workdone Codes';
    PageType = List;
    SourceTable = "Workdone Codes";
    UsageCategory = Lists;
    InsertAllowed = false;
    ModifyAllowed = false;
    CardPageId = "Workdone Codes Card";
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
                field(Tyres; Rec.Tyres)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
