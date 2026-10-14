codeunit 57002 FuelWorkflow
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
        SendFuelReq: TextConst ENU = 'Approval Request for Fuel is requested', ENG = 'Approval Request for Fuel is requested';
        AppReqFuel: TextConst ENU = 'Approval Request for Fuel is approved', ENG = 'Approval Request for Fuel is approved';
        RejReqFuel: TextConst ENU = 'Approval Request for Fuel is rejected', ENG = 'Approval Request for Fuel is rejected';
        DelReqFuel: TextConst ENU = 'Approval Request for Fuel is delegated', ENG = 'Approval Request for Fuel is delegated';
        CanReqFuel: TextConst ENU = 'Approval Request for Fuel is cancelled', ENG = 'Approval Request for Fuel is cancelled';
        SendForPendAppTxt: TextConst ENU = 'Status of Fuel changed to Pending approval', ENG = 'Status of Fuel changed to Pending approval';
        ReleaseFuelTxt: TextConst ENU = 'Release Fuel', ENG = 'Release Fuel';
        ReOpenFuelTxt: TextConst ENU = 'ReOpen Fuel', ENG = 'ReOpen Fuel';

    procedure RunWorkflowOnCancelFuelApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCancelFuelApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Unigroup Workflow Events", 'OnSendFuelforCancel', '', false, false)]
    procedure RunWorkflowOnSendFuelCancel(var Fuel: Record "Fuel Issue")
    begin
        WFMngt.HandleEvent(RunWorkflowOnCancelFuelApprovalCode(), Fuel);
    end;


    procedure RunWorkflowOnSendFuelApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendFuelApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Unigroup Workflow Events", 'OnSendFuelforApproval', '', false, false)]
    procedure RunWorkflowOnSendFuelApproval(var Fuel: Record "Fuel Issue")
    begin
        WFMngt.HandleEvent(RunWorkflowOnSendFuelApprovalCode(), Fuel);
    end;

    procedure RunWorkflowOnApproveFuelApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnApproveFuelApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    procedure RunWorkflowOnApproveFuelApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApproveFuelApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnRejectFuelApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectFuelApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnRejectFuelApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectFuelApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnDelegateFuelApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnDelegateFuelApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnDelegateApprovalRequest', '', false, false)]
    procedure RunWorkflowOnDelegateFuelApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegateFuelApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure SetStatusToPendingApprovalCodeFuel(): Code[128]
    begin
        exit(UpperCase('SetStatusToPendingApprovalFuel'));
    end;

    procedure SetStatusToPendingApprovalFuel(var Variant: Variant)
    var
        RecRef: RecordRef;
        Fuel: Record "Fuel Issue";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Fuel Issue":
                begin
                    RecRef.SetTable(Fuel);
                    Fuel.Validate("Fuel Approval Status", Fuel."Fuel Approval Status"::"Pending approval");
                    Fuel.Modify();
                    Variant := Fuel;
                end;
        end;
    end;

    procedure ReleaseFuelCode(): Code[128]
    begin
        exit(UpperCase('ReleaseFuel'));
    end;

    procedure ReleaseFuel(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        Fuel: Record "Fuel Issue";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReleaseFuel(Variant);
                end;
            DATABASE::"Fuel Issue":
                begin
                    RecRef.SetTable(Fuel);
                    Fuel.Validate("Fuel Approval Status", Fuel."Fuel Approval Status"::Approved);
                    Fuel.Modify();
                    Variant := Fuel;
                end;
        end;
    end;

    procedure ReOpenFuelCode(): Code[128]
    begin
        exit(UpperCase('ReOpenFuel'));
    end;

    procedure ReOpenFuel(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        Fuel: Record "Fuel Issue";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReOpenFuel(Variant);
                end;
            DATABASE::"Fuel Issue":
                begin
                    RecRef.SetTable(Fuel);
                    Fuel.Validate("Fuel Approval Status", Fuel."Fuel Approval Status"::Open);
                    Fuel.Modify();
                    Variant := Fuel;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    procedure AddFuelEventToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendFuelApprovalCode(), Database::"Fuel Issue", SendFuelReq, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApproveFuelApprovalCode(), Database::"Approval Entry", AppReqFuel, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectFuelApprovalCode(), Database::"Approval Entry", RejReqFuel, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnDelegateFuelApprovalCode(), Database::"Approval Entry", DelReqFuel, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelFuelApprovalCode(), Database::"Fuel Issue", CanReqFuel, 0, false);

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', false, false)]
    procedure AddFuelRespToLibrary()
    begin
        WorkflowResponseHandling.AddResponseToLibrary(SetStatusToPendingApprovalCodeFuel(), 0, SendForPendAppTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReleaseFuelCode(), 0, ReleaseFuelTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReOpenFuelCode(), 0, ReOpenFuelTxt, 'GROUP 0');

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnExecuteWorkflowResponse', '', false, false)]
    procedure ExeRespForFuel(var ResponseExecuted: Boolean; Variant: Variant; xVariant: Variant; ResponseWorkflowStepInstance: Record "Workflow Step Instance")
    var
        WorkflowResponse: Record "Workflow Response";
    begin
        IF WorkflowResponse.GET(ResponseWorkflowStepInstance."Function Name") THEN
            case WorkflowResponse."Function Name" of
                SetStatusToPendingApprovalCodeFuel():
                    begin
                        SetStatusToPendingApprovalFuel(Variant);
                        ResponseExecuted := true;
                    end;
                ReleaseFuelCode():
                    begin
                        ReleaseFuel(Variant);
                        ResponseExecuted := true;
                    end;
                ReOpenFuelCode():
                    begin
                        ReOpenFuel(Variant);
                        ResponseExecuted := true;
                    end;
            end;
    end;

}
