report 57017 "Sales Credit Memo"
{
    //ApplicationArea = All;
    Caption = 'UTL-Sales Credit Memo';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Reports/layout/Sales Credit Memo Utl.rdlc';
    dataset
    {
        dataitem(Header; "Sales Cr.Memo Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
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
            column(CreditNoteCptnlbl; CreditNoteCptnlbl) { }
            column(PINCptnlbl; PINCptnlbl) { }
            column(InvoiceToCptnlbl; InvoiceToCptnlbl) { }
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
            column(ReferenceInvoiceCptnlbl; ReferenceInvoiceCptnlbl) { }
            column(Your_Reference; "Your Reference") { }
            column(No_SalescrHeader; "No.") { }
            column(Sell_to_Customer_Name_SalesInvoiceHeader; "Sell-to Customer Name") { }
            column(Datecptnlbl; Datecptnlbl) { }
            column(Posting_Date; "Posting Date") { }
            column(NumberCptnlbl; NumberCptnlbl) { }
            column(PINTINNoCptnlbl; PINTINNoCptnlbl) { }
            column(DueDateCptnlbl; DueDateCptnlbl) { }
            column(Due_Date; "Due Date") { }
            column(NoText; NoText[1] + NoText[2]) { }
            column(InvoiceCptnlbl; InvoiceCptnlbl) { }
            column(Amountinwordscptnlbl; Amountinwordscptnlbl) { }
            column(LocalCurrency_Lbl; LocalCurrencyLbl)
            {
            }
            column(SalescrmemoNo_; "No.") { }
            column(SubTotalcaplbl; SubTotalcaplbl) { }
            column(Amount; Amount) { }
            column(VatAmountcaplbl; VatAmountcaplbl) { }
            column(VatAmount; VatAmount) { }
            column(Amount_Including_VAT; "Amount Including VAT") { }

            column(TotalAmountcaplbl; TotalAmountcaplbl) { }
            column(TotalAmount; TotalAmount) { }
            column(Title; Title) { }
            column(Currency_Code; "Currency Code") { }
            column(CalculatedExchRate; CalculatedExchRate) { }
            column(Subtotal_Lbl; SubtotalLbl)
            {
            }
            column(Total_Lbl; TotalLbl)
            {
            }
            column(VATAmount_Lbl; VATAmtLbl)
            {
            }
            column(PricesIncludingVAT; "Prices Including VAT")
            {
            }
            column(PricesIncludingVAT_Lbl; FieldCaption("Prices Including VAT"))
            {
            }
            column(PricesIncludingVATYesNo; Format("Prices Including VAT"))
            {
            }
            column(OurPinCptnlbl; OurPinCptnlbl) { }
            column(CustomerRefCptnlbl; CustomerRefCptnlbl) { }
            column(KRApinno; KRApinno) { }
            column(PostedBy; GetFullName(Header.SystemCreatedBy)) { }
            column(RelevantCptnlbl; RelevantCptnlbl) { }
            column(CU_Number; "CU Number") { }
            column(CurrencyCode; CurrCode)
            {
            }
            dataitem(Line; "Sales Cr.Memo Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemLinkReference = Header;
                DataItemTableView = sorting("Document No.", "Line No.");
                column(No_SaleCrMemoline; "No.") { }
                column(Description; Description) { }
                column(HSCode; HSCode) { }
                column(VAT__; "VAT %") { }
                column(Quantity; Quantity) { }
                column(VAT_Base_Amount; "VAT Base Amount") { }
                column(Amount_SalesCrmemoLine; Amount) { }
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
                    AutoFormatExpression = GetCurrencyCode();
                    AutoFormatType = 1;
                }
                column(AmountExcludingVAT_Line_Lbl; FieldCaption(Amount))
                {
                }
                column(AmountIncludingVAT_Line; "Amount Including VAT")
                {
                    AutoFormatExpression = GetCurrencyCode();
                    AutoFormatType = 1;
                }
                column(AmountIncludingVAT_Line_Lbl; FieldCaption("Amount Including VAT"))
                {
                    AutoFormatExpression = GetCurrencyCode();
                    AutoFormatType = 1;
                }
                trigger OnAfterGetRecord()
                begin
                    UnigroupSetup.Get();
                    if (Line.Type = Line.Type::Item) or (Line.Type = Line.Type::"G/L Account") then begin
                        IF Line."VAT Prod. Posting Group" = 'EXEMPT' then
                            HSCode := UnigroupSetup."Default HS Code Exempted";
                        IF Line."VAT Prod. Posting Group" = 'ZERO' then
                            HSCode := UnigroupSetup."Default HS Code Zero rated";
                    end;
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
                column(TotalNetAmount; Format(TotalAmount, 0, AutoFormat.ResolveAutoFormat("Auto Format"::DefaultFormat, Header."Currency Code")))
                {
                }
                column(TotalVATBaseLCY; TotalVATBaseLCY)
                {
                }
                column(TotalAmountIncludingVAT; Format(TotalAmountInclVAT, 0, AutoFormat.ResolveAutoFormat("Auto Format"::DefaultFormat, Header."Currency Code")))
                {
                }
                column(TotalVATAmount; Format(TotalAmountVAT, 0, AutoFormat.ResolveAutoFormat("Auto Format"::DefaultFormat, Header."Currency Code")))
                {
                }
                column(TotalVATAmountLCY; TotalVATAmountLCY)
                {
                }
                column(TotalInvoiceDiscountAmount; Format(TotalInvDiscAmount, 0, AutoFormat.ResolveAutoFormat("Auto Format"::DefaultFormat, Header."Currency Code")))
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
                column(TotalSubTotal; Format(TotalSubTotal, 0, AutoFormat.ResolveAutoFormat("Auto Format"::DefaultFormat, Header."Currency Code")))
                {
                }
                column(TotalSubTotalMinusInvoiceDiscount; Format(TotalSubTotal + TotalInvDiscAmount, 0, AutoFormat.ResolveAutoFormat("Auto Format"::DefaultFormat, Header."Currency Code")))
                {
                }
                column(TotalText; TotalText)
                {
                }
                column(TotalAmountExclInclVAT; Format(TotalAmountExclInclVATValue, 0, AutoFormat.ResolveAutoFormat("Auto Format"::DefaultFormat, Header."Currency Code")))
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
                Currency: Record Currency;
                GeneralLedgerSetup: Record "General Ledger Setup";
            begin
                if Amount <> "Amount Including VAT" then
                    VatAmount := ("Amount Including VAT" - Amount)
                else
                    VatAmount := 0;
                FormatDocumentFields(Header);
                if not Cust.Get("Bill-to Customer No.") then
                    Clear(Cust);

                if not CompanyBankAccount.Get(Header."Company Bank Account Code") then
                    CompanyBankAccount.CopyBankFieldsFromCompanyInfo(CompanyInfo);

                if Header."Currency Code" <> '' then begin
                    CurrencyExchangeRate.FindCurrency("Posting Date", Header."Currency Code", 1);
                    CalculatedExchRate :=
                      Round(1 / Header."Currency Factor" * CurrencyExchangeRate."Exchange Rate Amount", 0.000001);
                    ExchangeRateText := StrSubstNo(ExchangeRateTxt, CalculatedExchRate, CurrencyExchangeRate."Exchange Rate Amount");
                    CurrCode := Header."Currency Code";
                    if Currency.Get(Header."Currency Code") then
                        CurrSymbol := Currency.GetCurrencySymbol();
                end else
                    if GeneralLedgerSetup.Get() then begin
                        CurrCode := GeneralLedgerSetup."LCY Code";
                        CurrSymbol := GeneralLedgerSetup.GetCurrencySymbol();
                    end;
                TotalSubTotal := 0;
                TotalInvDiscAmount := 0;
                TotalAmount := 0;
                TotalAmountVAT := 0;
                TotalAmountInclVAT := 0;
                TotalPaymentDiscOnVAT := 0;
                RepCheck.InitTextVariable();
                RepCheck.FormatNoText(NoText, Round(Header."Amount Including VAT", 0.01, '='), Header."Currency Code");
                if cust.Get(Header."Sell-to Customer No.") then
                    KRApinno := cust."VAT Registration No.";
            end;

            trigger OnPreDataItem()
            begin
                FirstLineHasBeenOutput := false;
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

        CompanyLogoPosition := SalesSetup."Logo Position on Documents";
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
        UnigroupSetup: record "Unigroup Setup";
        linevatamount: Decimal;
        ShipToAdress: Record "Ship-to Address";
        OutPutNo: Integer;
        BusinessNoCaptionlbl: Label 'Business No.:';
        Fixedlenths: Integer;
        SubTotalcaplbl: Label 'SubTotal';
        TotalAmountcaplbl: Label 'TotalAmount';
        VatAmount: Decimal;
        VatAmountcaplbl: Label ' VatAmount';
        GLSetup: Record "General Ledger Setup";
        PaymentMethod: Record "Payment Method";
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        CompanyBankAccount: Record "Bank Account";
        CompanyInfo: Record "Company Information";
        DummyCompanyInfo: Record "Company Information";
        SalesSetup: Record "Sales & Receivables Setup";
        Cust: Record Customer;
        InvoiceCptnlbl: Label 'Invoice';
        RespCenter: Record "Responsibility Center";
        VATClause: Record "VAT Clause";
        TempLineFeeNoteOnReportHist: Record "Line Fee Note on Report Hist." temporary;
        FormatAddr: Codeunit "Format Address";
        RelevantCptnlbl: label 'Invoice CU No:';
        FormatDocument: Codeunit "Format Document";
        SegManagement: Codeunit SegManagement;
        AutoFormat: Codeunit "Auto Format";
        WorkDescriptionInstream: InStream;
        Title: Label 'CREDIT NOTE';
        CustomerRefCptnlbl: Label 'Customer Pin';
        WorkDescriptionLine: Text;
        ReferenceInvoiceCptnlbl: Label 'Reference Invoice';
        ChecksPayableText: Text;
        CompanyAddr: array[8] of Text[100];
        SalesPersonText: Text[50];
        TotalText: Text[50];
        RemainingAmountTxt: Text;
        TotalAmountExclInclVATTextValue: Text;
        MoreLines: Boolean;
        ShowWorkDescription: Boolean;
        LogInteraction: Boolean;
        TotalAmount: Decimal;
        TotalAmountInclVAT: Decimal;
        TotalAmountVAT: Decimal;
        TotalInvDiscAmount: Decimal;
        TotalPaymentDiscOnVAT: Decimal;
        RemainingAmount: Decimal;
        TransHeaderAmount: Decimal;
        LogInteractionEnable: Boolean;
        CompanyLogoPosition: Integer;
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
        SalespersonLbl: Label 'Salesperson';
        CompanyInfoBankAccNoLbl: Label 'Account No.';
        CompanyInfoBankNameLbl: Label 'Bank';
        CompanyInfoGiroNoLbl: Label 'Giro No.';
        CompanyInfoPhoneNoLbl: Label 'Phone No.';
        CopyLbl: Label 'Copy';
        EMailLbl: Label 'Email';
        HomePageLbl: Label 'Home Page';
        InvDiscBaseAmtLbl: Label 'Invoice Discount Base Amount';
        InvDiscountAmtLbl: Label 'Invoice Discount';
        InvNoLbl: Label 'Invoice No.';
        LineAmtAfterInvDiscLbl: Label 'Payment Discount on VAT';
        LocalCurrencyLbl: Label 'Local Currency';
        CompanyInfoPhoneNoCaptionLbl: Label 'Phone No.';
        PageLbl: Label 'Page';
        ShipmentLbl: Label 'Shipment';
        SubtotalLbl: Label 'Subtotal';
        TotalLbl: Label 'Total';
        VATAmtSpecificationLbl: Label 'VAT Amount Specification';
        VATAmtLbl: Label 'VAT Amount';
        ExchangeRateTxt: Label 'Exchange rate: %1/%2', Comment = '%1 and %2 are both amounts.';
        NoFilterSetErr: Label 'You must specify one or more filters to avoid accidently printing all documents.';
        GreetingLbl: Label 'Hello';
        ClosingLbl: Label 'Sincerely';
        PmtDiscTxt: Label 'If we receive the payment before %1, you are eligible for a %2% payment discount.', Comment = '%1 Discount Due Date %2 = value of Payment Discount % ';
        BodyLbl: Label 'Thank you for your business. Your invoice is attached to this message.';

    protected var
        ShipmentMethod: Record "Shipment Method";
        PaymentTerms: Record "Payment Terms";
        CustAddr: array[8] of Text[100];
        // ShipToAddr: array[8] of Text[100];
        PmtDiscText: Text;
        KRApinno: Text[20];
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
        HSCode: Code[20];
        EOECptnlbl: Label 'E&O.E';
        OurPinCptnlbl: Label 'Our Pin';
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
        PINCptnlbl: Label 'PIN No';
        AccountCptnlbl: Label 'Account';
        NumberCptnlbl: Label 'No.';
        DueDateCptnlbl: Label 'Due Date';
        Datecptnlbl: Label 'Date';
        CreditNoteCptnlbl: Label 'CREDIT NOTE';
        Grosscptnlbl: Label 'Gross';
        ROECptnlbl: Label 'ROE KES';
        NetCptnlbl: Label 'Net';
        VATCptnlbl: Label 'VAT';
        CreatedByCptnlbl: Label 'Created By:';
        LineDiscAmount: Decimal;
        PINTINNoCptnlbl: Label 'PIN/TIN No:';
        Amountinwordscptnlbl: Label 'Amount in Words:';

    procedure InitializeRequest(NewLogInteraction: Boolean; DisplayAsmInfo: Boolean)
    begin
        LogInteraction := NewLogInteraction;
        DisplayAssemblyInformation := DisplayAsmInfo;
    end;

    local procedure FormatDocumentFields(SalesCrMemoHeader: Record "Sales Cr.Memo Header")
    begin

        FormatDocument.SetTotalLabels(SalesCrMemoHeader."Currency Code", TotalText, TotalInclVATText, TotalExclVATText);
    end;

    trigger OnInitReport()
    begin
        CompanyInformation.Get();
        CompanyInformation.CalcFields(Picture)
    end;
}
