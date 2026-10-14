page 57141 "Vehicle Type Card"
{
    Caption = 'Vehicle Type';
    PageType = Card;
    SourceTable = "Vehicle Type";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

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
