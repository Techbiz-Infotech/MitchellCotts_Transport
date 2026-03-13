report 50144 "Stock Issue Excel"
{
    ApplicationArea = All;
    Caption = 'Stock Issue - Excel';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        dataitem("Stock Issue header"; "Stock Issue header")
        {
            DataItemTableView = sorting("Stock Issue No.");
            dataitem("Stock Issue line"; "Stock Issue line")
            {
                DataItemTableView = sorting("Document No.", "Line No.");
                DataItemLink = "Document No." = field("Stock Issue No.");
                trigger OnAfterGetRecord()
                var
                begin
                    Clear(CostAmount);
                    ItemRec.Reset();
                    ItemRec.SetRange("Document No.", "Stock Request No.");
                    ItemRec.SetFilter("Posting Date", '%1..%2', StartDate, EndDate);
                    ItemRec.SetRange("Item No.", "No.");
                    if ItemRec.FindFirst() then
                        ItemRec.CalcFields("Cost Amount (Actual)");
                    CostAmount := ItemRec."Cost Amount (Actual)" / ItemRec.Quantity;
                    CreateStockissueExcelBody();

                end;
            }
            trigger OnAfterGetRecord()
            var
            begin

            end;

            trigger OnPreDataItem()
            var
            begin
                SetFilter("Stock Issue Date", '%1..%2', StartDate, EndDate);
                if RegistrationNo <> '' then
                    SetRange("Vehicle No.", RegistrationNo);
            end;
        }

    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(StartDate; StartDate)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Start Date';
                    }
                    field(EndDate; EndDate)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'End Date';
                    }
                    field(RegistrationNo; RegistrationNo)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Registration No.';
                        TableRelation = "Fixed Asset";
                    }

                }
            }
        }
    }


    trigger OnPreReport()
    begin
        TempExcelBuffer.RESET;
        TempExcelBuffer.DELETEALL;
        CreateStockIssueExcelHeader();
    end;

    trigger OnPostReport()
    begin
        CreateExcelBook();
    end;

    var
        TempExcelBuffer: Record "Excel Buffer" temporary;
        StockIssueHeader: Record "Stock Issue header";
        stcokRequestNo: Record "Stock request header";
        StartDate, EndDate : Date;
        CostAmount: Decimal;
        RegistrationNo: Code[20];
        fixedasset: Record "Fixed Asset";
        Stockissuedate: Date;
        ItemRec: Record "Item Ledger Entry";

    local procedure CreateStockIssueExcelHeader()
    begin
        TempExcelBuffer.AddColumn('Issue No.', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Date', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Job Card Number.', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Workshop', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Registration No.', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Part Number', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Descrption', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Parts Quantity', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Total Cost', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
    end;

    local procedure CreateStockissueExcelBody()
    begin
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn("Stock Issue line"."Document No.", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Stock Issue header"."Stock Issue Date", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Date);
        TempExcelBuffer.AddColumn("Stock Issue line"."Job Card No.", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Stock Issue line"."Shortcut Dimension 6 Code", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Stock Issue header"."Vehicle No.", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
        TempExcelBuffer.AddColumn("Stock Issue line"."No.", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Stock Issue line".Description, False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Stock Issue line".Quantity, False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(CostAmount, False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
    end;

    local procedure CreateExcelBook()
    begin
        TempExcelBuffer.CreateNewBook('Stock Issue');
        TempExcelBuffer.WriteSheet('Stock Issue', CompanyName, UserId);
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.OpenExcel();
    end;
}
