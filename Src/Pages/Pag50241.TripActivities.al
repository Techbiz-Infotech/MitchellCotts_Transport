page 50241 "Trip Activities"
{
    Caption = 'Trip Activities';
    PageType = CardPart;
    SourceTable = "Trip Cues";

    layout
    {
        area(content)
        {
            cuegroup(Trip)
            {
                Caption = 'Trip Stages';
                field(Created; Rec.Created)
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Trip list";
                }
                field("Approved Trips"; Rec."Approved Trips")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Trip list";
                }

                field("Fuel Issue Completed"; Rec."Fuel Issue Completed")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Trip list";
                }

                field(Live; Rec.Live)
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Trip list";
                }
                field("Over Due Trips"; Rec."Over Due Trips")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Trip list";
                }
                field("Delivery and Closing Completed"; Rec."Delivery and Closing Completed")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Trip list";
                }
                field("Billing Completed"; Rec."Billing Completed")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Trip list";
                }
            }
            cuegroup(Trip2)
            {
                Caption = 'Trip Approvals';
                field("Closure Requests"; Rec."Closure Requests")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Trip list";
                    Visible = CloseCueVisible;
                }
                field("Terminate Requests"; Rec."Terminate Requests")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Trip list";
                    Visible = TermCueVisible;
                }
                field("Phys. Inv Requests"; Rec."Phys. Inv Requests")
                {
                    ApplicationArea = all;
                    DrillDownPageId = "Phys. Inventory Journallist";

                }

            }

        }


    }
    actions
    {
        area(processing)
        {
            action(Cues)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Cues';
                Image = Setup;
                trigger OnAction()
                var
                    CuesAndKpis: Codeunit "Cues And KPIs";
                    CueRecordRef: RecordRef;
                begin
                    CueRecordRef.GetTable(Rec);
                    CuesAndKpis.OpenCustomizePageForCurrentUser(CueRecordRef.Number);
                end;
            }
        }
    }
    var
        CloseCueVisible, TermCueVisible : Boolean;
    trigger OnOpenPage()
    var

    begin
        rec.Reset;
        if not rec.Get then begin
            rec.Init;
            rec.Insert;
        end;
        Rec.SetFilter("Overdue Date Filter", '<>%1&..%2', 0D, WorkDate() - 1);
        CueVisible();
    end;

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
        ItemJnlLine: Record "Item Journal Line";
        TempBatch: Record "Item Journal Line" temporary;
    begin
        CueVisible();
        CurrPage.Update(false);
    end;

    procedure CueVisible()
UserSetup: Record "User Setup";
    begin
        UserSetup.Get(UserId);
        if not UserSetup."Close Trip" then
            CloseCueVisible := false
        else
            CloseCueVisible := true;
        if not UserSetup."Terminate Trip" then
            TermCueVisible := false
        else
            TermCueVisible := true;
    end;
}
