// report 50139 "Trip & Shunting Export"
// {
//     Caption = 'Local & Shunting Report';
//     ApplicationArea = All;
//     UsageCategory = ReportsAndAnalysis;
//     ProcessingOnly = true;
//     dataset
//     {
//         dataitem(Trip; Trip)
//         {
//             DataItemTableView = SORTING("Trip ID") where("Global Dimension 2 Code" = filter('LOCAL'));
//             trigger OnPreDataItem()
//             begin
//                 CreateLocalExcelHeader();
//             end;

//             trigger OnAfterGetRecord()
//             var


//             begin
//                 Clear(InvoiceNo);
//                 Clear(CrediNo);
//                 CreditLine.Reset();
//                 CreditLine.SetRange("Shortcut Dimension 3 Code", "Trip ID");
//                 if CreditLine.FindFirst() then
//                     CrediNo := CreditLine."Document No.";
//                 postedsalesLine.Reset();
//                 postedsalesLine.SetRange("Shortcut Dimension 3 Code", "Trip ID");
//                 postedsalesLine.SetRange("Shortcut Dimension 2 Code", 'LOCAL');
//                 if postedsalesLine.FindFirst() then
//                     InvoiceNo := postedsalesLine."Document No.";
//                 TripType.Reset();
//                 TripType.SetRange("Trip ID", "Trip ID");
//                 if TripType.FindFirst() then
//                     CreateLocalExcelBody();

//             end;

//             trigger OnPostDataItem()
//             begin
//                 CreateExcelSheet(CopyStr('LOCAL', 1, 250), true);
//             end;
//         }
//         dataitem("Shunting Details"; "Shunting Details")
//         {
//             DataItemTableView = SORTING("Trip Id", "Shunting Trip ID") ORDER(Ascending);
//             trigger OnPreDataItem()
//             begin

//                 CreateShuntingExcelHeader();
//             end;

//             trigger OnAfterGetRecord()
//             begin
//                 Clear(CrediNo1);
//                 CreditLine1.Reset();
//                 CreditLine1.SetRange("Shortcut Dimension 3 Code", "Trip ID");
//                 if CreditLine1.FindFirst() then
//                     CrediNo1 := CreditLine."Document No.";

//                 TripType.Reset();
//                 TripType.SetRange("Trip ID", "Trip ID");
//                 if TripType.FindFirst() then;
//                 CreateShuntingExcelBody();
//             end;

//             trigger OnPostDataItem()
//             begin
//                 CreateExcelSheet(CopyStr("Shunting Details".TableName, 1, 250), false);
//             end;
//         }
//     }

//     trigger OnInitReport()
//     begin
//         TempExcelBuffer.DeleteAll();
//     end;

//     trigger OnPostReport()
//     begin
//         CreateExcelBook();
//     end;

//     local procedure CreateLocalExcelHeader()
//     begin
//         TempExcelBuffer.AddColumn('Trip Type', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn('Trip Id', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn('Trip Date', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn('Customer Name', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn('Vehicle Number', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn('Trip Status', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn('Consumed Fuel', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn('Cargo type', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn('Container No.', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn('Container Size', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn('Delivery Note No', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn('Interchange No', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn('Booking No', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn('Additional Remarks', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn('Offered Route Price', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn('Posted Invoice No.', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn('Posted Credit Memo No.', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
//     end;

//     local procedure CreateShuntingExcelHeader()
//     begin
//         TempExcelBuffer.AddColumn('Trip Type', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn('Trip Id', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn('Shunting Trip ID', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn('Shunting Trip Date', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn('Customer Name', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn('Vehicle Number', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn('Billing Status', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn('Litres Per Trip & Consumed Fuel', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn('Cargo type', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn('Container No.', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn('Container Size', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn('Delivery Note No', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn('Interchange No', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn('Booking No', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn('Additional Remarks', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn('Container Charge', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn('Posted Invoice No.', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn('Posted Credit Memo No.', False, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
//     end;

//     local procedure CreateLocalExcelBody()
//     begin
//         TempExcelBuffer.NewRow();
//         TempExcelBuffer.AddColumn(Trip."Global Dimension 2 Code", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn(Trip."Trip ID", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn(Trip."Trip Date", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn(Trip."Client Name", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn(Trip."Vehicle No.", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn(Trip."Trip Status", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn(Trip."Consumed Fuel In Litres", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn(Trip."Container Type", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn(Trip."Container No.", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn(Trip."Container Size", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn(Trip."Delivery Note No", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn(Trip."Interchange No", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn(Trip."Booking No", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn(Trip."Additional Remarks", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn(Trip."Offered Route Price", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn(InvoiceNo, False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn(CrediNo, False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);

//     end;

//     local procedure CreateShuntingExcelBody()
//     begin
//         TempExcelBuffer.NewRow();
//         TempExcelBuffer.AddColumn(TripType."Global Dimension 2 Code", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn("Shunting Details"."Trip Id", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn("Shunting Details"."Shunting Trip ID", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn("Shunting Details"."Shunting Trip Date", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn(TripType."Client Name", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn(TripType."Vehicle No.", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn("Shunting Details"."Billing Status", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn("Shunting Details"."Litres Per Trip", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
//         TempExcelBuffer.AddColumn("Shunting Details"."Cargo type", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn("Shunting Details"."Container No.", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn("Shunting Details"."Container Size", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn("Shunting Details"."Delivery Note No", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn("Shunting Details"."Interchange No", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn("Shunting Details"."Booking No", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn("Shunting Details"."Additional Remarks", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn("Shunting Details"."Container Charge", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn("Shunting Details"."Posted Invoice No.", False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//         TempExcelBuffer.AddColumn(CrediNo1, False, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
//     end;


//     local procedure CreateExcelBook()
//     begin
//         TempExcelBuffer.CloseBook();
//         TempExcelBuffer.SetFriendlyFilename('Local & Shunting Export');
//         TempExcelBuffer.OpenExcel();
//     end;

//     local procedure CreateExcelSheet(SheetName: Text[250]; NewBook: Boolean)
//     begin
//         if NewBook then
//             TempExcelBuffer.CreateNewBook(SheetName)
//         else
//             TempExcelBuffer.SelectOrAddSheet(SheetName);
//         TempExcelBuffer.WriteSheet(SheetName, CompanyName, UserId);
//         TempExcelBuffer.DeleteAll();
//         TempExcelBuffer.ClearNewRow();
//     end;

//     var
//         TempExcelBuffer: Record "Excel Buffer" temporary;
//         TripType: Record Trip;
//         CreditLine, CreditLine1 : Record "Sales Cr.Memo Line";
//         postedsalesLine: Record "Sales Invoice Line";
//         CrediNo: Code[20];
//         CrediNo1: Code[20];
//         InvoiceNo: code[20];
// }
