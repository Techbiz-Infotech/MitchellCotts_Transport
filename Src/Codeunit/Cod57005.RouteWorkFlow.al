codeunit 57005 "Route WorkFlow"
{
    Permissions = TableData "Approval Entry" = ird;
    trigger OnRun()
    var
        lrec_AppEntry: Record "Approval Entry";
    begin

    end;

    var
        WFMngt: Codeunit "Workflow Management";
        AppMgmt: Codeunit "Approvals Mgmt.";
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
        SendRouteReq: TextConst ENU = 'Approval Request for Route is requested', ENG = 'Approval Request for Route is requested';
        AppReqRoute: TextConst ENU = 'Approval Request for Route is approved', ENG = 'Approval Request for Route is approved';
        RejReqRoute: TextConst ENU = 'Approval Request for Route is rejected', ENG = 'Approval Request for Route is rejected';
        DelReqRoute: TextConst ENU = 'Approval Request for Route is delegated', ENG = 'Approval Request for Route is delegated';
        CanReqRoute: TextConst ENU = 'Approval Request for Route is cancelled', ENG = 'Approval Request for Route is cancelled';
        SendForPendAppTxt: TextConst ENU = 'Status of Route changed to Pending approval', ENG = 'Status of Route changed to Pending approval';
        ReleaseRouteTxt: TextConst ENU = 'Release Route', ENG = 'Release Route';
        ReOpenRouteTxt: TextConst ENU = 'ReOpen Route', ENG = 'ReOpen Route';

    procedure RunWorkflowOnCancelRouteApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCancelRouteApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Unigroup Workflow Events", 'OnSendRouteforCancel', '', false, false)]
    procedure RunWorkflowOnSendRouteCancel(var Route: Record Route)
    begin
        WFMngt.HandleEvent(RunWorkflowOnCancelRouteApprovalCode(), Route);
    end;


    procedure RunWorkflowOnSendRouteApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendRouteApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Unigroup Workflow Events", 'OnSendRouteforApproval', '', false, false)]
    procedure RunWorkflowOnSendRouteApproval(var Route: Record Route)
    begin
        WFMngt.HandleEvent(RunWorkflowOnSendRouteApprovalCode(), Route);
    end;

    procedure RunWorkflowOnApproveRouteApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnApproveRouteApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    procedure RunWorkflowOnApproveRouteApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApproveRouteApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnRejectRouteApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectRouteApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnRejectRouteApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectRouteApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnDelegateRouteApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnDelegateRouteApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnDelegateApprovalRequest', '', false, false)]
    procedure RunWorkflowOnDelegateRouteApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegateRouteApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure SetStatusToPendingApprovalCodeRoute(): Code[128]
    begin
        exit(UpperCase('SetStatusToPendingApprovalRoute'));
    end;

    procedure SetStatusToPendingApprovalRoute(var Variant: Variant)
    var
        RecRef: RecordRef;
        Route: Record Route;
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::Route:
                begin
                    RecRef.SetTable(Route);
                    Route.Validate("Route Approval Status", Route."Route Approval Status"::"Pending approval");
                    Route.Modify();
                    Variant := Route;
                end;
        end;
    end;

    procedure ReleaseRouteCode(): Code[128]
    begin
        exit(UpperCase('ReleaseRoute'));
    end;

    procedure ReleaseRoute(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        Route: Record Route;
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReleaseRoute(Variant);
                end;
            DATABASE::Route:
                begin
                    RecRef.SetTable(Route);
                    Route.Validate("Route Approval Status", Route."Route Approval Status"::Approved);
                    Route.Modify();
                    Variant := Route;
                end;
        end;
    end;

    procedure ReOpenRouteCode(): Code[128]
    begin
        exit(UpperCase('ReOpenRoute'));
    end;

    procedure ReOpenRoute(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        Route: Record Route;
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReOpenRoute(Variant);
                end;
            DATABASE::Route:
                begin
                    RecRef.SetTable(Route);
                    Route.Validate("Route Approval Status", Route."Route Approval Status"::Open);
                    Route.Modify();
                    Variant := Route;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    procedure AddRouteEventToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendRouteApprovalCode(), Database::Route, SendRouteReq, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApproveRouteApprovalCode(), Database::"Approval Entry", AppReqRoute, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectRouteApprovalCode(), Database::"Approval Entry", RejReqRoute, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnDelegateRouteApprovalCode(), Database::"Approval Entry", DelReqRoute, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelRouteApprovalCode(), Database::Route, CanReqRoute, 0, false);

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', false, false)]
    procedure AddRouteRespToLibrary()
    begin
        WorkflowResponseHandling.AddResponseToLibrary(SetStatusToPendingApprovalCodeRoute(), 0, SendForPendAppTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReleaseRouteCode(), 0, ReleaseRouteTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReOpenRouteCode(), 0, ReOpenRouteTxt, 'GROUP 0');

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnExecuteWorkflowResponse', '', false, false)]
    procedure ExeRespForRoute(var ResponseExecuted: Boolean; Variant: Variant; xVariant: Variant; ResponseWorkflowStepInstance: Record "Workflow Step Instance")
    var
        WorkflowResponse: Record "Workflow Response";
    begin
        IF WorkflowResponse.GET(ResponseWorkflowStepInstance."Function Name") THEN
            case WorkflowResponse."Function Name" of
                SetStatusToPendingApprovalCodeRoute():
                    begin
                        SetStatusToPendingApprovalRoute(Variant);
                        ResponseExecuted := true;
                    end;
                ReleaseRouteCode():
                    begin
                        ReleaseRoute(Variant);
                        ResponseExecuted := true;
                    end;
                ReOpenRouteCode():
                    begin
                        ReOpenRoute(Variant);
                        ResponseExecuted := true;
                    end;
            end;
    end;

}
