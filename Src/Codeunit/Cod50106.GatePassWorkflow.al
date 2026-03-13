codeunit 50106 "Gatepass Workflow"
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
        SendGatePassReq: TextConst ENU = 'Approval Request for Gatepass is requested', ENG = 'Approval Request for Gatepass is requested';
        AppReqGatePass: TextConst ENU = 'Approval Request for Gatepass is approved', ENG = 'Approval Request for Gatepass is approved';
        RejReqGatePass: TextConst ENU = 'Approval Request for Gatepass is rejected', ENG = 'Approval Request for Gatepass is rejected';
        DelReqGatePass: TextConst ENU = 'Approval Request for Gatepass is delegated', ENG = 'Approval Request for Gatepass is delegated';
        CanReqGatePass: TextConst ENU = 'Approval Request for Gatepass is cancelled', ENG = 'Approval Request for Gatepass is cancelled';
        SendForPendAppTxt: TextConst ENU = 'Status of Gatepass changed to Pending approval', ENG = 'Status of Gatepass changed to Pending approval';
        ReleaseGatePassTxt: TextConst ENU = 'Release Gatepass', ENG = 'Release Gatepass';
        ReOpenGatePassTxt: TextConst ENU = 'ReOpen Gatepass', ENG = 'ReOpen Gatepass';

    procedure RunWorkflowOnCancelGatePassApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCancelGatePassApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Unigroup Workflow Events", 'OnSendGatePassforCancel', '', false, false)]
    procedure RunWorkflowOnSendGatePassCancel(var GatePass: Record "Gatepass")
    begin
        WFMngt.HandleEvent(RunWorkflowOnCancelGatePassApprovalCode(), GatePass);
    end;


    procedure RunWorkflowOnSendGatePassApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendGatePassApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Unigroup Workflow Events", 'OnSendGatePassforApproval', '', false, false)]
    procedure RunWorkflowOnSendGatePassApproval(var GatePass: Record "Gatepass")
    begin
        WFMngt.HandleEvent(RunWorkflowOnSendGatePassApprovalCode(), GatePass);
    end;

    procedure RunWorkflowOnApproveGatePassApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnApproveGatePassApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    procedure RunWorkflowOnApproveGatePassApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApproveGatePassApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnRejectGatePassApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectGatePassApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnRejectGatePassApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectGatePassApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnDelegateGatePassApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnDelegateGatePassApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnDelegateApprovalRequest', '', false, false)]
    procedure RunWorkflowOnDelegateGatePassApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegateGatePassApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure SetStatusToPendingApprovalCodeGatePass(): Code[128]
    begin
        exit(UpperCase('SetStatusToPendingApprovalGatePass'));
    end;

    procedure SetStatusToPendingApprovalGatePass(var Variant: Variant)
    var
        RecRef: RecordRef;
        GatePass: Record "Gatepass";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Gatepass":
                begin
                    RecRef.SetTable(GatePass);
                    GatePass.Validate("Approval Status", GatePass."Approval Status"::"Pending Approval");
                    GatePass.Modify();
                    Variant := GatePass;
                end;
        end;
    end;

    procedure ReleaseGatePassCode(): Code[128]
    begin
        exit(UpperCase('ReleaseGatePass'));
    end;

    procedure ReleaseGatePass(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        GatePass: Record "Gatepass";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReleaseGatePass(Variant);
                end;
            DATABASE::"Gatepass":
                begin
                    RecRef.SetTable(GatePass);
                    GatePass.Validate("Approval Status", GatePass."Approval Status"::Approved);
                    GatePass.Modify();
                    Variant := GatePass;
                end;
        end;
    end;

    procedure ReOpenGatePassCode(): Code[128]
    begin
        exit(UpperCase('ReOpenGatePass'));
    end;

    procedure ReOpenGatePass(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        GatePass: Record "Gatepass";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReOpenGatePass(Variant);
                end;
            DATABASE::"Gatepass":
                begin
                    RecRef.SetTable(GatePass);
                    GatePass.Validate("Approval Status", GatePass."Approval Status"::Open);
                    GatePass.Modify();
                    Variant := GatePass;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    procedure AddGatePassEventToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendGatePassApprovalCode(), Database::"Gatepass", SendGatePassReq, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApproveGatePassApprovalCode(), Database::"Approval Entry", AppReqGatePass, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectGatePassApprovalCode(), Database::"Approval Entry", RejReqGatePass, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnDelegateGatePassApprovalCode(), Database::"Approval Entry", DelReqGatePass, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelGatePassApprovalCode(), Database::"Gatepass", CanReqGatePass, 0, false);

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', false, false)]
    procedure AddGatePassRespToLibrary()
    begin
        WorkflowResponseHandling.AddResponseToLibrary(SetStatusToPendingApprovalCodeGatePass(), 0, SendForPendAppTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReleaseGatePassCode(), 0, ReleaseGatePassTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReOpenGatePassCode(), 0, ReOpenGatePassTxt, 'GROUP 0');

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnExecuteWorkflowResponse', '', false, false)]
    procedure ExeRespForGatePass(var ResponseExecuted: Boolean; Variant: Variant; xVariant: Variant; ResponseWorkflowStepInstance: Record "Workflow Step Instance")
    var
        WorkflowResponse: Record "Workflow Response";
    begin
        IF WorkflowResponse.GET(ResponseWorkflowStepInstance."Function Name") THEN
            case WorkflowResponse."Function Name" of
                SetStatusToPendingApprovalCodeGatePass():
                    begin
                        SetStatusToPendingApprovalGatePass(Variant);
                        ResponseExecuted := true;
                    end;
                ReleaseGatePassCode():
                    begin
                        ReleaseGatePass(Variant);
                        ResponseExecuted := true;
                    end;
                ReOpenGatePassCode():
                    begin
                        ReOpenGatePass(Variant);
                        ResponseExecuted := true;
                    end;
            end;
    end;
}
