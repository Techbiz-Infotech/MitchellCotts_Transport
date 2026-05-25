report 50147 Update
{
    Caption = 'Update';
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;
    dataset
    {
        dataitem(fuel; "Fuel Issue")
        {
            DataItemTableView = where(Posted = filter(True));
            trigger OnAfterGetRecord()
            begin
                if fuel."Fuel Issue No." = 'FC26002389' then fuel."For Closed Trip?" := true;
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
