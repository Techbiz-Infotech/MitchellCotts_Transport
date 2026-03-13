page 50162 "Driver Licence List"
{
    ApplicationArea = All;
    Caption = 'Driver Licence';
    PageType = List;
    SourceTable = "Driver Licence";
    UsageCategory = Lists;
    InsertAllowed = false;
    ModifyAllowed = false;
    CardPageId = "Driver Licence Card";
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = All;
                }
                field("Driver Licence type"; Rec."Driver Licence type")
                {
                    ApplicationArea = All;
                }
                field("Licence No.";Rec."Licence No.")
                {
                    ApplicationArea = All;
                }
                field("Licence Expiry"; Rec."Licence Expiry")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
