page 57084 "Model Code List"
{
    ApplicationArea = All;
    Caption = 'Model Codes';
    PageType = List;
    CardPageId = "Model Code Card";
    SourceTable = "Model Code";
    UsageCategory = Administration;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Model Code"; Rec."Model Code")
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