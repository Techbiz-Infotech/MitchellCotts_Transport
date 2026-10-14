codeunit 57006 "Unigroup Workflow Events"
{

    /****Trip***********/

    [IntegrationEvent(false, false)]

    PROCEDURE OnSendTripforApproval(VAR Trip: Record Trip);

    begin

    end;

    [IntegrationEvent(false, false)]

    PROCEDURE OnSendTripforCancel(VAR Trip: Record Trip);
    begin

    end;

    procedure IsTripEnabled(var Trip: Record Trip): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit TripWorkflow;
    begin
        exit(WFMngt.CanExecuteWorkflow(Trip, WFCode.RunWorkflowOnSendTripApprovalCode()));
    end;

    local procedure CheckTriporkflowEnabled(): Boolean
    var
        Trip: Record Trip;
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type', ENG = 'No workflow Enabled for this Record type';
    begin
        if not IsTripEnabled(Trip) then
            Error(NoWorkflowEnb);
    end;

    /****Trip end************/

    /****Fuel***********/

    [IntegrationEvent(false, false)]

    PROCEDURE OnSendFuelforApproval(VAR Fuel: Record "Fuel Issue");

    begin

    end;

    [IntegrationEvent(false, false)]

    PROCEDURE OnSendFuelforCancel(VAR Fuel: Record "Fuel Issue");
    begin

    end;

    procedure IsFuelEnabled(var Fuel: Record "Fuel Issue"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit FuelWorkflow;
    begin
        exit(WFMngt.CanExecuteWorkflow(Fuel, WFCode.RunWorkflowOnSendFuelApprovalCode()));
    end;

    local procedure CheckFuelWorkflowEnabled(): Boolean
    var
        Fuel: Record "Fuel Issue";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type', ENG = 'No workflow Enabled for this Record type';
    begin
        if not IsFuelEnabled(Fuel) then
            Error(NoWorkflowEnb);
    end;
    /****Fuel end************/


    /****PettyCashExpenses********/

    [IntegrationEvent(false, false)]

    PROCEDURE OnSendPettyCashExpensesforApproval(VAR PettyCashExpenses: Record "Petty Cash Expenses Detail");

    begin

    end;

    [IntegrationEvent(false, false)]

    PROCEDURE OnSendPettyCashExpensesforCancel(VAR PettyCashExpenses: Record "Petty Cash Expenses Detail");
    begin

    end;

    procedure IsPettyCashExpensesEnabled(var PettyCashExpenses: Record "Petty Cash Expenses Detail"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit "Petty Cash Expenses WorkFlow";
    begin
        exit(WFMngt.CanExecuteWorkflow(PettyCashExpenses, WFCode.RunWorkflowOnSendPettyCashExpensesApprovalCode()));
    end;

    local procedure CheckPettyCashExpensesWorkflowEnabled(): Boolean
    var
        PettyCashExpenses: Record "Petty Cash Expenses Detail";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type', ENG = 'No workflow Enabled for this Record type';
    begin
        if not IsPettyCashExpensesEnabled(PettyCashExpenses) then
            Error(NoWorkflowEnb);
    end;
    /****PettyCashExpenses End********/

    /****Route***********/

    [IntegrationEvent(false, false)]

    PROCEDURE OnSendRouteforApproval(VAR Route: Record Route);

    begin

    end;

    [IntegrationEvent(false, false)]

    PROCEDURE OnSendRouteforCancel(VAR Route: Record Route);
    begin

    end;

    procedure IsRouteEnabled(var Route: Record Route): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit "Route WorkFlow";
    begin
        exit(WFMngt.CanExecuteWorkflow(Route, WFCode.RunWorkflowOnSendRouteApprovalCode()));
    end;

    local procedure CheckRouteWorkflowEnabled(): Boolean
    var
        Route: Record Route;
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type', ENG = 'No workflow Enabled for this Record type';
    begin
        if not IsRouteEnabled(Route) then
            Error(NoWorkflowEnb);
    end;
    /****Route end************/

    /******transport request start*****/
    [IntegrationEvent(false, false)]

    PROCEDURE OnSendTransportRequestforApproval(VAR TransportRequest: Record "Transport Request Header");

    begin

    end;

    [IntegrationEvent(false, false)]

    PROCEDURE OnSendTransportRequestforCancel(VAR TransportRequest: Record "Transport Request Header");
    begin

    end;

    procedure IsTransportRequestEnabled(var TransportRequest: Record "Transport Request Header"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit "Transport Request Workflow";
    begin
        exit(WFMngt.CanExecuteWorkflow(TransportRequest, WFCode.RunWorkflowOnSendTransportRequestApprovalCode()));
    end;

    local procedure CheckTransportRequestWorkflowEnabled(): Boolean
    var
        TransportRequest: Record "Transport Request Header";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type', ENG = 'No workflow Enabled for this Record type';
    begin
        if not IsTransportRequestEnabled(TransportRequest) then
            Error(NoWorkflowEnb);
    end;
    /******transport request end*****/

    /****GatePass***********/

    [IntegrationEvent(false, false)]

    procedure OnSendGatePassforApproval(VAR GatePass: Record "Gatepass");

    begin

    end;

    [IntegrationEvent(false, false)]

    procedure OnSendGatePassforCancel(VAR GatePass: Record "Gatepass");
    begin

    end;

    procedure IsGatePassEnabled(var GatePass: Record "Gatepass"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit "Gatepass Workflow";
    begin
        exit(WFMngt.CanExecuteWorkflow(GatePass, WFCode.RunWorkflowOnSendGatePassApprovalCode()));
    end;

    local procedure CheckGatePassWorkflowEnabled(): Boolean
    var
        GatePass: Record "Gatepass";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type', ENG = 'No workflow Enabled for this Record type';
    begin
        if not IsGatePassEnabled(GatePass) then
            Error(NoWorkflowEnb);
    end;
    /****GatePass end************/
}
