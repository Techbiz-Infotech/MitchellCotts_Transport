page 57130 "Incident Type List"
{
    ApplicationArea = All;
    Caption = 'Incident Type List';
    PageType = List;
    SourceTable = "Incident Type";
    UsageCategory = Lists;
    CardPageId = "Incident Type Card";
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
