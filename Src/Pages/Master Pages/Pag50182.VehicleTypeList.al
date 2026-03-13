page 50182 "Vehicle Type List"
{
    ApplicationArea = All;
    Caption = 'Vehicle Type';
    PageType = List;
    SourceTable = "Vehicle Type";
    UsageCategory = Lists;
    CardPageId = "Vehicle Type Card";
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
                field("Forecast replacement value"; Rec."Forecast replacement value")
                {
                    ApplicationArea = All;
                }
                field("Yearly O Licence Charge"; Rec."Yearly O Licence Charge")
                {
                    ApplicationArea = All;
                }
                field("Service Priority"; Rec."Service Priority")
                {
                    ApplicationArea = All;
                }
                field("Is Commercial?"; Rec."Is Commercial?")
                {
                    ApplicationArea = All;
                }
                field("Replacement Months"; Rec."Replacement Months")
                {
                    ApplicationArea = All;
                }
                field("Five Yearly O Licence Charge"; Rec."Five Yearly O Licence Charge")
                {
                    ApplicationArea = All;
                }
                field("Service Allowable Period"; Rec."Service Allowable Period")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
