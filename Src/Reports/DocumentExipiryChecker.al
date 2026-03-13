report 50129 DocumentExipiryChecker
{
    //ApplicationArea = All;
    Caption = 'DocumentExipiryChecker';
    //UsageCategory = Tasks;
    ProcessingOnly = true;
    UseRequestPage = false;
    dataset
    {
        dataitem(GatePass; GatePass)
        {
            trigger OnAfterGetRecord()
            begin
                GatePass.Reset;
                GatePass.SetRange("Gate Pass Status", "Gate Pass Status"::Active);
                GatePass.SetRange(Posted, false);
                IF GatePass.FindFirst() then begin
                    repeat
                        if (GatePass."Gatepass Date" < TODAY) or (GatePass."Gatepass Date" = TODAY) then begin
                            GatePass."Gate Pass Status" := GatePass."Gate Pass Status"::InActive;
                            GatePass."Expired Date" := Today;
                            GatePass."Expired Time" := Time;
                            GatePass.Modify();
                        end;
                    until GatePass.Next() = 0;
                end;
            end;
        }
        dataitem(PettyCash; "Petty Cash Expenses Detail")
        {
            trigger OnAfterGetRecord()
            begin
                PettyCash.Reset;
                PettyCash.SetRange("Petty Cash Status", "Petty Cash Status"::Active);
                PettyCash.SetRange(Posted, false);
                PettyCash.SetRange("Petty Cash Approval Status", "Petty Cash Approval Status"::Open);
                IF PettyCash.FindFirst() then begin
                    repeat
                        if (PettyCash."Creation Date" < TODAY) or (PettyCash."Creation Date" = TODAY) then begin
                            PettyCash."Petty Cash Status" := PettyCash."Petty Cash Status"::InActive;
                            PettyCash."Expired Date" := Today;
                            PettyCash."Expired Time" := Time;
                            PettyCash.Modify();
                        end;
                    until PettyCash.Next() = 0;
                end;
            end;
        }
    }
}
