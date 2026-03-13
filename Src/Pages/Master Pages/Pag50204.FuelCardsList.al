page 50204 "Fuel Cards List"
{
    //ApplicationArea = All;
    Caption = 'Fuel Cards';
    PageType = List;
    SourceTable = "Fuel Cards";
    //UsageCategory = Lists;
    CardPageId = "Fuel Cards Card";
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Fuel Card No."; Rec."Fuel Card No.")
                {
                    ApplicationArea = All;
                }
                field("Transaction limit"; Rec."Transaction limit")
                {
                    ApplicationArea = All;
                }
                field("Fuel Type"; Rec."Fuel Type")
                {
                    ApplicationArea = All;
                }
                field("Payroll No"; Rec."Payroll No")
                {
                    ApplicationArea = All;
                }
             
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                }
                field(System; Rec.System)
                {
                    ApplicationArea = All;
                }
                field(Expiry; Rec.Expiry)
                {
                    ApplicationArea = All;
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ApplicationArea = All;
                }
                field("Driver ID"; Rec."Driver ID")
                {
                    ApplicationArea = All;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = All;
                }
                field("Key status"; Rec."Key status")
                {
                    ApplicationArea = All;
                }
                field("Key format"; Rec."Key format")
                {
                    ApplicationArea = All;
                }

            }
        }
    }
}
