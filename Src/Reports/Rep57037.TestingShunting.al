report 57037 "Testing Shunting"
{
    //ApplicationArea = All;
    Caption = 'Testing Shunting';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        dataitem(Trip1; Trip)
        {
            RequestFilterFields = "Trip ID", "Trip Date", "Client No.";
            DataItemTableView = sorting("Trip ID");
            dataitem("Shunting Details"; "Shunting Details")
            {
                DataItemTableView = SORTING("Trip Id", "Shunting Trip ID") ORDER(Ascending);
                DataItemLinkReference = Trip1;
                DataItemLink = "Trip ID" = field("Trip ID");


                trigger OnAfterGetRecord()
                begin
                    Clear(CrediNo1);
                    CreditLine1.Reset();
                    CreditLine1.SetRange("Shortcut Dimension 3 Code", "Trip ID");
                    if CreditLine1.FindFirst() then
                        CrediNo1 := CreditLine."Document No.";

                    // TripType.Reset();
                    // TripType.SetRange("Trip ID", "Trip ID");
                    // if TripType.FindFirst() then;
                    //Message('Shunting %1', "Shunting Trip ID");
                    CreateShuntingExcelBody();
                end;

                trigger OnPostDataItem()
                begin
                    //CreateExcelBook();
                end;

                trigger OnPreDataItem()
                begin

                end;
            }
            trigger OnPreDataItem()
            begin
                
                // if TripID <> '' then
                // Trip1.SetRange("Trip Id", TripID);


                // // if Customer <> '' then
                // Trip1.SetRange("Client No.", Customer);
                // Trip1.SetRange("Trip Date", StartDate, EndDate);
                CreateShuntingExcelHeader();
                

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
                    // // field(Truck; Truck)
                    // // {
                    // //     ApplicationArea = Basic, Suite;
                    // //     Caption = 'Truck';
                    // //     TableRelation = "Fixed Asset";
                    // // }
                    // field(StartDate; StartDate)
                    // {
                    //     ApplicationArea = Basic, Suite;
                    //     Caption = 'Start Date';

                    // }
                    // field(EndDate; EndDate)
                    // {
                    //     ApplicationArea = Basic, Suite;
                    //     Caption = 'End Date';
                    // }
                    // field(TripDate; TripDate)
                    // {
                    //     ApplicationArea = Basic, Suite;
                    //     Caption = 'End Date';
                    // }

                    // field(Customer; Customer)
                    // {
                    //     ApplicationArea = Basic, Suite;
                    //     caption = 'Customer';
                    //     TableRelation = Customer;
                    // }
                    // field(TripID; TripID)
                    // {
                    //     ApplicationArea = Basic, Suite;
                    //     Caption = 'Trip ID';
                    //     TableRelation = Trip;
                    // }
                }
            }
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


    local procedure CreateShuntingExcelHeader()
    begin
        TempExcelBuffer.AddColumn('Trip Type', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Trip Id', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Shunting Trip ID', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Shunting Trip Date', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Customer Name', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Vehicle Number', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Billing Status', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Litres Per Trip & Consumed Fuel', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Cargo type', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Container No.', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Container Size', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Delivery Note No', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Interchange No', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Booking No', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Additional Remarks', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Container Charge', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Posted Invoice No.', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Posted Credit Memo No.', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
    end;


    local procedure CreateShuntingExcelBody()
    begin
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn(Trip1."Global Dimension 2 Code", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(Trip1."Trip Id", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Shunting Details"."Shunting Trip ID", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Shunting Details"."Shunting Trip Date", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(Trip1."Client Name", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(Trip1."Vehicle No.", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
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
        TempExcelBuffer.AddColumn(CrediNo1, False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
    end;


    Local procedure CreateExcelBook();
    begin
        TempExcelBuffer.CreateNewBook('Shunting Details');
        TempExcelBuffer.WriteSheet('Shunting', CompanyName, UserId);
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.SetFriendlyFilename('Shunting Details');
        TempExcelBuffer.OpenExcel();
    end;



    var
        TempExcelBuffer: Record "Excel Buffer" temporary;
        TripType: Record Trip;
        CreditLine, CreditLine1 : Record "Sales Cr.Memo Line";
        postedsalesLine: Record "Sales Invoice Line";
        CrediNo: Code[20];
        CrediNo1: Code[20];
        InvoiceNo: code[20];
        TripID: Code[20];
        Truck: Code[20];
        StartDate: Date;
        EndDate: Date;
        Customer: code[20];
}

