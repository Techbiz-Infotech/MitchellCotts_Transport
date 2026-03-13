page 50118 "Gearbox Type List"
{
    //ApplicationArea = All;
    Caption = 'Gearbox Type';
    PageType = List;
    CardPageId = "Gearbox Type Card";
    SourceTable = "Gearbox Type";
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