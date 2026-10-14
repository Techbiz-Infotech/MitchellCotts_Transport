report 57024 "Goods Received"
{
    ApplicationArea = all;
    Caption = 'Purchase Order';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Reports/layout/Purchase Order.rdlc';
    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = sorting("Document Type", "No.") where("Document Type" = const(order));
            RequestFilterFields = "No.", "Buy-from Vendor No.";
            RequestFilterHeading = 'Purchase Order';
            column(CompanyInformation; CompanyInformation.Picture) { }
            column(CompanyInformation_Name; CompanyInformation.Name) { }
            column(CompanyInformation_Address; CompanyInformation.Address) { }
            column(CompanyInformation_Address2; CompanyInformation."Address 2") { }
            column(CompanyInformation_Postcode; CompanyInformation."Post Code") { }
            column(EmailCptnlbl; EmailCptnlbl) { }
            column(CompanyInformation_Email; CompanyInformation."E-Mail") { }
            column(TelCptnlbl; TelCptnlbl) { }
            column(CompanyInformation_Phone; CompanyInformation."Phone No.") { }
            column(OrderDateCptnlbl; OrderDateCptnlbl) { }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name") { }
            column(No_; "No.") { }
            column(Currency_Code; "Currency Code") { }
            column(Order_Date; "Order Date") { }
            column(ORIGINALDOCUMENTCptnlbl; ORIGINALDOCUMENTCptnlbl) { }
            column(GOODSRECEIVEDNOTECptnlbl; GOODSRECEIVEDNOTECptnlbl) { }
            column(ForLPONoCptnlbl; ForLPONoCptnlbl) { }
            column(Text001; Text001) { }
            column(ReceivedByCptnlbl; ReceivedByCptnlbl) { }
            column(ConfirmedByCptnlbl; ConfirmedByCptnlbl) { }
            column(PostedbyCptnlbl; PostedbyCptnlbl) { }
            column(StoreManagerCptnlbl; StoreManagerCptnlbl) { }
            column(PrintedByCptnlbl; PrintedByCptnlbl) { }
            column(PrintedOnCptnlbl; PrintedOnCptnlbl) { }
            column(SignCptnlbl; SignCptnlbl) { }
            column(FromCptnlbl; FromCptnlbl) { }
            column(Your_Reference; "Your Reference") { }
            column(Posting_Date; "Posting Date") { }
            column(Amount; Amount) { }
            column(Amount_Including_VAT; "Amount Including VAT") { }
            column(VatAmount; VatAmount) { }
            column(TotalCptnlbl; TotalCptnlbl) { }
            column(VatCptnlbl; VatCptnlbl) { }
            column(SubtotalCptnlbl; SubtotalCptnlbl) { }
            column(Vendor_Order_No_; "Vendor Order No.") { }
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.");
                DataItemLinkReference = "Purchase Header";
                DataItemTableView = SORTING("Document Type", "Document No.", "Line No.");
                column(No_Purchaseline; "No.") { }
                column(DescriptionCptnlbl; DescriptionCptnlbl) { }
                column(Description_Purchaseline; Description) { }
                column(QtyOrderdCptnlbl; QtyOrderdCptnlbl) { }
                column(Quantity_Purchaseline; Quantity) { }
                column(TruckID; "Shortcut Dimension 1 Code") { }
                column(QtyDelivered; QtyDelivered) { }
                column(DateReceivedCptnlbl; DateReceivedCptnlbl) { }
                column(BalanceCptnlbl; BalanceCptnlbl) { }
                column(CustomerRefNoCptnlbl; CustomerRefNoCptnlbl) { }
                column(UnitCostCptnlbl; UnitCostCptnlbl) { }
                column(Unit_Cost; "Unit Cost") { }
                column(Line_Amount; "Line Amount") { }
                column(Quantity_Received; "Quantity Received") { }
            }
            trigger OnAfterGetRecord()
            begin
                if ("Purchase Header".Status = "Purchase Header".Status::Open) or ("Purchase Header".Status = "Purchase Header".Status::"Pending Approval") then
                    Error('You cannot print this report unless the Purchase Order is Released.');
                if Amount <> "Amount Including VAT" then
                    VatAmount := ("Amount Including VAT" - Amount)
                else
                    VatAmount := 0;
                if "Currency Code" = '' then "Currency Code" := 'KSH';
            end;

            trigger OnPreDataItem()
            var
            begin
                // if ("Purchase Header".Status = "Purchase Header".Status::Open) or ("Purchase Header".Status = "Purchase Header".Status::"Pending Approval") then
                //     Error('You cannot print this report unless the Purchase Order is Released.');
            end;


        }




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
    trigger OnPreReport()
    begin
        CompanyInformation.Get();
        CompanyInformation.CalcFields(Picture);
    end;

    var
        CompanyInformation: Record "Company Information";
        EmailCptnlbl: Label 'Email:';
        TelCptnlbl: Label 'Tel:';
        TruckID: Code[20];
        ORIGINALDOCUMENTCptnlbl: Label 'ORIGINAL DOCUMENT';
        ForLPONoCptnlbl: Label 'LPO No:';
        OrderDateCptnlbl: Label 'Order Date:';
        ReceivedByCptnlbl: Label 'Procurement:';
        ConfirmedByCptnlbl: Label 'Chief Accountant:';
        PostedbyCptnlbl: Label 'General Manager:';
        StoreManagerCptnlbl: Label 'Managing Director:';
        UnitCostCptnlbl: Label 'Unit Cost';
        PrintedOnCptnlbl: Label 'Printed On:';
        PrintedByCptnlbl: Label 'Printed By:';
        Text001: Label 'Below are details of goods to be supplied:';
        SignCptnlbl: Label 'Sign';
        FromCptnlbl: Label 'To:';
        DescriptionCptnlbl: Label 'Description';
        QtyOrderdCptnlbl: Label 'Quantity Order';
        QtyDelivered: Label 'Qty Delivered';
        DateReceivedCptnlbl: Label 'Date Received';
        BalanceCptnlbl: Label 'Balance';
        CustomerRefNoCptnlbl: Label 'Vendor Ref No:';
        GOODSRECEIVEDNOTECptnlbl: Label 'Purchase Order';
        VatAmount: Decimal;
        TotalCptnlbl: Label 'Total';
        SubtotalCptnlbl: Label 'Sub Total';
        VatCptnlbl: Label 'VAT';
}
