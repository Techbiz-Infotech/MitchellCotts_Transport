page 57075 PostedGatepassList
{
    ApplicationArea = All;
    Caption = 'Posted Gatepasses';
    PageType = List;
    SourceTable = "Gatepass";
    SourceTableView = where(Posted = const(true));
    UsageCategory = History;
    CardPageId = "Posted Gatepass Card";
    AdditionalSearchTerms = 'Posted Gate Pass List';
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Gatepass No."; Rec."Gatepass No.")
                {
                    ApplicationArea = All;
                }
                field("Gatepass Date"; Rec."Gatepass Date")
                {
                    ApplicationArea = All;
                }
                field("Created time"; Rec."Created time")
                {
                    ApplicationArea = All;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                }
                field("Gatepass Type"; Rec."Gatepass Type")
                {
                    ApplicationArea = All;
                }
                field("Requested By"; Rec."Requested By")
                {
                    ApplicationArea = All;
                }
                field("Trip ID"; Rec."Trip ID")
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
                field("From(Source)"; Rec."From(Source)")
                {
                    ApplicationArea = All;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                }
                field("Expected No Of Trips"; Rec."Expected No Of Trips")
                {
                    ApplicationArea = All;
                }
                field("Purpose/Description"; Rec."Purpose/Description")
                {
                    ApplicationArea = All;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = All;
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ApplicationArea = All;
                }
                field("Trailer No."; Rec."Trailer No.")
                {
                    ApplicationArea = All;
                }
                field("To (Destination)"; Rec."To (Destination)")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}

