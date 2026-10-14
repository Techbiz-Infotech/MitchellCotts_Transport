page 57050 "Posted Gatepass Card"

{
    Caption = 'Posted Gatepass';
    PageType = Card;
    SourceTable = "Gatepass";
    SourceTableView = where(Posted = const(true));
    Editable = false;
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Gatepass No."; Rec."Gatepass No.")
                {
                    ApplicationArea = All;
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
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
                field("To (Destination)"; Rec."To (Destination)")
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

            }
        }
    }
    actions
    {
        area(Navigation)
        {
            action(Print)
            {
                ApplicationArea = Suite;
                Caption = 'Print';
                Ellipsis = true;
                Image = PostPrint;
                trigger OnAction()
                var
                    Gatepass: Record Gatepass;
                begin
                    Rec.testfield("Approval Status", Rec."Approval Status"::Approved);
                    Gatepass.Reset();
                    Gatepass.SetRange("Gatepass No.", Rec."Gatepass No.");
                    if Gatepass.FindFirst then
                        Report.RunModal(50107, true, false, Gatepass);
                end;
            }
        }
    }
}
