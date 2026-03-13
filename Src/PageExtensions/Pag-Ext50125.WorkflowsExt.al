pageextension 50125 WorkflowsExt extends Workflows
{
    trigger OnOpenPage()
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.get(UserId);
        if not UserSetup.Workflow then
            Error('You do not have permission to view this area. Please contact Group Audit..!!');
    end;
}
