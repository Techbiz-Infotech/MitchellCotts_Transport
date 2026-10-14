report 57040 "Local Details"
{
    //ApplicationArea = All;
    Caption = 'Local Details';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;

    dataset
    {
        dataitem(Trip; Trip)
        {
            DataItemTableView = SORTING("Trip ID") where("Global Dimension 2 Code" = filter('LOCAL'));
            RequestFilterFields = "Trip ID", "Trip Date", "Vehicle No.", "Client No.";
            trigger OnPreDataItem()
            begin

                CreateLocalExcelHeader();
            end;

            trigger OnAfterGetRecord()
            var
            begin
                Clear(CrediNo);
                Clear(InvoiceNo);
                CreditLine.Reset();
                CreditLine.SetRange("Shortcut Dimension 3 Code", Trip."Trip ID");
                if CreditLine.FindFirst() then
                    CrediNo := CreditLine."Document No.";
                postedsalesLine.Reset();
                postedsalesLine.SetRange("Shortcut Dimension 3 Code", Trip."Trip ID");
                postedsalesLine.SetRange("Shortcut Dimension 2 Code", 'LOCAL');
                if postedsalesLine.FindFirst() then
                    InvoiceNo := postedsalesLine."Document No.";
                CreateLocalExcelBody();
            end;
        }
    }
    trigger OnInitReport()
    begin
        TempExcelBuffer.DeleteAll();
    end;

    trigger OnPostReport()
    begin
        CreateExcelBook();
    end;

    local procedure CreateLocalExcelHeader()
    begin
        TempExcelBuffer.AddColumn('Trip Type', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Trip Id', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Trip Date', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Customer Name', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Vehicle Number', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Trip Status', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Consumed Fuel', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Cargo type', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Container No.', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Container Size', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Delivery Note No', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Interchange No', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Booking No', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Additional Remarks', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Offered Route Price', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Posted Invoice No.', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Posted Credit Memo No.', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
    end;

    local procedure CreateLocalExcelBody()
    begin
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn(Trip."Global Dimension 2 Code", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(Trip."Trip ID", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(Trip."Trip Date", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Date);
        TempExcelBuffer.AddColumn(Trip."Client Name", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(Trip."Vehicle No.", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(Trip."Trip Status", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(Trip."Consumed Fuel In Litres", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(Trip."Container Type", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(Trip."Container No.", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(Trip."Container Size", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(Trip."Delivery Note No", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(Trip."Interchange No", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(Trip."Booking No", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(Trip."Additional Remarks", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(Trip."Offered Route Price", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(InvoiceNo, False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(CrediNo, False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);

    end;

    Local procedure CreateExcelBook();
    begin
        TempExcelBuffer.CreateNewBook('Local Details');
        TempExcelBuffer.WriteSheet('Local', CompanyName, UserId);
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.SetFriendlyFilename('Local Details');
        TempExcelBuffer.OpenExcel();
    end;



    var
        TempExcelBuffer: Record "Excel Buffer" temporary;
        TripType: Record Trip;
        CreditLine, CreditLine1 : Record "Sales Cr.Memo Line";
        CrediNo: Code[20];
        InvoiceNo: code[20];
        postedsalesLine: Record "Sales Invoice Line";
}
