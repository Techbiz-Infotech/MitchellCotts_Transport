report 50124 "Purchase Invoice Utl"
{
    Caption = 'Purchase Invoice Utl';
    ApplicationArea = all;
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Reports/layout/Purchase Invoice Utl Report.rdlc';
    dataset
    {
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.", "Buy-from Vendor No.";
            RequestFilterHeading = 'Goods Received';
            column(CompanyInformation; CompanyInformation.Picture) { }
            column(CompanyInformation_Name; CompanyInformation.Name) { }
            column(CompanyInformation_Address; CompanyInformation.Address) { }
            column(CompanyInformation_Address2; CompanyInformation."Address 2") { }
            column(CompanyInformation_Postcode; CompanyInformation."Post Code") { }
            column(EmailCptnlbl; EmailCptnlbl) { }
            column(CompanyInformation_Email; CompanyInformation."E-Mail") { }
            column(TelCptnlbl; TelCptnlbl) { }
            column(CompanyInformation_Phone; CompanyInformation."Phone No.") { }
            column(InvoiceDateCptnlbl; InvoiceDateCptnlbl) { }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name") { }
            column(No_; "No.") { }
            column(Order_Date; "Order Date") { }
            column(ORIGINALDOCUMENTCptnlbl; ORIGINALDOCUMENTCptnlbl) { }
            column(PurchaseInvoiceCptnlbl; PurchaseInvoiceCptnlbl) { }
            column(InvoiceNoCptnlbl; InvoiceNoCptnlbl) { }
            column(Text001; Text001) { }
            column(ReceivedByCptnlbl; ReceivedByCptnlbl) { }
            column(VendorReferenceNoCptnlbl; VendorReferenceNoCptnlbl) { }
            column(Vendor_Invoice_No_; "Vendor Invoice No.") { }
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
            column(VatAmountcaplbl; VatAmountcaplbl) { }
            column(VatAmount; VatAmount) { }
            column(Amount_Including_VAT; "Amount Including VAT") { }
            column(SubTotalcaplbl; SubTotalcaplbl) { }

            dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemLinkReference = "Purch. Inv. Header";
                DataItemTableView = SORTING("Document No.", "Line No.") where(Type = filter(Item));
                column(No_Purchaseline; "No.") { }
                column(DescriptionCptnlbl; DescriptionCptnlbl) { }
                column(Description_Purchaseline; Description) { }
                column(QtyOrderdCptnlbl; QtyOrderdCptnlbl) { }
                column(Quantity_Purchaseline; Quantity) { }
                column(DateReceivedCptnlbl; DateReceivedCptnlbl) { }
                column(BalanceCptnlbl; BalanceCptnlbl) { }
                column(CustomerRefNoCptnlbl; CustomerRefNoCptnlbl) { }
                column(UnitCostCptnlbl; UnitCostCptnlbl) { }
                column(Unit_Cost; "Unit Cost") { }
                column(Line_Amount; "Line Amount") { }
                column(TotalCptnlbl; TotalCptnlbl) { }
                column(VATPercentageLbl; VATPercentageLbl) { }
                column(VAT__; "VAT %") { }
                column(linevatamount; linevatamount) { }
                column(CurrencyCode; CurrCode)
                {
                }
                trigger OnAfterGetRecord()
                begin
                    if linevatamount <> "Purch. Inv. Line"."Amount Including VAT" then
                        linevatamount := ("Purch. Inv. Line"."Amount Including VAT" - "Line Amount")
                    else
                        linevatamount := 0;
                end;
            }
            trigger OnAfterGetRecord()
            begin
                if Amount <> "Amount Including VAT" then
                    VatAmount := ("Amount Including VAT" - Amount)
                else
                    VatAmount := 0;
                if "Currency Code" <> '' then begin
                    CurrCode := "Currency Code";

                end else begin
                    if GeneralLedgerSetup.Get() then begin
                        CurrCode := GeneralLedgerSetup."LCY Code";
                    end;
                end;
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
        GeneralLedgerSetup: Record "General Ledger Setup";
        CompanyInformation: Record "Company Information";
        EmailCptnlbl: Label 'Email:';
        UnitCostCptnlbl: Label 'Unit Cost';
        TelCptnlbl: Label 'Tel:';
        ORIGINALDOCUMENTCptnlbl: Label 'ORIGINAL DOCUMENT';
        InvoiceNoCptnlbl: Label 'Invoice No:';
        linevatamount: Decimal;
        VATPercentageLbl: Label 'VAT %';
        CurrCode: Text[10];
        InvoiceDateCptnlbl: Label 'Invoice Date:';
        VendorReferenceNoCptnlbl: Label 'Vendor Reference No:';
        ReceivedByCptnlbl: Label 'Account Payable:';
        ConfirmedByCptnlbl: Label 'Chief Accountant:';
        PostedbyCptnlbl: Label 'Genernal Manager:';
        StoreManagerCptnlbl: Label 'Internal Audit:';
        PrintedOnCptnlbl: Label 'Printed On:';
        PrintedByCptnlbl: Label 'Printed By:';
        Text001: Label 'Below are details of goods supplied:';
        SignCptnlbl: Label 'Sign';
        SubTotalcaplbl: Label 'SubTotal';
        FromCptnlbl: Label 'From:';
        DescriptionCptnlbl: Label 'Description';
        QtyOrderdCptnlbl: Label 'Quantity Received';
        QtyDelivered: Label 'Qty Delivered';
        DateReceivedCptnlbl: Label 'Date Received';
        BalanceCptnlbl: Label 'Balance';
        CustomerRefNoCptnlbl: Label 'Customer Ref No';
        PurchaseInvoiceCptnlbl: Label 'Purchase Invoice';
        TotalCptnlbl: Label 'Total';
        VatAmount: Decimal;
        VatAmountcaplbl: Label ' VatAmount';

}
