report 50143 "Purchase Order-Excel"
{
    ApplicationArea = All;
    Caption = 'Purchase Order - Excel';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = sorting("No.", "Document Type") where("Document Type" = filter('Order'));
            RequestFilterFields = "Posting Date";

            dataitem("Purchase Line"; "Purchase Line")
            {

                DataItemTableView = sorting("Document No.", "Line No.");
                DataItemLink = "Document No." = field("No.");
                trigger OnAfterGetRecord()
                var
                begin
                    if Amount <> "Amount Including VAT" then
                        VatAmount := ("Amount Including VAT" - Amount)
                    else
                        VatAmount := 0;

                    CreatePurchaseExcelBody();
                end;
            }

        }
    }

    trigger OnPreReport()
    begin
        TempExcelBuffer.RESET;
        TempExcelBuffer.DELETEALL;
        CreatePurchaseExcelHeader();
    end;

    trigger OnPostReport()
    begin
        CreateExcelBook();
    end;

    var
        TempExcelBuffer: Record "Excel Buffer" temporary;
        PurchaseHeader: Record "Purchase Header";
        Purchaseline: Record "Purchase Line";
        VatAmount: Decimal;
        DocumentNo: Code[20];
        CurrentDocumentNo: Code[20];
        TotalAmount: Decimal;
        J: Integer;
        I: Integer;
        DocumentCounter: Integer;
        StartDate: Date;
        EndDate: Date;

    local procedure CreatePurchaseExcelHeader()
    begin
        TempExcelBuffer.AddColumn('Order No.', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Posting Date', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Supplier', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Part Number', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Descrption', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Quantity', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Total Value', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Total Tax', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Quantity Received', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Quantity to Receive', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Cost', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
    end;

    local procedure CreatePurchaseExcelBody()
    var
    begin
        TempExcelBuffer.NewRow;
        TempExcelBuffer.AddColumn("Purchase Line"."Document No.", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Purchase Header"."Posting Date", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Date);
        TempExcelBuffer.AddColumn("Purchase Header"."Buy-from Vendor Name", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Purchase Line"."No.", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Purchase Line".Description, FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Purchase Line".Quantity, FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
        TempExcelBuffer.AddColumn("Purchase Line".Amount, FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::text);
        TempExcelBuffer.AddColumn(VatAmount, FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::text);
        TempExcelBuffer.AddColumn("Purchase Line"."Quantity Received", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
        TempExcelBuffer.AddColumn("Purchase Line"."Qty. to Receive", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
        TempExcelBuffer.AddColumn("Purchase Line"."Direct Unit Cost", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
    end;


    local procedure CreateExcelBook()
    begin
        TempExcelBuffer.CreateNewBook('Purchase Order');
        TempExcelBuffer.WriteSheet('Purchase Order', CompanyName, UserId);
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.OpenExcel();
    end;
}
