page 50188 "Accident Details List"
{
    ApplicationArea = All;
    Caption = 'Accident Details';
    PageType = List;
    SourceTable = "Accident Details";
    UsageCategory = Lists;
    CardPageId = "Accident Details Card";
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Accident Details No."; Rec."Accident Details No.")
                {
                    ApplicationArea = All;
                }
                field("Accident ref."; Rec."Accident ref.")
                {
                    ApplicationArea = All;
                }
                field("Cost Type"; Rec."Cost Type")
                {
                    ApplicationArea = All;
                }
                field("Entry Date"; Rec."Entry Date")
                {
                    ApplicationArea = All;
                }
                field("Estimate No.";Rec."Estimate No.")
                {
                    ApplicationArea = All;
                }
                field("Order No.";Rec."Order No.")
                {
                    ApplicationArea = All;
                }
                field("Item No.";Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field(Repairer; Rec.Repairer)
                {
                    ApplicationArea = All;
                }
                field("Estimate Value"; Rec."Estimate Value")
                {
                    ApplicationArea = All;
                }
                field("Actual Value"; Rec."Actual Value")
                {
                    ApplicationArea = All;
                }

            }
        }
    }
}
