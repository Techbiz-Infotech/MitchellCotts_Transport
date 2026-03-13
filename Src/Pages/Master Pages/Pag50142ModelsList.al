page 50142 "Models List"
{
    Caption = 'Models';
    ApplicationArea = All;
    PageType = List;
    UsageCategory = Lists;
    InsertAllowed = false;
    ModifyAllowed = false;
    SourceTable = Models;
    CardPageId = "Models Card";
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Make Code"; Rec."Make Code")
                {
                    ApplicationArea = All;
                }
                field("Model Code"; Rec."Model Code")
                {
                    ApplicationArea = All;
                }
                field(Derivative; Rec.Derivative)
                {
                    ApplicationArea = All;
                }
                field("Vehicle Type"; Rec."Vehicle Type")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Tax Class"; Rec."Tax Class")
                {
                    ApplicationArea = All;
                }
                field("Fuel Type"; Rec."Fuel Type")
                {
                    ApplicationArea = All;
                }
                field(Co2gKm; Rec.Co2gKm)
                {
                    ApplicationArea = All;
                }
                field(BHP; Rec.BHP)
                {
                    ApplicationArea = All;
                }
                field("Fiscal hp"; Rec."Fiscal hp")
                {
                    ApplicationArea = All;
                }
                field("Gearbox Type"; Rec."Gearbox Type")
                {
                    ApplicationArea = All;
                }
                field("Target Fuel"; Rec."Target Fuel")
                {
                    ApplicationArea = All;
                }
                field("Target Fuel (Urban)"; Rec."Target Fuel (Urban)")
                {
                    ApplicationArea = All;
                }
                field("Target Cost"; Rec."Target Cost")
                {
                    ApplicationArea = All;
                }
                field("Service interval(Weeks)"; Rec."Service interval(Weeks)")
                {
                    ApplicationArea = All;
                }
                field("Service Schedule"; Rec."Service Schedule")
                {
                    ApplicationArea = All;
                }
                field("Employee Grade"; Rec."Employee Grade")
                {
                    ApplicationArea = All;
                }
                field("Tank Size"; Rec."Tank Size")
                {
                    ApplicationArea = All;
                }
                field("P11D Class"; Rec."P11D Class")
                {
                    ApplicationArea = All;
                }
                field("Engine Cc"; Rec."Engine Cc")
                {
                    ApplicationArea = All;
                }
                field("Gearbox Speed"; Rec."Gearbox Speed")
                {
                    ApplicationArea = All;
                }
                field("Variance fuel"; Rec."Variance fuel")
                {
                    ApplicationArea = All;
                }
                field("Target fuel (Extra urban)"; Rec."Target fuel (Extra urban)")
                {
                    ApplicationArea = All;
                }
                field("Variance Cost"; Rec."Variance Cost")
                {
                    ApplicationArea = All;
                }
                field("Service Int(KMS)"; Rec."Service Int(KMS)")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}