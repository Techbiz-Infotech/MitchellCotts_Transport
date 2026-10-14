codeunit 57009 "Transport Request Workflow"
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
        SendTransportRequestReq: TextConst ENU = 'Approval Request for TransportRequest is requested', ENG = 'Approval Request for TransportRequest is requested';
        AppReqTransportRequest: TextConst ENU = 'Approval Request for TransportRequest is approved', ENG = 'Approval Request for TransportRequest is approved';
        RejReqTransportRequest: TextConst ENU = 'Approval Request for TransportRequest is rejected', ENG = 'Approval Request for TransportRequest is rejected';
        DelReqTransportRequest: TextConst ENU = 'Approval Request for TransportRequest is delegated', ENG = 'Approval Request for TransportRequest is delegated';
        CanReqTransportRequest: TextConst ENU = 'Approval Request for TransportRequest is cancelled', ENG = 'Approval Request for TransportRequest is cancelled';
        SendForPendAppTxt: TextConst ENU = 'Status of TransportRequest changed to Pending approval', ENG = 'Status of TransportRequest changed to Pending approval';
        ReleaseTransportRequestTxt: TextConst ENU = 'Release TransportRequest', ENG = 'Release TransportRequest';
        ReOpenTransportRequestTxt: TextConst ENU = 'ReOpen TransportRequest', ENG = 'ReOpen TransportRequest';

    procedure RunWorkflowOnCancelTransportRequestApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCancelTransportRequestApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Unigroup Workflow Events", 'OnSendTransportRequestforCancel', '', false, false)]
    procedure RunWorkflowOnSendTransportRequestCancel(var TransportRequest: Record "Transport Request Header")
    begin
        WFMngt.HandleEvent(RunWorkflowOnCancelTransportRequestApprovalCode(), TransportRequest);
    end;


    procedure RunWorkflowOnSendTransportRequestApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendTransportRequestApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Unigroup Workflow Events", 'OnSendTransportRequestforApproval', '', false, false)]
    procedure RunWorkflowOnSendTransportRequestApproval(var TransportRequest: Record "Transport Request Header")
    begin
        WFMngt.HandleEvent(RunWorkflowOnSendTransportRequestApprovalCode(), TransportRequest);
    end;

    procedure RunWorkflowOnApproveTransportRequestApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnApproveTransportRequestApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    procedure RunWorkflowOnApproveTransportRequestApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApproveTransportRequestApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnRejectTransportRequestApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectTransportRequestApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnRejectTransportRequestApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectTransportRequestApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnDelegateTransportRequestApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnDelegateTransportRequestApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnDelegateApprovalRequest', '', false, false)]
    procedure RunWorkflowOnDelegateTransportRequestApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegateTransportRequestApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure SetStatusToPendingApprovalCodeTransportRequest(): Code[128]
    begin
        exit(UpperCase('SetStatusToPendingApprovalTransportRequest'));
    end;

    procedure SetStatusToPendingApprovalTransportRequest(var Variant: Variant)
    var
        RecRef: RecordRef;
        TransportRequest: Record "Transport Request Header";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Transport Request Header":
                begin
                    RecRef.SetTable(TransportRequest);
                    TransportRequest.Validate(status, TransportRequest.Status::"Pending Approval");
                    TransportRequest.Modify();
                    Variant := TransportRequest;
                end;
        end;
    end;

    procedure ReleaseTransportRequestCode(): Code[128]
    begin
        exit(UpperCase('ReleaseTransportRequest'));
    end;

    procedure ReleaseTransportRequest(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        TransportRequest: Record "Transport Request Header";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReleaseTransportRequest(Variant);
                end;
            DATABASE::"Transport Request Header":
                begin
                    RecRef.SetTable(TransportRequest);
                    TransportRequest.Validate(status, TransportRequest.Status::Approved);
                    TransportRequest.Modify();
                    Variant := TransportRequest;
                end;
        end;
    end;

    procedure ReOpenTransportRequestCode(): Code[128]
    begin
        exit(UpperCase('ReOpenTransportRequest'));
    end;

    procedure ReOpenTransportRequest(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        TransportRequest: Record "Transport Request Header";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReOpenTransportRequest(Variant);
                end;
            DATABASE::"Transport Request Header":
                begin
                    RecRef.SetTable(TransportRequest);
                    TransportRequest.Validate(Status, TransportRequest.Status::Open);
                    TransportRequest.Modify();
                    Variant := TransportRequest;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    procedure AddTransportRequestEventToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendTransportRequestApprovalCode(), Database::"Transport Request Header", SendTransportRequestReq, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApproveTransportRequestApprovalCode(), Database::"Approval Entry", AppReqTransportRequest, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectTransportRequestApprovalCode(), Database::"Approval Entry", RejReqTransportRequest, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnDelegateTransportRequestApprovalCode(), Database::"Approval Entry", DelReqTransportRequest, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelTransportRequestApprovalCode(), Database::"Transport Request Header", CanReqTransportRequest, 0, false);

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', false, false)]
    procedure AddTransportRequestRespToLibrary()
    begin
        WorkflowResponseHandling.AddResponseToLibrary(SetStatusToPendingApprovalCodeTransportRequest(), 0, SendForPendAppTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReleaseTransportRequestCode(), 0, ReleaseTransportRequestTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReOpenTransportRequestCode(), 0, ReOpenTransportRequestTxt, 'GROUP 0');

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnExecuteWorkflowResponse', '', false, false)]
    procedure ExeRespForTransportRequest(var ResponseExecuted: Boolean; Variant: Variant; xVariant: Variant; ResponseWorkflowStepInstance: Record "Workflow Step Instance")
    var
        WorkflowResponse: Record "Workflow Response";
    begin
        IF WorkflowResponse.GET(ResponseWorkflowStepInstance."Function Name") THEN
            case WorkflowResponse."Function Name" of
                SetStatusToPendingApprovalCodeTransportRequest():
                    begin
                        SetStatusToPendingApprovalTransportRequest(Variant);
                        ResponseExecuted := true;
                    end;
                ReleaseTransportRequestCode():
                    begin
                        ReleaseTransportRequest(Variant);
                        ResponseExecuted := true;
                    end;
                ReOpenTransportRequestCode():
                    begin
                        ReOpenTransportRequest(Variant);
                        ResponseExecuted := true;
                    end;
            end;
    end;

}
