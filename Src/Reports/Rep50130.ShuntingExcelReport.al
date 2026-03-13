report 50130 "Shunting Excel Report"
{
    Caption = 'Shunting Details Report';
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        dataitem("Shunting Details"; "Shunting Details")
        {
            DataItemTableView = SORTING("Trip Id", "Shunting Trip ID") ORDER(Ascending);
            RequestFilterFields = "Trip Id", "Shunting Trip Date", "Billing Status", "Posted Invoice No.";
            trigger OnPreDataItem()
            begin
                CreateShuntingExcelHeader();
            end;

            trigger OnAfterGetRecord()
            begin
                CreateShuntingExcelBody();
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
        ShuntingTripDate: Date;

    local procedure CreateShuntingExcelHeader()
    begin
        TempExcelBuffer.AddColumn('Shunting Trip Date', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Trip Id', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Shunting Trip ID', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Billing Status', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Litres Per Trip', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Cargo type', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Container No.', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Container Size', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Delivery Note No', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Interchange No', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Booking No', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Additional Remarks', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Container Charge', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Posted Invoice No.', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);

    end;

    local procedure CreateShuntingExcelBody()
    begin
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn("Shunting Details"."Shunting Trip Date", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Shunting Details"."Trip Id", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Shunting Details"."Shunting Trip ID", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Shunting Details"."Billing Status", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Shunting Details"."Litres Per Trip", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
        TempExcelBuffer.AddColumn("Shunting Details"."Cargo type", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Shunting Details"."Container No.", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Shunting Details"."Container Size", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Shunting Details"."Delivery Note No", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Shunting Details"."Interchange No", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Shunting Details"."Booking No", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Shunting Details"."Additional Remarks", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Shunting Details"."Container Charge", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Shunting Details"."Posted Invoice No.", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);

    end;

    local procedure CreateExcelBook()
    begin
        TempExcelBuffer.CreateNewBook('Shunting');
        TempExcelBuffer.WriteSheet('Shunting', CompanyName, UserId);
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.OpenExcel();
    end;
}
