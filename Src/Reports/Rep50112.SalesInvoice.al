report 50112 "Sales Invoice"
{
    Caption = 'Sales Invoice UTL';
    //ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Reports/layout/Sales Invoice Utl.rdlc';
    dataset
    {
        dataitem(Header; "Sales Invoice Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
            RequestFilterHeading = 'Posted Sales Invoice';
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
            column(InvoiceCptnlbl; InvoiceCptnlbl) { }
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
            column(DueDateCptnlbl; DueDateCptnlbl) { }
            column(Due_Date; "Due Date") { }
            column(NoText; NoText[1] + NoText[2]) { }
            column(Amountinwordscptnlbl; Amountinwordscptnlbl) { }
            column(BankAccountName; CompanyInformation."Bank Name")
            { }
            column(LCYAccount1; LCYAccount1)
            {
            }
            column(LCYAccount2; LCYAccount2)
            {
            }
            column(FCYAccount1; FCYAccount1)
            { }
            column(FCYAccount2; FCYAccount2)
            { }
            column(BankBranchNoCptnlblL; BankBranchNoCptnlblL) { }
            column(Bank_Branch_No; CompanyInformation."Bank Branch No.") { }
            column(AccountNoCptnlbl; AccountNoCptnlbl) { }
            column(BankAccountNo; CompanyInformation."Bank Account No.")
            { }
            column(SwiftCode; CompanyInfo."SWIFT Code")
            { }
            column(BranchCode; CompanyInfo."Bank Branch No.")
            { }
            column(BankName; CompanyInfo."Bank Name")
            { }
            column(LineDiscAmount; LineDiscAmount)
            { }
            column(CurrencyCode; CurrCode) { }
            column(LocalCurrency_Lbl; LocalCurrencyLbl)
            {
            }
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
            column(OurPinCptnlbl; OurPinCptnlbl) { }
            column(CustomerRefCptnlbl; CustomerRefCptnlbl) { }
            column(KRApinno; KRApinno) { }
            column(PostedBy; GetFullName(Header.SystemCreatedBy)) { }
            column(RelevantCptnlbl; RelevantCptnlbl) { }
            column(CU_Number; "CU Number") { }
            column(CalculatedExchRate; CalculatedExchRate) { }
            column(CommentText; CommentText) { }
            column(WorkDescriptionCptnlbl; WorkDescriptionCptnlbl) { }
            dataitem(Line; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemLinkReference = Header;
                DataItemTableView = sorting("Document No.", "Line No.");
                column(No_SalesInvoiceLine; "No.") { }
                column(Description_SalesInvoiceLine; LineDescription) { }
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
                    GLSetup.Get();
                    if DimValue.Get(GLSetup."Global Dimension 2 Code", Line."Shortcut Dimension 2 Code") then begin
                        if Line."No." = DimValue."Transport Charge No." then begin
                            if Trip.Get(Line."Shortcut Dimension 3 Code") then
                                LineDescription := 'Transport - ' + Line."Shortcut Dimension 1 Code" + '-' + Trip."Container No." + '-' + Trip."Container No. 2"
                        end else
                            LineDescription := Line.Description;
                    end else
                        LineDescription := Line.Description;
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

                ChecksPayableText := StrSubstNo(ChecksPayableLbl, CompanyInfo.Name);
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
                RemainingAmount := GetRemainingAmount();
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
                if ("Order No." = '') and "Prepayment Invoice" then
                    "Order No." := "Prepayment Order No.";
                if cust.Get(Header."Sell-to Customer No.") then
                    KRApinno := cust."VAT Registration No.";
                Header.CalcFields("Work Description");
                Header."Work Description".CREATEINSTREAM(CommentStream);
                CommentStream.READTEXT(CommentText);
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
        DimValue: Record "Dimension Value";


        Trip: Record Trip;
        Progress: Dialog;
        KRAPINNO: Text[20];
        LineDescription: Text[1000];
        Counter: Integer;
        CustRec: Record Customer;
        ProgressMsg: Label 'Progress from 0 to 100 @1@@@@@';
        linevatamount: Decimal;
        ShipToAdress: Record "Ship-to Address";
        OutPutNo: Integer;
        BusinessNo: Integer;
        RelevantCptnlbl: label 'Invoice CU No:';
        BusinessNoCaptionlbl: Label 'Business No.:';
        Fixedlenths: Integer;
        itemNocaptionlbl: Label 'ItemNo';
        Orderedcaplbl: Label 'Ordered';
        UnitPricecaplbl: Label 'UnitPrice';
        Descriptioncaplbl: Label 'Description';
        Tax: Decimal;
        Amount: Decimal;
        Amountcaplbl: Label 'Amount';
        Taxcaplbl: Label 'Tax';
        BankBranchNoCptnlblL: Label 'Branch No:';
        AccountNoCptnlbl: Label 'Account No:';
        Subtotal: Decimal;
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
        LCYAccount2: Text[100];
        WorkDescriptionCptnlbl: Label 'Work Description:';
        CommentText: Text;
        CommentStream: InStream;
        RespCenter: Record "Responsibility Center";
        VATClause: Record "VAT Clause";
        TempLineFeeNoteOnReportHist: Record "Line Fee Note on Report Hist." temporary;
        FormatAddr: Codeunit "Format Address";
        FormatDocument: Codeunit "Format Document";
        SegManagement: Codeunit SegManagement;
        AutoFormat: Codeunit "Auto Format";
        WorkDescriptionInstream: InStream;
        JobNo: Code[20];
        JobTaskNo: Code[20];
        Title: Label 'Invoice';
        WorkDescriptionLine: Text;
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
        CustomerRefCptnlbl: Label 'Customer Pin';
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
        PaymentMethodDescLbl: Label 'Payment Method';
        PostedShipmentDateLbl: Label 'Shipment Date';
        SalesInvLineDiscLbl: Label 'Discount %';
        SalesInvoiceLbl: Label 'Invoice';
        YourSalesInvoiceLbl: Label 'Your Invoice';
        ShipmentLbl: Label 'Shipment';
        SubtotalLbl: Label 'Subtotal';
        TotalLbl: Label 'Total';
        VATAmtSpecificationLbl: Label 'VAT Amount Specification';
        VATAmtLbl: Label 'VAT Amount';
        VATAmountLCYLbl: Label 'VAT Amount (LCY)';
        VATBaseLbl: Label 'VAT Base';
        OurPinCptnlbl: Label 'Our Pin';
        VATBaseLCYLbl: Label 'VAT Base (LCY)';
        VATClausesLbl: Label 'VAT Clause';
        VATIdentifierLbl: Label 'VAT Identifier';
        VATPercentageLbl: Label 'VAT %';
        SellToContactPhoneNoLbl: Label 'Sell-to Contact Phone No.';
        SellToContactMobilePhoneNoLbl: Label 'Sell-to Contact Mobile Phone No.';
        SellToContactEmailLbl: Label 'Sell-to Contact E-Mail';
        BillToContactPhoneNoLbl: Label 'Bill-to Contact Phone No.';
        BillToContactMobilePhoneNoLbl: Label 'Bill-to Contact Mobile Phone No.';
        BillToContactEmailLbl: Label 'Bill-to Contact E-Mail';
        ExchangeRateTxt: Label 'Exchange rate: %1/%2', Comment = '%1 and %2 are both amounts.';
        NoFilterSetErr: Label 'You must specify one or more filters to avoid accidently printing all documents.';
        GreetingLbl: Label 'Hello';
        ClosingLbl: Label 'Sincerely';
        PmtDiscTxt: Label 'If we receive the payment before %1, you are eligible for a %2% payment discount.', Comment = '%1 Discount Due Date %2 = value of Payment Discount % ';
        BodyLbl: Label 'Thank you for your business. Your invoice is attached to this message.';
        AlreadyPaidLbl: Label 'The invoice has been paid.';
        PartiallyPaidLbl: Label 'The invoice has been partially paid. The remaining amount is %1', Comment = '%1=an amount';
        FromLbl: Label 'From';
        BilledToLbl: Label 'Billed to';
        ChecksPayableLbl: Label 'Please make checks payable to %1', Comment = '%1 = company name';
        JobTaskDescription: Text[100];
        JobTaskDescLbl: Label 'Job Task Description';
        UnitLbl: Label 'Unit';
        VATClausesText: Text;
        UnigroupSetup: record "Unigroup Setup";
        QtyLbl: Label 'Qty', Comment = 'Short form of Quantity';
        PriceLbl: Label 'Price';
        PricePerLbl: Label 'Price per';
        VATClauseText: Text;
        FCYAccount1: Text[100];
        FCYAccount2: Text[100];

    protected var
        ShipmentMethod: Record "Shipment Method";
        PaymentTerms: Record "Payment Terms";
        CustAddr: array[8] of Text[100];
        ShipToAddr: array[8] of Text[100];
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
        LCYAccount1: Text[100];
        AmountInWords: Text[250];
        AmountVen: Decimal;
        EmailCptnlbl: Label 'Email:';
        TelCptnlbl: Label 'Tel:';
        InvoiceToCptnlbl: Label 'Invoice To';
        PINCptnlbl: Label 'PIN No.:';
        AccountCptnlbl: Label 'Account';
        NumberCptnlbl: Label 'No.';
        DueDateCptnlbl: Label 'Due Date';
        Datecptnlbl: Label 'Date';
        InvoiceCptnlbl: Label 'Invoice';
        Grosscptnlbl: Label 'Gross';
        ROECptnlbl: Label 'ROE KES';
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

    local procedure FormatDocumentFields(SalesInvoiceHeader: Record "Sales Invoice Header")
    begin

        FormatDocument.SetTotalLabels(SalesInvoiceHeader."Currency Code", TotalText, TotalInclVATText, TotalExclVATText);

    end;

    trigger OnInitReport()
    begin
        CompanyInformation.Get();
        CompanyInformation.CalcFields(Picture)
    end;
}
