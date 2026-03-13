page 50251 ExpiredGatepassList
{
    ApplicationArea = All;
    Caption = 'Expired Gatepasses';
    PageType = List;
    SourceTable = "Gatepass";
    SourceTableView = where(Posted = const(false), "Gate Pass Status" = const(InActive));
    UsageCategory = Lists;
    //CardPageId = "Gatepass Card";
    AdditionalSearchTerms = 'Expired Gate Pass List';
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
                field("Expired Date";Rec."Expired Date")
                {
                    ApplicationArea = All;
                }
                field("Expired Time";Rec."Expired Time")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Activate)
            {
                ApplicationArea = All;
                Caption = 'Activate';
                Enabled = Rec."Gate Pass Status" <> Rec."Gate Pass Status"::Active;
                trigger OnAction()
                begin
                    Rec."Gate Pass Status" := Rec."Gate Pass Status"::Active;
                    Rec.Modify();
                    CurrPage.Update(false);
                end;
            }
        }
    }
}