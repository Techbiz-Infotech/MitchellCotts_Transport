page 50180 "Contract option List"
{
    ApplicationArea = All;
    Caption = 'Contract option';
    PageType = List;
    SourceTable = "Contract option code";
    UsageCategory = Lists;
    CardPageId = "Contract option Card";
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
