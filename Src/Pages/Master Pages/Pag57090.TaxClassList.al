page 57090 "Tax Class List"
{
    ApplicationArea = All;
    Caption = 'Tax Class';
    PageType = List;
    CardPageId = "Tax Class Card";
    SourceTable = "Tax Class";
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
                field("Tax Code"; Rec."Tax Code")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Types; Rec.Types)
                {
                    ApplicationArea = All;
                }
                field("Fuel Types"; Rec."Fuel Types")
                {
                    ApplicationArea = All;
                }
                field("Min Date Reg"; Rec."Min Date Reg")
                {
                    ApplicationArea = All;
                }
                field("Max Date Reg"; Rec."Max Date Reg")
                {
                    ApplicationArea = All;
                }
                field("Min Co2gkm"; Rec."Min Co2gkm")
                {
                    ApplicationArea = All;
                }
                field("Max Co2gkm"; Rec."Max Co2gkm")
                {
                    ApplicationArea = All;
                }
                field(Value; Rec.Value)
                {
                    ApplicationArea = All;
                }
                field("Value 6 Months"; Rec."Value 6 Months")
                {
                    ApplicationArea = All;
                }
                field("First Year Value"; Rec."First Year Value")
                {
                    ApplicationArea = All;
                }
                field("First Year Value 6 Months"; Rec."First Year Value 6 Months")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

}
