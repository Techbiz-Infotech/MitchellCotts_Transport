codeunit 57004 "Petty Cash Expenses WorkFlow"
{
    permissions = TableData "Approval Entry" = ird;
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
        SendPettyCashExpensesReq: TextConst ENU = 'Approval Request for Petty Cash Expenses is requested', ENG = 'Approval Request for Petty Cash Expenses is requested';
        AppReqPettyCashExpenses: TextConst ENU = 'Approval Request for Petty Cash Expenses is approved', ENG = 'Approval Request for Petty Cash Expenses is approved';
        RejReqPettyCashExpenses: TextConst ENU = 'Approval Request for Petty Cash Expenses is rejected', ENG = 'Approval Request for Petty Cash Expenses is rejected';
        DelReqPettyCashExpenses: TextConst ENU = 'Approval Request for Petty Cash Expenses is delegated', ENG = 'Approval Request for Petty Cash Expenses is delegated';
        CanReqPettyCashExpenses: TextConst ENU = 'Approval Request for Petty Cash Expenses is cancelled', ENG = 'Approval Request for Petty Cash Expenses is cancelled';
        SendForPendAppTxt: TextConst ENU = 'Status of Petty Cash Expenses changed to Pending approval', ENG = 'Status of Petty Cash Expenses changed to Pending approval';
        ReleasePettyCashExpensesTxt: TextConst ENU = 'Release Petty Cash Expenses', ENG = 'Release Petty Cash Expenses';
        ReOpenPettyCashExpensesTxt: TextConst ENU = 'ReOpen Petty Cash Expenses', ENG = 'ReOpen Petty Cash Expenses';

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnBeforeshowCommonApprovalStatus', '', false, false)]
    procedure OnBeforeshowCommonApprovalStatus(var RecRef: RecordRef; var IsHandle: Boolean);
    var
        PettyCash: Record "Petty Cash Expenses Detail";
    begin
        case RecRef.Number of
            DATABASE::"Petty Cash Expenses Detail":
                begin
                    RecRef.SetTable(PettyCash);
                    IsHandle := true;
                end;

        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnPopulateApprovalEntryArgument', '', false, false)]
    procedure SubOnPopulateApprovalEntryArgument(var ApprovalEntryArgument: Record "Approval Entry"; var RecRef: RecordRef);
    var
        PettyCash: Record "Petty Cash Expenses Detail";
    begin
        case RecRef.Number of
            DATABASE::"Petty Cash Expenses Detail":
                begin
                    RecRef.SetTable(PettyCash);
                    ApprovalEntryArgument."Document No." := PettyCash."Voucher No.";
                    ApprovalEntryArgument.Amount := PettyCash."Petty Cash Amount";
                end;
        end;
    end;

    procedure RunWorkflowOnCancelPettyCashExpensesApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCancelPettyCashExpensesApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Unigroup Workflow Events", 'OnSendPettyCashExpensesforCancel', '', false, false)]
    procedure RunWorkflowOnSendPettyCashExpensesCancel(var PettyCashExpenses: Record "Petty Cash Expenses Detail")
    begin
        WFMngt.HandleEvent(RunWorkflowOnCancelPettyCashExpensesApprovalCode(), PettyCashExpenses);
    end;


    procedure RunWorkflowOnSendPettyCashExpensesApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendPettyCashExpensesApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Unigroup Workflow Events", 'OnSendPettyCashExpensesforApproval', '', false, false)]
    procedure RunWorkflowOnSendPettyCashExpensesApproval(var PettyCashExpenses: Record "Petty Cash Expenses Detail")

    begin
        WFMngt.HandleEvent(RunWorkflowOnSendPettyCashExpensesApprovalCode(), PettyCashExpenses);
    end;

    procedure RunWorkflowOnApprovePettyCashExpensesApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnApprovePettyCashExpensesApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    procedure RunWorkflowOnApprovePettyCashExpensesApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApprovePettyCashExpensesApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnRejectPettyCashExpensesApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectPettyCashExpensesApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnRejectPettyCashExpensesApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectPettyCashExpensesApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnDelegatePettyCashExpensesApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnDelegatePettyCashExpensesApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnDelegateApprovalRequest', '', false, false)]
    procedure RunWorkflowOnDelegatePettyCashExpensesApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegatePettyCashExpensesApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure SetStatusToPendingApprovalCodePettyCashExpenses(): Code[128]
    begin
        exit(UpperCase('SetStatusToPendingApprovalPettyCashExpenses'));
    end;

    procedure SetStatusToPendingApprovalPettyCashExpenses(var Variant: Variant)
    var
        RecRef: RecordRef;
        PettyCashExpenses: Record "Petty Cash Expenses Detail";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Petty Cash Expenses Detail":
                begin
                    RecRef.SetTable(PettyCashExpenses);
                    PettyCashExpenses.Validate("Petty Cash Approval Status", PettyCashExpenses."Petty Cash Approval Status"::"Pending approval");
                    PettyCashExpenses.Modify();
                    Variant := PettyCashExpenses;
                end;
        end;
    end;

    procedure ReleasePettyCashExpensesCode(): Code[128]
    begin
        exit(UpperCase('ReleasePettyCashExpenses'));
    end;

    procedure ReleasePettyCashExpenses(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        PettyCashExpenses: Record "Petty Cash Expenses Detail";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReleasePettyCashExpenses(Variant);
                end;
            DATABASE::"Petty Cash Expenses Detail":
                begin
                    RecRef.SetTable(PettyCashExpenses);
                    PettyCashExpenses.Validate("Petty Cash Approval Status", PettyCashExpenses."Petty Cash Approval Status"::Approved);
                    PettyCashExpenses.Modify();
                    Variant := PettyCashExpenses;
                end;
        end;
    end;

    procedure ReOpenPettyCashExpensesCode(): Code[128]
    begin
        exit(UpperCase('ReOpenPettyCashExpenses'));
    end;

    procedure ReOpenPettyCashExpenses(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        PettyCashExpenses: Record "Petty Cash Expenses Detail";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReOpenPettyCashExpenses(Variant);
                end;
            DATABASE::"Petty Cash Expenses Detail":
                begin
                    RecRef.SetTable(PettyCashExpenses);
                    PettyCashExpenses.Validate("Petty Cash Approval Status", PettyCashExpenses."Petty Cash Approval Status"::Open);
                    PettyCashExpenses.Modify();
                    Variant := PettyCashExpenses;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    procedure AddPettyCashExpensesEventToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendPettyCashExpensesApprovalCode(), Database::"Petty Cash Expenses Detail", SendPettyCashExpensesReq, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApprovePettyCashExpensesApprovalCode(), Database::"Approval Entry", AppReqPettyCashExpenses, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectPettyCashExpensesApprovalCode(), Database::"Approval Entry", RejReqPettyCashExpenses, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnDelegatePettyCashExpensesApprovalCode(), Database::"Approval Entry", DelReqPettyCashExpenses, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelPettyCashExpensesApprovalCode(), Database::"Petty Cash Expenses Detail", CanReqPettyCashExpenses, 0, false);

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', false, false)]
    procedure AddPettyCashExpensesRespToLibrary()
    begin
        WorkflowResponseHandling.AddResponseToLibrary(SetStatusToPendingApprovalCodePettyCashExpenses(), 0, SendForPendAppTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReleasePettyCashExpensesCode(), 0, ReleasePettyCashExpensesTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReOpenPettyCashExpensesCode(), 0, ReOpenPettyCashExpensesTxt, 'GROUP 0');

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnExecuteWorkflowResponse', '', false, false)]
    procedure ExeRespForPettyCashExpenses(var ResponseExecuted: Boolean; Variant: Variant; xVariant: Variant; ResponseWorkflowStepInstance: Record "Workflow Step Instance")
    var
        WorkflowResponse: Record "Workflow Response";
    begin
        IF WorkflowResponse.GET(ResponseWorkflowStepInstance."Function Name") THEN
            case WorkflowResponse."Function Name" of
                SetStatusToPendingApprovalCodePettyCashExpenses():
                    begin
                        SetStatusToPendingApprovalPettyCashExpenses(Variant);
                        ResponseExecuted := true;
                    end;
                ReleasePettyCashExpensesCode():
                    begin
                        ReleasePettyCashExpenses(Variant);
                        ResponseExecuted := true;
                    end;
                ReOpenPettyCashExpensesCode():
                    begin
                        ReOpenPettyCashExpenses(Variant);
                        ResponseExecuted := true;
                    end;
            end;
    end;


}
