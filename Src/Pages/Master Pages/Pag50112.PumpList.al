page 50112 "Pump List"
{
    ApplicationArea = All;
    Caption = 'Pumps';
    PageType = List;
    SourceTable = Pump;
    UsageCategory = Lists;
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
                field("Fuel Vendor No."; Rec."Fuel Vendor No.")
                {
                    ApplicationArea = All;
                }
                field("Fuel Location"; Rec."Fuel Location")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}