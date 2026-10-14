report 57042 "Trip P&L "
{
    ApplicationArea = All;
    Caption = 'Trip P&L ';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        dataitem(Trip; Trip)
        {
            RequestFilterFields = "Trip Date";
            trigger OnAfterGetRecord()
            var
            begin
                Clear(FuelAmount);
                Clear(TotalAmount);
                Clear(PettyCashamount);
                ItemLedgEntry.Reset();
                ItemLedgEntry.SetRange("Trip ID", Trip."Trip ID");
                ItemLedgEntry.SetRange("Entry Type", ItemLedgEntry."Entry Type"::"Negative Adjmt.");
                if ItemLedgEntry.FindFirst() then
                    ItemLedgEntry.CalcFields("Cost Amount (Actual)");
                FuelAmount := ItemLedgEntry."Cost Amount (Actual)";
                SalesInvoiceLine.Reset();
                SalesInvoiceLine.SetRange("Trip ID", Trip."Trip ID");
                if SalesInvoiceLine.FindFirst() then
                    repeat
                        TotalAmount += SalesInvoiceLine.Amount;
                    until SalesInvoiceLine.Next() = 0;
                PettycashRec.Reset();
                PettycashRec.SetRange("Trip ID", Trip."Trip ID");

                if PettycashRec.FindFirst() then
                    PettyCashamount += PettycashRec."Petty Cash Amount";

                Grossmargin := TotalAmount - FuelAmount - PettyCashamount;
                CreateTripExcelBody();

            end;
        }

    }
    trigger OnPreReport()
    begin
        TempExcelBuffer.RESET;
        TempExcelBuffer.DELETEALL;
        CreateTripExcelHeader();
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
        PettyCashamount: Decimal;
        DocumentCounter: Integer;
        PettycashRec: Record "Petty Cash Expenses Detail";
        FuelAmount: Decimal;
        StartDate: Date;
        ItemLedgEntry: Record "Item Ledger Entry";
        EndDate: Date;
        SalesInvoiceLine: Record "Sales Invoice Line";
        Grossmargin: Decimal;

    local procedure CreateTripExcelHeader()
    begin
        TempExcelBuffer.AddColumn('Trip', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Trip Date', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Truck No', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Revenue', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Fuel', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Petty Cash', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Gross Margin', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
    end;

    local procedure CreateTripExcelBody()
    var
    begin
        TempExcelBuffer.NewRow;
        TempExcelBuffer.AddColumn(Trip."Trip ID", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(Trip."Trip Date", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Date);
        TempExcelBuffer.AddColumn(Trip."Vehicle No.", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(TotalAmount, FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(FuelAmount, FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::text);
        TempExcelBuffer.AddColumn(PettyCashamount, FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::text);
        TempExcelBuffer.AddColumn(Grossmargin, FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::text);
    end;


    local procedure CreateExcelBook()
    begin
        TempExcelBuffer.CreateNewBook('Trip P&L');
        TempExcelBuffer.WriteSheet('Trip P&L', CompanyName, UserId);
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.OpenExcel();
    end;

}

