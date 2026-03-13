page 50202 "Fitters List"
{
    ApplicationArea = All;
    Caption = 'Fitters';
    PageType = List;
    SourceTable = Fitters;
    UsageCategory = Lists;
    CardPageId = "Fitters Card";
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Fitter No."; Rec."Fitter No.")
                {
                    ApplicationArea = All;
                }
                field("Fifter Name"; Rec."Fifter Name")
                {
                    ApplicationArea = All;
                }
                field("Serial No.";Rec."Serial No.")
                {
                    ApplicationArea = All;
                }
                field(Pin; Rec.Pin)
                {
                    ApplicationArea = All;
                }
                field(Sex; Rec.Sex)
                {
                    ApplicationArea = All;
                }
                field("Employment Status"; Rec."Employment Status")
                {
                    ApplicationArea = All;
                }
                field("Start date"; Rec."Start date")
                {
                    ApplicationArea = All;
                }
                field("Probation period (Months)"; Rec."Probation period (Months)")
                {
                    ApplicationArea = All;
                }
              
                field("Job title"; Rec."Job title")
                {
                    ApplicationArea = All;
                }
                field(Skills; Rec.Skills)
                {
                    ApplicationArea = All;
                }
                field("National ID Card No"; Rec."National ID Card No")
                {
                    ApplicationArea = All;
                }
                field("Date Finished"; Rec."Date Finished")
                {
                    ApplicationArea = All;
                }
                field("Probation End Date"; Rec."Probation End Date")
                {
                    ApplicationArea = All;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                }
              
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }
                field("Gross pay"; Rec."Gross pay")
                {
                    ApplicationArea = All;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                }

            }
        }
    }
}
