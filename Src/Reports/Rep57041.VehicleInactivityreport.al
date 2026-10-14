report 57041 "Vehicle Inactivity report"
{
    ApplicationArea = All;
    Caption = 'Vehicle Inactive Report';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    UseRequestPage = true;
    dataset
    {
        dataitem("Fixed Asset"; "Fixed Asset")
        {
            DataItemTableView = SORTING("No.");
            trigger OnPreDataItem()
            begin
                lastDate := CalcDate('-' + Format(FilterInActivedays) + 'D', Today);
                "Fixed Asset".CalcFields("Last Trip Date");
                "Fixed Asset".SetRange("Last Trip Date", 20000101D, lastDate);
            end;

            trigger OnAfterGetRecord()
            begin
                "Fixed Asset".CalcFields("Last Trip Date");
                DaysInactive := Today - "Fixed Asset"."Last Trip Date";
                MakeBody;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(FilterInActivedays; FilterInActivedays)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Inactive Days';
                    }
                }
            }
        }

    }
    trigger OnPreReport()
    begin
        TempExcelBuffer.Reset();
        TempExcelBuffer.DELETEALL();
        MakeHeader; //Create Header Part
    end;

    trigger OnPostReport()
    begin
        CreateExcelBook; // Create Excel Book
    end;

    local procedure MakeHeader()
    var
    begin
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn('Vehicle Inactivity Report', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn('Vehicle No.', FALSE, '', TRUE, FALSE, TRUE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Last Trip Date', FALSE, '', TRUE, FALSE, TRUE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Days Inactive', FALSE, '', TRUE, FALSE, TRUE, '', TempExcelBuffer."Cell Type"::Text);

    end;

    local procedure MakeBody()
    var
        myInt: Integer;
    begin
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn("Fixed Asset"."No.", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::text);
        TempExcelBuffer.AddColumn("Fixed Asset"."Last Trip Date", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Date);
        TempExcelBuffer.AddColumn(DaysInactive, FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
    end;

    Local procedure CreateExcelBook();
    begin
        TempExcelBuffer.CreateNewBook('Vehicle Inactivity Report');
        TempExcelBuffer.WriteSheet('Vehicle Inactivity Report', CompanyName, UserId);
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.SetFriendlyFilename('Vehicle Inactivity Report_' + CompanyName + '_' + Format(CurrentDateTime));
        TempExcelBuffer.OpenExcel();
    end;

    var
        DaysInactive, FilterInActivedays : Integer;
        TempExcelBuffer: Record "Excel Buffer" temporary;
        lastDate: Date;
        RecordExist: Boolean;



}
