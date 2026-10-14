report 57047 Update
{
    Caption = 'Update';
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;
    dataset
    {
        dataitem(fuel; "Sales Header")
        {
            DataItemTableView = where("No." = filter('TRIN26001126' | 'TRIN26001127' | 'TRIN26001128'));

            trigger OnAfterGetRecord()
            begin
                fuel.Status := fuel.Status::Released;
                fuel.Modify();
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
}
