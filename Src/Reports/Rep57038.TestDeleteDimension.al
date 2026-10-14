report 57038 "Test Delete Dimension"
{
    ApplicationArea = All;
    Caption = 'Test Delete Dimension';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    Permissions = tabledata 480 = rimd;
    dataset
    {

    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    trigger OnPostReport();
    var
        DimensionSetEntry: Record "Dimension Set Entry";
    begin
        DimensionSetEntry.Reset();
        DimensionSetEntry.SetRange("Dimension Set ID", 199);
        if DimensionSetEntry.FindFirst() then
            repeat
                DimensionSetEntry.Delete();

            until DimensionSetEntry.Next() = 0;
    end;
}
