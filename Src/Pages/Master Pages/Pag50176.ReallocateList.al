page 50176 "Reallocate List"
{
    ApplicationArea = All;
    Caption = 'Reallocate';
    PageType = List;
    SourceTable = Reallocate;
    UsageCategory = Lists;
    InsertAllowed = false;
    ModifyAllowed = false;
    CardPageId = "Reallocate Card";
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Reallocation No."; Rec."Reallocation No.")
                {
                    ApplicationArea = All;
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ApplicationArea = All;
                }
                field(Odometer; Rec.Odometer)
                {
                    ApplicationArea = All;
                }
                field("Previous date"; Rec."Previous date")
                {
                    ApplicationArea = All;
                }
                field("Start date"; Rec."Start date")
                {
                    ApplicationArea = All;
                }
                field("Location code"; Rec."Location code")
                {
                    ApplicationArea = All;
                }
            
                field("Vehicle status"; Rec."Vehicle status")
                {
                    ApplicationArea = All;
                }
                field("Allocation reason"; Rec."Allocation reason")
                {
                    ApplicationArea = All;
                }
                field("Make code"; Rec."Make code")
                {
                    ApplicationArea = All;
                }
                field(Derivate; Rec.Derivate)
                {
                    ApplicationArea = All;
                }
                field("Model code"; Rec."Model code")
                {
                    ApplicationArea = All;
                }
               
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
