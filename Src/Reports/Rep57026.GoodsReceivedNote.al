report 57026 "Goods Received Note"
{
    Caption = 'Goods Received Note';
    //ApplicationArea = all;
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Reports/layout/Goods Received Note Utl Report.rdlc';
    dataset
    {
        dataitem("Purch. Rcpt. Header"; "Purch. Rcpt. Header")
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
            column(OrderDateCptnlbl; OrderDateCptnlbl) { }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name") { }
            column(GRNCptnlbl; GRNCptnlbl) { }
            column(No_; "No.") { }
            column(ReceiptDateCptnlbl; ReceiptDateCptnlbl) { }
            column(SystemCreatedAt; SystemCreatedAt) { }
            column(Posting_Date; "Posting Date") { }
            column(ORIGINALDOCUMENTCptnlbl; ORIGINALDOCUMENTCptnlbl) { }
            column(GoodsReceivedNoteCptnlbl; GoodsReceivedNoteCptnlbl) { }
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
            column(VendorReferenceNoCptnlbl; VendorReferenceNoCptnlbl) { }
            column(Vendor_Order_No_; "Vendor Order No.") { }
            column(Your_Reference; "Your Reference") { }
            column(PostedBy; GetFullName("Purch. Rcpt. Header".SystemCreatedBy)) { }
            //column(Amount; Amount) { }
            dataitem("Purch. Rcpt. Line"; "Purch. Rcpt. Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemLinkReference = "Purch. Rcpt. Header";
                DataItemTableView = SORTING("Document No.", "Line No.");
                column(No_PurchaseRcptline; "No.") { }
                column(DescriptionCptnlbl; DescriptionCptnlbl) { }
                column(Description_PurchaseRcptline; Description) { }
                column(QtyOrderdCptnlbl; QtyOrderdCptnlbl) { }
                column(Quantity_PurchaseRcptline; Quantity) { }
                column(DateReceivedCptnlbl; DateReceivedCptnlbl) { }
                column(Order_Date; "Order Date") { }
                column(QtyDelivered; QtyDelivered) { }
                column(Quantity_Invoiced; "Quantity Invoiced") { }
                column(BalanceCptnlbl; BalanceCptnlbl) { }
                column(CustomerRefNoCptnlbl; CustomerRefNoCptnlbl) { }
                column(Order_No_; "Order No.") { }


            }

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

    procedure GetFullName(userID: Guid): Text
    var
        UserInfo: Record User;
    begin
        if UserInfo.Get(userID) then begin
            exit(UserInfo."Full Name");
        end
        else begin
            exit('');
        end;
    end;

    var
        CompanyInformation: Record "Company Information";
        EmailCptnlbl: Label 'Email:';
        UnitCostCptnlbl: Label 'Unit Cost';
        TelCptnlbl: Label 'Tel:';
        ORIGINALDOCUMENTCptnlbl: Label 'ORIGINAL DOCUMENT';
        ForLPONoCptnlbl: Label 'LPO No:';
        OrderDateCptnlbl: Label 'Order Date:';
        ReceivedByCptnlbl: Label 'Received By:';
        QtyDeliveredCptnlbl: Label ' Qty Delivered';
        ConfirmedByCptnlbl: Label 'Confirmed By:';
        PostedbyCptnlbl: Label 'Posted by:';
        StoreManagerCptnlbl: Label 'Store Manager:';
        PrintedOnCptnlbl: Label 'Printed On:';
        PrintedByCptnlbl: Label 'Printed By:';
        Text001: Label 'Below are details of goods supplied:';
        SignCptnlbl: Label 'Sign';
        VendorReferenceNoCptnlbl: label 'Vendor Reference No:';
        FromCptnlbl: Label 'From:';
        DescriptionCptnlbl: Label 'Description';
        QtyOrderdCptnlbl: Label 'Quantity Received';
        QtyDelivered: Label 'Qty Received';
        DateReceivedCptnlbl: Label 'Date Received';
        BalanceCptnlbl: Label 'Balance';
        CustomerRefNoCptnlbl: Label 'Vendor Ref No:';
        GoodsReceivedNoteCptnlbl: Label 'GOODS RECEIVED NOTE';
        TotalCptnlbl: Label 'Total';
        GRNCptnlbl: Label 'Receipt No:';
        ReceiptDateCptnlbl: Label 'Receipt Date:';
}
