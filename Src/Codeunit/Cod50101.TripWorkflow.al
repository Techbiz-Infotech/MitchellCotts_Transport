codeunit 50101 TripWorkflow
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
        SendTripReq: TextConst ENU = 'Approval Request for Trip is requested', ENG = 'Approval Request for Trip is requested';
        AppReqTrip: TextConst ENU = 'Approval Request for Trip is approved', ENG = 'Approval Request for Trip is approved';
        RejReqTrip: TextConst ENU = 'Approval Request for Trip is rejected', ENG = 'Approval Request for Trip is rejected';
        DelReqTrip: TextConst ENU = 'Approval Request for Trip is delegated', ENG = 'Approval Request for Trip is delegated';
        CanReqTrip: TextConst ENU = 'Approval Request for Trip is cancelled', ENG = 'Approval Request for Trip is cancelled';
        SendForPendAppTxt: TextConst ENU = 'Status of Trip changed to Pending approval', ENG = 'Status of Trip changed to Pending approval';
        ReleaseTripTxt: TextConst ENU = 'Release Trip', ENG = 'Release Trip';
        ReOpenTripTxt: TextConst ENU = 'ReOpen Trip', ENG = 'ReOpen Trip';

    procedure RunWorkflowOnCancelTripApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCancelTripApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Unigroup Workflow Events", 'OnSendTripforCancel', '', false, false)]
    procedure RunWorkflowOnSendTripCancel(var Trip: Record Trip)
    begin
        WFMngt.HandleEvent(RunWorkflowOnCancelTripApprovalCode(), Trip);
    end;


    procedure RunWorkflowOnSendTripApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendTripApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Unigroup Workflow Events", 'OnSendTripforApproval', '', false, false)]
    procedure RunWorkflowOnSendTripApproval(var Trip: Record Trip)
    begin
        WFMngt.HandleEvent(RunWorkflowOnSendTripApprovalCode(), Trip);
    end;

    procedure RunWorkflowOnApproveTripApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnApproveTripApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    procedure RunWorkflowOnApproveTripApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApproveTripApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnRejectTripApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectTripApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnRejectTripApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectTripApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnDelegateTripApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnDelegateTripApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnDelegateApprovalRequest', '', false, false)]
    procedure RunWorkflowOnDelegateTripApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegateTripApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure SetStatusToPendingApprovalCodeTrip(): Code[128]
    begin
        exit(UpperCase('SetStatusToPendingApprovalTrip'));
    end;

    procedure SetStatusToPendingApprovalTrip(var Variant: Variant)
    var
        RecRef: RecordRef;
        Trip: Record Trip;
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::Trip:
                begin
                    RecRef.SetTable(Trip);
                    Trip.Validate("Trip Status", Trip."Trip Status"::"Pending approval");
                    Trip.Modify();
                    Variant := Trip;
                end;
        end;
    end;

    procedure ReleaseTripCode(): Code[128]
    begin
        exit(UpperCase('ReleaseTrip'));
    end;


    procedure ReleaseTrip(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        Trip: Record Trip;
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReleaseTrip(Variant);
                end;
            DATABASE::Trip:
                begin
                    RecRef.SetTable(Trip);
                    Trip.Validate("Trip Status", Trip."Trip Status"::Approved);
                    Trip.Validate("Trip Stage",Trip."Trip Stage"::Approved);
                    Trip.Modify();
                    Variant := Trip;
                end;
        end;
    end;

    procedure ReOpenTripCode(): Code[128]
    begin
        exit(UpperCase('ReOpenTrip'));
    end;

    procedure ReOpenTrip(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        Trip: Record Trip;
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReOpenTrip(Variant);
                end;
            DATABASE::Trip:
                begin
                    RecRef.SetTable(Trip);
                    Trip.Validate("Trip Status", Trip."Trip Status"::Open);
                    Trip.Validate("Trip Stage",Trip."Trip Stage"::Created);
                    Trip.Modify();
                    Variant := Trip;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    procedure AddTripEventToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendTripApprovalCode(), Database::Trip, SendTripReq, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApproveTripApprovalCode(), Database::"Approval Entry", AppReqTrip, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectTripApprovalCode(), Database::"Approval Entry", RejReqTrip, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnDelegateTripApprovalCode(), Database::"Approval Entry", DelReqTrip, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelTripApprovalCode(), Database::Trip, CanReqTrip, 0, false);

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', false, false)]
    procedure AddTripRespToLibrary()
    begin
        WorkflowResponseHandling.AddResponseToLibrary(SetStatusToPendingApprovalCodeTrip(), 0, SendForPendAppTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReleaseTripCode(), 0, ReleaseTripTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReOpenTripCode(), 0, ReOpenTripTxt, 'GROUP 0');

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnExecuteWorkflowResponse', '', false, false)]
    procedure ExeRespForTrip(var ResponseExecuted: Boolean; Variant: Variant; xVariant: Variant; ResponseWorkflowStepInstance: Record "Workflow Step Instance")
    var
        WorkflowResponse: Record "Workflow Response";
    begin
        IF WorkflowResponse.GET(ResponseWorkflowStepInstance."Function Name") THEN
            case WorkflowResponse."Function Name" of
                SetStatusToPendingApprovalCodeTrip():
                    begin
                        SetStatusToPendingApprovalTrip(Variant);
                        ResponseExecuted := true;
                    end;
                ReleaseTripCode():
                    begin
                        ReleaseTrip(Variant);
                        ResponseExecuted := true;
                    end;
                ReOpenTripCode():
                    begin
                        ReOpenTrip(Variant);
                        ResponseExecuted := true;
                    end;
            end;
    end;
}
