page 50126 "Brake Types List"
{
    ApplicationArea = All;
    Caption = 'Brake Types';
    PageType = List;
    CardPageId = "Brake Type Card";
    SourceTable = "Brake Types";
    UsageCategory = Lists;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Code; Rec.Code)
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