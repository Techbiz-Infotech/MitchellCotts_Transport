report 50131 "Petty Cash Expenses Excel"
{
    Caption = 'Petty Cash Expenses Excel';
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        dataitem("Petty Cash Expenses Detail"; "Petty Cash Expenses Detail")
        {
            DataItemTableView = SORTING("Voucher No.") ORDER(Ascending);
            RequestFilterFields = "Creation date", "Expense Type", From, Destination;
            trigger OnPreDataItem()
            begin
                CreatePettyCashExpensesExcelHeader();
            end;

            trigger OnAfterGetRecord()
            begin
                CreatePettyCashExpensesExcelBody();
            end;
        }
    }
    trigger OnPreReport()
    begin
        TempExcelBuffer.RESET;
        TempExcelBuffer.DELETEALL;
    end;

    trigger OnPostReport()
    begin
        CreateExcelBook();
    end;

    var
        TempExcelBuffer: Record "Excel Buffer" temporary;

    local procedure CreatePettyCashExpensesExcelHeader()
    begin
        TempExcelBuffer.AddColumn('Voucher No.', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Creation date', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Petty Cash For', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('For Closed Trip', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Trip ID', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Expense Type', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Account Type', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Account No', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Bal. Account Type', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Bal. Account No', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Transaction Reference No', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Petty Cash Amount', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Petty Cash Approval Status', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Location', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Vehicle No', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Driver ID', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Driver Name', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Mobile Phone No', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Trip Direction', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('From', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Destination', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Remarks/Comments', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Reason For Rejection', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);

    end;

    local procedure CreatePettyCashExpensesExcelBody()
    begin
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn("Petty Cash Expenses Detail"."Voucher No.", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Petty Cash Expenses Detail"."Creation date", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Date);
        TempExcelBuffer.AddColumn("Petty Cash Expenses Detail"."Petty Cash For", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Petty Cash Expenses Detail"."For Closed Trip?", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Petty Cash Expenses Detail"."Trip ID", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Petty Cash Expenses Detail"."Expense Type", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Petty Cash Expenses Detail"."Account Type", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Petty Cash Expenses Detail"."Account No.", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Petty Cash Expenses Detail"."Bal. Account Type", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Petty Cash Expenses Detail"."Bal. Account No.", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Petty Cash Expenses Detail"."Transaction Reference No.", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Petty Cash Expenses Detail"."Petty Cash Amount", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
        TempExcelBuffer.AddColumn("Petty Cash Expenses Detail"."Petty Cash Approval Status", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Petty Cash Expenses Detail"."Shortcut Dimension 6 Code", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Petty Cash Expenses Detail"."Vehicle No.", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Petty Cash Expenses Detail"."Driver ID", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Petty Cash Expenses Detail"."Driver Name", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Petty Cash Expenses Detail"."Mobile Phone No.", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Petty Cash Expenses Detail"."Trip Direction", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Petty Cash Expenses Detail".From, False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Petty Cash Expenses Detail".Destination, False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Petty Cash Expenses Detail"."Remarks/Comments", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Petty Cash Expenses Detail"."Reason For Rejection", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
    end;

    local procedure CreateExcelBook()
    begin
        TempExcelBuffer.CreateNewBook('Petty Cash Expenses');
        TempExcelBuffer.WriteSheet('Petty Cash Expenses', CompanyName, UserId);
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.OpenExcel();
    end;
}
