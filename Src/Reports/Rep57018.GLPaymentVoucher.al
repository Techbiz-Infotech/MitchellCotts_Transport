report 57018 "GL Payment Voucher"
{
    Caption = 'GL Payment Voucher';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Reports/layout/GL Payment Voucher.rdlc';
    dataset
    {
        dataitem("G/L Entry"; "G/L Entry")
        {
            DataItemTableView = sorting("Document No.");
            RequestFilterFields = "Entry No.", "Document No.";
            column(CompanyInformation; CompanyInformation.Picture) { }
            column(CompanyInformation_Name; CompanyInformation.Name) { }
            column(CompanyInformation_Address; CompanyInformation.Address) { }
            column(CompanyInformation_Address2; CompanyInformation."Address 2") { }
            column(CompanyInformation_Postcode; CompanyInformation."Post Code") { }
            column(PINTINNoCptnlbl; PINTINNoCptnlbl) { }
            column(CompanyInformation_VATRegistrationNo; CompanyInformation."VAT Registration No.") { }
            column(EmailCptnlbl; EmailCptnlbl) { }
            column(CompanyInformation_Email; CompanyInformation."E-Mail") { }
            column(TelCptnlbl; TelCptnlbl) { }
            column(CompanyInformation_Phone; CompanyInformation."Phone No.") { }
            column(Title; Title) { }
            column(VoucherRefcptnlb; VoucherRefcptnlb) { }
            column(Entry_No_; "Entry No.") { }
            column(Document_No_; "Document No.") { }
            column(DateCptnlbl; DateCptnlbl) { }
            column(Posting_Date; "Posting Date") { }
            column(PaymentRefCptnlbl; PaymentRefCptnlbl) { }
            column(External_Document_No_; "External Document No.") { }
            column(Date; Date) { }
            column(PayeeCptnlbl; PayeeCptnlbl) { }
            column(BankCptnlbl; BankCptnlbl) { }
            column(G_L_Account_Name; "G/L Account Name") { }
            column(DateCptinlbl; DateCptinlbl) { }
            column(Description; Description) { }
            column(Amount; Amount) { }
            column(ExchangeRateCptnlbl; ExchangeRateCptnlbl) { }
            column(Exchange_Rate_Amount; ExchangeCurrCode."Exchange Rate Amount") { }
            column(RemarksCptn; RemarksCptn) { }
            column(Comment; Comment) { }
            column(PreparedBy; PreparedBy) { }
            column(CheckedBy; CheckedBy) { }
            column(ApprovedByCptnlbl; ApprovedByCptnlbl) { }
            column(AuthorizedByCptnlbl; AuthorizedByCptnlbl) { }
        }
    }
    trigger OnInitReport()
    begin
        CompanyInformation.Get();
        CompanyInformation.CalcFields(Picture)
    end;

    var
        CompanyInformation: Record "Company Information";
        Date: Date;
        EmailCptnlbl: Label 'Email:';
        TelCptnlbl: Label 'Tel:';
        VoucherRefcptnlb: Label 'Voucher Ref';
        DateCptnlbl: Label 'Date';
        PaymentRefCptnlbl: Label 'Payment Ref:';
        PayeeCptnlbl: Label 'Payee:';
        BankCptnlbl: Label 'Bank:';
        RemarksCptn: Label 'Remarks';
        PreparedBy: Label 'Prepared By';
        CheckedBy: Label 'Checked By';
        ApprovedByCptnlbl: Label 'Approved By';
        AuthorizedByCptnlbl: Label 'Authorized By';
        Title: Label 'Payment Voucher';
        PINTINNoCptnlbl: Label 'PIN/TIN No:';
        ExchangeRateCptnlbl: Label 'Exchange Rate';
        DateCptinlbl: Label 'Date:';
        ExchangeCurrCode: Record "Currency Exchange Rate";
}

