report 50115 "Sales Order Utl"
{
    Caption = 'UTL-Sales Order';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Reports/layout/Sales Order Utl.rdlc';
    dataset
    {
        dataitem(Header; "Sales Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
            //RequestFilterHeading = 'Posted Sales Invoice';
            column(CompanyInformation; CompanyInformation.Picture) { }
            column(CompanyInformation_Name; CompanyInformation.Name) { }
            column(CompanyInformation_Address; CompanyInformation.Address) { }
            column(CompanyInformation_Address2; CompanyInformation."Address 2") { }
            column(CompanyInformation_Postcode; CompanyInformation."Post Code") { }
            column(CompanyInformation_VATRegistrationNo; CompanyInformation."VAT Registration No.") { }
            column(EmailCptnlbl; EmailCptnlbl) { }
            column(CompanyInformation_Email; CompanyInformation."E-Mail") { }
            column(TelCptnlbl; TelCptnlbl) { }
            column(CompanyInformation_Phone; CompanyInformation."Phone No.") { }
            column(InvoiceToCptnlbl; InvoiceToCptnlbl) { }
            column(PINCptnlbl; PINCptnlbl) { }
            column(AccountCptnlbl; AccountCptnlbl) { }
            column(Bill_to_Name; "Bill-to Name") { }
            column(Bill_to_Address; "Bill-to Address") { }
            column(Bill_to_Address_2; "Bill-to Address 2") { }
            column(Bill_to_City; "Bill-to City") { }
            column(Bill_to_Country_Region_Code; "Bill-to Country/Region Code") { }
            column(Bill_to_County; "Bill-to County") { }
            column(Ship_to_Name; "Ship-to Name") { }
            column(Ship_to_Address; "Ship-to Address") { }
            column(Ship_to_Address_2; "Ship-to Address 2") { }
            column(Ship_to_City; "Ship-to City") { }
            column(Ship_to_Country_Region_Code; "Ship-to Country/Region Code") { }
            column(Ship_to_County; "Ship-to County") { }
            column(No_SalesInvoiceHeader; "No.") { }
            column(Sell_to_Customer_Name_SalesInvoiceHeader; "Sell-to Customer Name") { }
            column(Datecptnlbl; Datecptnlbl) { }
            column(Posting_Date; "Posting Date") { }
            column(NumberCptnlbl; NumberCptnlbl) { }
            column(PINTINNoCptnlbl; PINTINNoCptnlbl) { }
            column(VAT_Registration_No_; "VAT Registration No.") { }
            column(DueDateCptnlbl; DueDateCptnlbl) { }
            column(Due_Date; "Due Date") { }
            column(NoText; NoText[1] + NoText[2]) { }
            column(Amountinwordscptnlbl; Amountinwordscptnlbl) { }
            column(SalesHeaderNo_; "No.") { }
            column(SubTotalcaplbl; SubTotalcaplbl) { }
            column(Amount; Amount) { }
            column(VatAmountcaplbl; VatAmountcaplbl) { }
            column(VatAmount; VatAmount) { }
            column(Amount_Including_VAT; "Amount Including VAT") { }

            column(TotalAmountcaplbl; TotalAmountcaplbl) { }
            column(TotalAmount; TotalAmount) { }
            column(Title; Title) { }
            column(Currency_Code; "Currency Code") { }
            column(Subtotal_Lbl; SubtotalLbl)
            {
            }
            column(Total_Lbl; TotalLbl)
            {
            }
            column(VATAmount_Lbl; VATAmtLbl)
            {
            }

            dataitem(Line; "Sales Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemLinkReference = Header;
                DataItemTableView = sorting("Document No.", "Line No.");
                column(No_SalesInvoiceLine; "No.") { }
                column(Description_SalesInvoiceLine; Description) { }
                column(HSCode; HSCode) { }
                column(VAT__; "VAT %") { }
                column(Quantity; Quantity) { }
                column(VAT_Base_Amount; "VAT Base Amount") { }
                column(Amount_SalesInvoiceLine; Amount) { }
                column(Gross_Weight; "Gross Weight") { }
                column(Net_Weight; "Net Weight") { }
                column(ROECptnlbl; ROECptnlbl) { }
                column(EOECptnlbl; EOECptnlbl) { }
                column(CreatedByCptnlbl; CreatedByCptnlbl) { }
                column(TotalInvoiceCptnlbl; TotalInvoiceCptnlbl) { }
                column(Text000; Text000) { }
                column(Grosscptnlbl; Grosscptnlbl) { }
                column(NetCptnlbl; NetCptnlbl) { }
                column(VATCptnlbl; VATCptnlbl) { }
                column(SubTotalCptnlbl; SubTotalCptnlbl) { }
                column(TotalSubTotal_1; TotalSubTotal) { }
                column(TotalWeight; TotalWeight) { }
                column(linevatamount; linevatamount) { }
                column(AmountExcludingVAT_Line; Amount)
                {

                }
                column(AmountExcludingVAT_Line_Lbl; FieldCaption(Amount))
                {
                }
                column(AmountIncludingVAT_Line; "Amount Including VAT")
                {

                }
                column(AmountIncludingVAT_Line_Lbl; FieldCaption("Amount Including VAT"))
                {

                }
                trigger OnAfterGetRecord()
                begin
                    if linevatamount <> line."Amount Including VAT" then
                        linevatamount := (line."Amount Including VAT" - "Line Amount")
                    else
                        linevatamount := 0;
                    TotalAmountInclVAT += "Amount Including VAT";
                    Fixedlenths := 0;
                end;
            }

            dataitem(LineFee; "Integer")
            {
                DataItemTableView = SORTING(Number) ORDER(Ascending) WHERE(Number = FILTER(1 ..));
                column(LineFeeCaptionText; TempLineFeeNoteOnReportHist.ReportText)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    if not DisplayAdditionalFeeNote then
                        CurrReport.Break();

                    if Number = 1 then begin
                        if not TempLineFeeNoteOnReportHist.FindSet() then
                            CurrReport.Break()
                    end else
                        if TempLineFeeNoteOnReportHist.Next() = 0 then
                            CurrReport.Break();
                end;
            }

            dataitem(LetterText; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                column(GreetingText; GreetingLbl)
                {
                }
                column(BodyText; BodyLbl)
                {
                }
                column(ClosingText; ClosingLbl)
                {
                }
                column(PmtDiscText; PmtDiscText)
                {
                }
            }
            dataitem(Totals; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                column(TotalNetAmount; Format(TotalAmount, 0, AutoFormat.ResolveAutoFormat("Auto Format"::AmountFormat, Header."Currency Code")))
                {
                }
                column(TotalVATBaseLCY; TotalVATBaseLCY)
                {
                }
                column(TotalAmountIncludingVAT; Format(TotalAmountInclVAT, 0, AutoFormat.ResolveAutoFormat("Auto Format"::AmountFormat, Header."Currency Code")))
                {
                }
                column(TotalVATAmount; Format(TotalAmountVAT, 0, AutoFormat.ResolveAutoFormat("Auto Format"::AmountFormat, Header."Currency Code")))
                {
                }
                column(TotalVATAmountLCY; TotalVATAmountLCY)
                {
                }
                column(TotalInvoiceDiscountAmount; Format(TotalInvDiscAmount, 0, AutoFormat.ResolveAutoFormat("Auto Format"::AmountFormat, Header."Currency Code")))
                {
                }
                column(TotalPaymentDiscountOnVAT; TotalPaymentDiscOnVAT)
                {
                }
                column(TotalExcludingVATText; TotalExclVATText)
                {
                }
                column(TotalIncludingVATText; TotalInclVATText)
                {
                }
                column(TotalSubTotal; Format(TotalSubTotal, 0, AutoFormat.ResolveAutoFormat("Auto Format"::AmountFormat, Header."Currency Code")))
                {
                }
                column(TotalSubTotalMinusInvoiceDiscount; Format(TotalSubTotal + TotalInvDiscAmount, 0, AutoFormat.ResolveAutoFormat("Auto Format"::AmountFormat, Header."Currency Code")))
                {
                }
                column(TotalText; TotalText)
                {
                }
                column(TotalAmountExclInclVAT; Format(TotalAmountExclInclVATValue, 0, AutoFormat.ResolveAutoFormat("Auto Format"::AmountFormat, Header."Currency Code")))
                {
                }
                column(TotalAmountExclInclVATText; TotalAmountExclInclVATTextValue)
                {
                }
                column(TotalVATBaseOnVATAmtLine; TotalVATBaseOnVATAmtLine)
                {
                }
                column(TotalVATAmountOnVATAmtLine; TotalVATAmountOnVATAmtLine)
                {
                }
                column(CurrencyCode; CurrCode)
                {
                }
                column(CurrencySymbol; CurrSymbol)
                {
                }

                trigger OnPreDataItem()
                begin
                    if Header."Prices Including VAT" then begin
                        TotalAmountExclInclVATTextValue := TotalExclVATText;
                        TotalAmountExclInclVATValue := TotalAmount;
                    end else begin
                        TotalAmountExclInclVATTextValue := TotalInclVATText;
                        TotalAmountExclInclVATValue := TotalAmountInclVAT;
                    end;
                end;
            }

            trigger OnAfterGetRecord()
            var
                CurrencyExchangeRate: Record "Currency Exchange Rate";
                PaymentServiceSetup: Record "Payment Service Setup";
                Currency: Record Currency;
                GeneralLedgerSetup: Record "General Ledger Setup";
            begin
                if Amount <> "Amount Including VAT" then
                    VatAmount := ("Amount Including VAT" - Amount)
                else
                    VatAmount := 0;

                CalcFields("Work Description");
                ShowWorkDescription := "Work Description".HasValue;

                ChecksPayableText := StrSubstNo(ChecksPayableLbl, CompanyInformation.Name);
                FormatDocumentFields(Header);

                if "Currency Code" <> '' then begin
                    CurrencyExchangeRate.FindCurrency("Posting Date", "Currency Code", 1);
                    CalculatedExchRate :=
                      Round(1 / "Currency Factor" * CurrencyExchangeRate."Exchange Rate Amount", 0.000001);
                    ExchangeRateText := StrSubstNo(ExchangeRateTxt, CalculatedExchRate, CurrencyExchangeRate."Exchange Rate Amount");
                    CurrCode := "Currency Code";
                    if Currency.Get("Currency Code") then
                        CurrSymbol := Currency.GetCurrencySymbol();
                end else
                    if GeneralLedgerSetup.Get() then begin
                        CurrCode := GeneralLedgerSetup."LCY Code";
                        CurrSymbol := GeneralLedgerSetup.GetCurrencySymbol();
                    end;
                CalcFields("Amount Including VAT");
                //RemainingAmount := GetRemainingAmount();
                if RemainingAmount = 0 then
                    RemainingAmountTxt := AlreadyPaidLbl
                else
                    if RemainingAmount <> "Amount Including VAT" then
                        RemainingAmountTxt := StrSubstNo(PartiallyPaidLbl, Format(RemainingAmount, 0, '<Precision,2><Standard Format,0>'))
                    else
                        RemainingAmountTxt := '';
                RepCheck.InitTextVariable();
                RepCheck.FormatNoText(NoText, Round(Header."Amount Including VAT", 0.01, '='), Header."Currency Code");

                TotalSubTotal := 0;
                TotalInvDiscAmount := 0;
                TotalAmount := 0;
                TotalAmountVAT := 0;
                TotalAmountInclVAT := 0;
                TotalPaymentDiscOnVAT := 0;
            end;

            trigger OnPreDataItem()
            begin
                FirstLineHasBeenOutput := false
            end;
        }
    }
    trigger OnPreReport()
    begin
        if Header.GetFilters = '' then
            Error(NoFilterSetErr);

        if not CurrReport.UseRequestPage then
            CompanyInformation.Get();
        CompanyInformation.CalcFields(Picture);
    end;

    var
        linevatamount: Decimal;
        OutPutNo: Integer;
        Fixedlenths: Integer;
        Amountcaplbl: Label 'Amount';
        Taxcaplbl: Label 'Tax';
        Subtotal: Decimal;
        SubTotalcaplbl: Label 'SubTotal';
        TotalAmountcaplbl: Label 'TotalAmount';
        VatAmount: Decimal;
        VatAmountcaplbl: Label ' VatAmount';
        GLSetup: Record "General Ledger Setup";
        TempLineFeeNoteOnReportHist: Record "Line Fee Note on Report Hist." temporary;
        FormatAddr: Codeunit "Format Address";
        FormatDocument: Codeunit "Format Document";
        AutoFormat: Codeunit "Auto Format";
        Title: Label 'Proforma Invoice';
        ChecksPayableText: Text;
        TotalText: Text[50];
        RemainingAmountTxt: Text;
        TotalAmountExclInclVATTextValue: Text;
        ShowWorkDescription: Boolean;
        LogInteraction: Boolean;
        TotalAmount: Decimal;
        TotalAmountInclVAT: Decimal;
        TotalAmountVAT: Decimal;
        TotalInvDiscAmount: Decimal;
        TotalPaymentDiscOnVAT: Decimal;
        RemainingAmount: Decimal;
        TransHeaderAmount: Decimal;
        CalculatedExchRate: Decimal;
        PaymentInstructionsTxt: Text;
        ExchangeRateText: Text;
        TotalVATBaseLCY: Decimal;
        TotalVATAmountLCY: Decimal;
        TotalVATBaseOnVATAmtLine: Decimal;
        TotalVATAmountOnVATAmtLine: Decimal;
        PrevLineAmount: Decimal;
        TotalAmountExclInclVATValue: Decimal;
        CurrCode: Text[10];
        CurrSymbol: Text[10];
        TotalWeight: Decimal;
        SubtotalLbl: Label 'Subtotal';
        TotalLbl: Label 'Total';
        VATAmtSpecificationLbl: Label 'VAT Amount Specification';
        VATAmtLbl: Label 'VAT Amount';
        VATAmountLCYLbl: Label 'VAT Amount (LCY)';
        VATBaseLbl: Label 'VAT Base';
        VATBaseLCYLbl: Label 'VAT Base (LCY)';
        VATClausesLbl: Label 'VAT Clause';
        VATIdentifierLbl: Label 'VAT Identifier';
        VATPercentageLbl: Label 'VAT %';
        ExchangeRateTxt: Label 'Exchange rate: %1/%2', Comment = '%1 and %2 are both amounts.';
        NoFilterSetErr: Label 'You must specify one or more filters to avoid accidently printing all documents.';
        GreetingLbl: Label 'Hello';
        ClosingLbl: Label 'Sincerely';
        PmtDiscTxt: Label 'If we receive the payment before %1, you are eligible for a %2% payment discount.', Comment = '%1 Discount Due Date %2 = value of Payment Discount % ';
        BodyLbl: Label 'Thank you for your business. Your invoice is attached to this message.';
        AlreadyPaidLbl: Label 'The invoice has been paid.';
        PartiallyPaidLbl: Label 'The invoice has been partially paid. The remaining amount is %1', Comment = '%1=an amount';
        ChecksPayableLbl: Label 'Please make checks payable to %1', Comment = '%1 = company name';
        VATClauseText: Text;
        FormattedLineAmount: Text;
        FormattedQuantity: Text;
        FormattedUnitPrice: Text;
        FormattedVATPct: Text;
        LineDiscountPctText: Text;
        PmtDiscText: Text;
        TotalExclVATText: Text[50];
        TotalInclVATText: Text[50];
        TotalSubTotal: Decimal;
        VATBaseLCY: Decimal;
        VATAmountLCY: Decimal;
        DisplayAssemblyInformation: Boolean;
        DisplayShipmentInformation: Boolean;
        DisplayAdditionalFeeNote: Boolean;
        FirstLineHasBeenOutput: Boolean;
        ShowShippingAddr: Boolean;
        PaymentTermsDescLbl: Label 'Payment Terms';
        ShptMethodDescLbl: Label 'Shipment Method';
        ShiptoAddrLbl: Label 'Ship-to Address';
        myInt: Integer;
        Currency: Record Currency;
        CompanyInformation: Record "Company Information";
        SaleInvLine: Record "Sales Invoice Line";
        HSCode: Code[20];
        EOECptnlbl: Label 'E&O.E';
        SubTotalCptnlbl: Label 'Sub Total';
        TotalInvoiceCptnlbl: Label 'Total Invoice';
        Text000: Label 'For Unigroup Transporters Limited';
        RepCheck: Report Check;
        NoText: array[2] of Text;
        Notext1: Text[250];
        AmountInWords: Text[250];
        AmountVen: Decimal;
        EmailCptnlbl: Label 'Email:';
        TelCptnlbl: Label 'Tel:';
        InvoiceToCptnlbl: Label 'Invoice To';
        PINCptnlbl: Label 'PIN No.';
        AccountCptnlbl: Label 'Account';
        NumberCptnlbl: Label 'No.';
        DueDateCptnlbl: Label 'Due Date';
        Datecptnlbl: Label 'Date';
        InvoiceCptnlbl: Label 'Proforma Invoice';
        Grosscptnlbl: Label 'Gross';
        ROECptnlbl: Label 'ROE';
        NetCptnlbl: Label 'Net';
        VATCptnlbl: Label 'VAT';
        CreatedByCptnlbl: Label 'Created By:';
        LineDiscAmount: Decimal;
        PINTINNoCptnlbl: Label 'PIN/TIN No:';
        TotalInvoiceLbl: Label 'Total Invoice';
        Amountinwordscptnlbl: Label 'Amount in Words:';

    procedure InitializeRequest(NewLogInteraction: Boolean; DisplayAsmInfo: Boolean)
    begin
        LogInteraction := NewLogInteraction;
        DisplayAssemblyInformation := DisplayAsmInfo;
    end;

    local procedure FormatDocumentFields(SalesHeader: Record "Sales Header")
    begin

        FormatDocument.SetTotalLabels(SalesHeader."Currency Code", TotalText, TotalInclVATText, TotalExclVATText);

    end;

    trigger OnInitReport()
    begin
        CompanyInformation.Get();
        CompanyInformation.CalcFields(Picture)
    end;


}
