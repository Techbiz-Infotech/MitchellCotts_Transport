page 57045 "Jobs & Maintenance Activities"
{
    Caption = 'Jobs & Maintenance Activities';
    PageType = CardPart;
    SourceTable = "Jobs & Maintenance";

    layout
    {
        area(content)
        {
            cuegroup(Maintenance)
            {
                Caption = 'Maintenance';
                field("Inspection Due In 7days"; Rec."Inspection Due In 7days")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Vehicle List";
                }
                field("Overdue Inspection"; Rec."Overdue Inspection")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Vehicle List";
                }
                field("Service Due in 7days"; Rec."Service Due in 7days")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Vehicle List";
                }
                field("Overdue Service"; Rec."Overdue Service")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Vehicle List";
                }
            }
            cuegroup(Jobs)
            {
                Caption = 'Job';
                field("Open Jobs"; Rec."Open Jobs")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Workshop Jobs List";
                }
                field("WIP Jobs"; Rec."WIP Jobs")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Workshop Jobs List";
                }
                field("Parts on Order Jobs"; Rec."Parts on Order Jobs")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Workshop Jobs List";
                }
                field("Closed Jobs"; Rec."Closed Jobs")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Workshop Jobs List";
                }

            }
        }

    }

    actions
    {
        area(processing)
        {
            action("Set Up Cues")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Set Up Cues';
                Image = Setup;
                ToolTip = 'Set up the cues (status tiles) related to the role.';

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
    trigger OnOpenPage()
    var

    begin
        rec.Reset;
        if not rec.Get then begin
            rec.Init;
            rec.Insert;
        end;
        Rec.SetFilter("Date Filter", '<>%1&%2..%3', 0D, WorkDate(), WorkDate() + 7);
        Rec.SetFilter("Overdue Date Filter",'<=%1', WorkDate());
    end;
}

