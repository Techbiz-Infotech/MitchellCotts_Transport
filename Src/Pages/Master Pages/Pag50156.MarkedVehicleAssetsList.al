page 50156 "Marked Vehicle Assets List"
{
    ApplicationArea = All;
    Caption = 'Marked Vehicle Assets';
    PageType = List;
    SourceTable = "Marked Vehicle Assets";
    UsageCategory = Lists;
    InsertAllowed = false;
    ModifyAllowed = false;
    CardPageId = "Marked Vehicle Assets Card";
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Allocation No."; Rec."Allocation No.")
                {
                    ApplicationArea = All;
                }
                field("Allocation Status"; Rec."Allocation Status")
                {
                    ApplicationArea = All;
                }
                field("Allocate to"; Rec."Allocate to")
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
                field("Asset Type"; Rec."Asset Type")
                {
                    ApplicationArea = All;
                }
                field("Asset Make"; Rec."Asset Make")
                {
                    ApplicationArea = All;
                }
                field("Asset Model"; Rec."Asset Model")
                {
                    ApplicationArea = All;
                }
                field("Asset Serial"; Rec."Asset Serial")
                {
                    ApplicationArea = All;
                }
                field("Asset issue date"; Rec."Asset issue date")
                {
                    ApplicationArea = All;
                }
                field("Qty Issued"; Rec."Qty Issued")
                {
                    ApplicationArea = All;
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = All;
                }
                field("Asset Renewal Date"; Rec."Asset Renewal Date")
                {
                    ApplicationArea = All;
                }
                field("Asset Status"; Rec."Asset Status")
                {
                    ApplicationArea = All;
                }
                field("Asset return date"; Rec."Asset return date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
