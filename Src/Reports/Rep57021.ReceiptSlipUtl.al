report 57021 "Receipt Slip Utl"
{
    Caption = 'Receipt Slip Utl';
    //ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Reports/layout/Receipt Slip Utl.rdlc';
    dataset
    {
        dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
        {
            DataItemTableView = SORTING("Document Type", "Customer No.", "Posting Date", "Currency Code") WHERE("Document Type" = FILTER(Payment | Refund));
            RequestFilterFields = "Customer No.", "Posting Date", "Document No.";
            column(EntryNo_CustLedgEntry; "Entry No.")
            {
            }

            dataitem(PageLoop; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                column(CustAddr6; CustAddr[6])
                {
                }
                column(External_Document_No; "Cust. Ledger Entry"."Payment Reference") { }
                column(External_Document_No_; "Cust. Ledger Entry"."External Document No.") { }

                column(CustAddr7; CustAddr[7])
                {
                }
                column(CustAddr8; CustAddr[8])
                {
                }
                column(CustAddr4; CustAddr[4])
                {
                }
                column(CustAddr5; CustAddr[5])
                {
                }
                column(CustAddr3; CustAddr[3])
                {
                }
                column(CustAddr1; CustAddr[1])
                {
                }
                column(CustAddr2; CustAddr[2])
                {
                }
                column(CustomerNo_CustLedgEntry; "Cust. Ledger Entry"."Customer No.")
                {
                    IncludeCaption = true;
                }
                column(DocDate_CustLedgEntry; "Cust. Ledger Entry"."Document Date")
                {
                }
                column(CompanyInformation; CompanyInformation.Picture) { }
                column(CompanyInformation_Name; CompanyInformation.Name) { }
                column(CompanyInformation_Address; CompanyInformation.Address) { }
                column(CompanyInformation_Address2; CompanyInformation."Address 2") { }
                column(CompanyInformation_Postcode; CompanyInformation."Post Code") { }
                column(EmailCptnlbl; EmailCptnlbl) { }
                column(CompanyInformation_Email; CompanyInformation."E-Mail") { }
                column(TelCptnlbl; TelCptnlbl) { }
                column(CompanyInformation_Phone; CompanyInformation."Phone No.") { }
                column(Title; Title) { }
                column(Amount1; "Cust. Ledger Entry".Amount) { }
                column(PaymentRefCptnlbl; PaymentRefCptnlbl) { }
                column(PayeeCptnlbl; PayeeCptnlbl) { }
                column(BankCptnlbl; BankCptnlbl) { }
                column(Documenttypecptnlbl1; Documenttypecptnlbl) { }
                column(PaymentReferencecptnlbl; PaymentReferencecptnlbl) { }
                column(DateCptnlbl; DateCptnlbl) { }

                column(DocumentNo_CustLedgEntry; "Cust. Ledger Entry"."Document No.")
                {
                }
                column(PaymentDiscountTitle; PaymentDiscountTitle)
                {
                }
                column(CompanyAddr1; CompanyAddr[1])
                {
                }
                column(CompanyAddr2; CompanyAddr[2])
                {
                }
                column(CompanyAddr3; CompanyAddr[3])
                {
                }
                column(CompanyAddr4; CompanyAddr[4])
                {
                }

                column(CompanyAddr5; CompanyAddr[5])
                {
                }
                column(CompanyAddr6; CompanyAddr[6])
                {
                }
                column(CompanyAddr7; CompanyAddr[7])
                {
                }
                column(CompanyAddr8; CompanyAddr[8])
                {
                }
                column(CompanyInfoEMail; CompanyInfo."E-Mail")
                {
                }
                column(CompanyInfoPhoneNo; CompanyInfo."Phone No.")
                {
                }
                column(CompanyInfoHomePage; CompanyInfo."Home Page")
                {
                }
                column(CompanyInfoVATRegNo; CompanyInfo."VAT Registration No.")
                {
                }
                column(CompanyInfoGiroNo; CompanyInfo."Giro No.")
                {
                }
                column(CompanyInfoBankName; CompanyInfo."Bank Name")
                {
                }
                column(CompanyInfoBankAccountNo; CompanyInfo."Bank Account No.")
                { }
                column(DateCptinlbl; DateCptinlbl) { }
                column(ReceiptNoCaption; ReceiptNoCaptionLbl)
                {
                }
                column(CompanyInfoVATRegNoCptn; CompanyInfoVATRegNoCptnLbl)
                {
                }
                column(CustLedgEntry1PostDtCptn; CustLedgEntry1PostDtCptnLbl)
                {
                }
                column(ReportTitle; ReportTitle)
                {
                }
                column(AmountCaption; AmountCaptionLbl)
                {
                }
                column(PaymAmtSpecificationCptn; PaymAmtSpecificationCptnLbl)
                {
                }
                column(DocType_CustLedgEntry; "Cust. Ledger Entry"."Document Type")
                {

                }
                column(PmtTolInvCurrCaption; PmtTolInvCurrCaptionLbl)
                {
                }
                column(DocumentDateCaption; DocumentDateCaptionLbl)
                {
                }
                column(Cust_Name; Cust.Name) { }
                column(Cust_Address; Cust.Address) { }
                column(Cust_Address2; Cust."Address 2") { }
                column(Cust_PostCode; Cust."Post Code") { }
                column(AcknowledgementCptnlbl; AcknowledgementCptnlbl) { }
                column(PreparedbyCptnlbl; PreparedbyCptnlbl) { }
                column(CACptnlbl; CACptnlbl) { }
                column(FMCptnlbl; FMCptnlbl) { }
                column(AuthorizationCptnlbl; AuthorizationCptnlbl) { }
                column(InvoiceAmtLbl; InvoiceAmtLbl) { }
                column(SubTotalCptnlbl; SubTotalCptnlbl) { }

                dataitem(DetailedCustLedgEntry1; "Detailed Cust. Ledg. Entry")
                {
                    DataItemLink = "Applied Cust. Ledger Entry No." = FIELD("Entry No.");
                    DataItemLinkReference = "Cust. Ledger Entry";
                    DataItemTableView = SORTING("Applied Cust. Ledger Entry No.", "Entry Type") WHERE(Unapplied = CONST(false));
                    dataitem(CustLedgEntry1; "Cust. Ledger Entry")
                    {
                        DataItemLink = "Entry No." = FIELD("Cust. Ledger Entry No.");
                        DataItemLinkReference = DetailedCustLedgEntry1;
                        DataItemTableView = SORTING("Entry No.");
                        column(PostDate_CustLedgEntry1; Format("Posting Date"))
                        {
                        }
                        column(DocType_CustLedgEntry1; "Document Type")
                        {
                            // IncludeCaption = true;
                        }
                        column(DocumentNo_CustLedgEntry1; "Document No.")
                        {
                            IncludeCaption = true;
                        }
                        column(Desc_CustLedgEntry1; Description)
                        {
                            IncludeCaption = true;
                        }
                        column(CurrCode_CustLedgEntry1; CurrencyCode("Currency Code"))
                        {
                        }
                        column(ShowAmount; ShowAmount)
                        {
                        }
                        column(Documenttypecptnlbl; Documenttypecptnlbl) { }
                        column(External_Document_No_1; "External Document No.") { }
                        column(PaymentAdjCurrencyCptnlbl; PaymentAdjCurrencyCptnlbl) { }
                        column(OurReferenceCptnlbl; OurReferenceCptnlbl) { }
                        column(PartyRefCptnlbl; PartyRefCptnlbl) { }
                        column(InvoiceAmountCptnlbl; InvoiceAmountCptnlbl) { }
                        column(PaidAdjYTDCptnlbl; PaidAdjYTDCptnlbl) { }
                        column(BalanceCptnlbl; BalanceCptnlbl) { }
                        column(PaymentCptnlbl1; PaymentCptnlbl) { }

                        column(TaxCptnlbl; TaxCptnlbl) { }
                        column(NetPaymentCptnlbl; NetPaymentCptnlbl) { }
                        column(PmtDiscInvCurr; PmtDiscInvCurr)
                        {
                        }
                        column(PmtTolInvCurr; PmtTolInvCurr)
                        {
                        }
                        column(CurrencyCaption; FieldCaption("Currency Code"))
                        {
                        }
                        column(Remaining_Amount; "Remaining Amount") { }
                        column(Amount; Amount) { }

                        trigger OnAfterGetRecord()
                        begin
                            if "Entry No." = "Cust. Ledger Entry"."Entry No." then
                                CurrReport.Skip();

                            PmtDiscInvCurr := 0;
                            PmtTolInvCurr := 0;
                            PmtDiscPmtCurr := 0;
                            PmtTolPmtCurr := 0;

                            ShowAmount := -DetailedCustLedgEntry1.Amount;

                            if "Cust. Ledger Entry"."Currency Code" <> "Currency Code" then begin
                                PmtDiscInvCurr := Round("Pmt. Disc. Given (LCY)" * "Original Currency Factor");
                                PmtTolInvCurr := Round("Pmt. Tolerance (LCY)" * "Original Currency Factor");
                                AppliedAmount :=
                                  Round(
                                    -DetailedCustLedgEntry1.Amount / "Original Currency Factor" *
                                    "Cust. Ledger Entry"."Original Currency Factor", Currency."Amount Rounding Precision");
                            end else begin
                                PmtDiscInvCurr := Round("Pmt. Disc. Given (LCY)" * "Cust. Ledger Entry"."Original Currency Factor");
                                PmtTolInvCurr := Round("Pmt. Tolerance (LCY)" * "Cust. Ledger Entry"."Original Currency Factor");
                                AppliedAmount := -DetailedCustLedgEntry1.Amount;
                            end;

                            PmtDiscPmtCurr := Round("Pmt. Disc. Given (LCY)" * "Cust. Ledger Entry"."Original Currency Factor");
                            PmtTolPmtCurr := Round("Pmt. Tolerance (LCY)" * "Cust. Ledger Entry"."Original Currency Factor");

                            RemainingAmount := (RemainingAmount - AppliedAmount) + PmtDiscPmtCurr + PmtTolPmtCurr;
                        end;
                    }
                }
                dataitem(DetailedCustLedgEntry2; "Detailed Cust. Ledg. Entry")
                {
                    DataItemLink = "Cust. Ledger Entry No." = FIELD("Entry No.");
                    DataItemLinkReference = "Cust. Ledger Entry";
                    DataItemTableView = SORTING("Cust. Ledger Entry No.", "Entry Type", "Posting Date") WHERE(Unapplied = CONST(false));
                    dataitem(CustLedgEntry2; "Cust. Ledger Entry")
                    {
                        DataItemLink = "Entry No." = FIELD("Applied Cust. Ledger Entry No.");
                        DataItemLinkReference = DetailedCustLedgEntry2;
                        DataItemTableView = SORTING("Entry No.");
                        column(AppliedAmount; AppliedAmount)
                        {
                        }
                        column(Desc_CustLedgEntry2; Description)
                        {
                        }
                        column(DocumentNo_CustLedgEntry2; "Document No.")
                        {
                        }
                        column(DocType_CustLedgEntry2; "Document Type")
                        {
                        }
                        column(PostDate_CustLedgEntry2; Format("Posting Date"))
                        {
                        }
                        column(PmtDiscInvCurr1; PmtDiscInvCurr)
                        {
                        }
                        column(PmtTolInvCurr1; PmtTolInvCurr)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if "Entry No." = "Cust. Ledger Entry"."Entry No." then
                                CurrReport.Skip();

                            PmtDiscInvCurr := 0;
                            PmtTolInvCurr := 0;
                            PmtDiscPmtCurr := 0;
                            PmtTolPmtCurr := 0;

                            ShowAmount := DetailedCustLedgEntry2.Amount;

                            if "Cust. Ledger Entry"."Currency Code" <> "Currency Code" then begin
                                PmtDiscInvCurr := Round("Pmt. Disc. Given (LCY)" * "Original Currency Factor");
                                PmtTolInvCurr := Round("Pmt. Tolerance (LCY)" * "Original Currency Factor");
                            end else begin
                                PmtDiscInvCurr := Round("Pmt. Disc. Given (LCY)" * "Cust. Ledger Entry"."Original Currency Factor");
                                PmtTolInvCurr := Round("Pmt. Tolerance (LCY)" * "Cust. Ledger Entry"."Original Currency Factor");
                            end;

                            PmtDiscPmtCurr := Round("Pmt. Disc. Given (LCY)" * "Cust. Ledger Entry"."Original Currency Factor");
                            PmtTolPmtCurr := Round("Pmt. Tolerance (LCY)" * "Cust. Ledger Entry"."Original Currency Factor");

                            AppliedAmount := DetailedCustLedgEntry2.Amount;
                            RemainingAmount := (RemainingAmount - AppliedAmount) + PmtDiscPmtCurr + PmtTolPmtCurr;
                        end;
                    }
                }
                dataitem(Total; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    column(RemainingAmount; RemainingAmount)
                    {
                    }
                    column(CurrCode_CustLedgEntry; CurrencyCode("Cust. Ledger Entry"."Currency Code"))
                    {
                    }
                    column(PaymentCptnlbl; PaymentCptnlbl) { }
                    column(CuurencyCodeCptnLbl; CuurencyCodeCptnLbl) { }
                    column(OriginalAmt_CustLedgEntry; "Cust. Ledger Entry"."Original Amount")
                    {
                    }
                    column(ExtDocNo_CustLedgEntry; "Cust. Ledger Entry"."External Document No.")
                    {
                    }
                    column(PaymAmtNotAllocatedCptn; PaymAmtNotAllocatedCptnLbl)
                    {
                    }
                    column(CustLedgEntryOrgAmtCptn; CustLedgEntryOrgAmtCptnLbl)
                    {
                    }
                    column(ExternalDocumentNoCaption; ExternalDocumentNoCaptionLbl)
                    {
                    }
                }
            }

            trigger OnAfterGetRecord()
            begin
                Cust.Get("Customer No.");
                FormatAddr.Customer(CustAddr, Cust);

                if not Currency.Get("Currency Code") then
                    Currency.InitRoundingPrecision();

                if "Document Type" = "Document Type"::Payment then begin
                    ReportTitle := Text003;
                    PaymentDiscountTitle := Text006;
                end else begin
                    ReportTitle := Text004;
                    PaymentDiscountTitle := Text007;
                end;

                CalcFields("Original Amount");
                RemainingAmount := -"Original Amount";
            end;

            trigger OnPreDataItem()
            begin
                CompanyInfo.Get();
                FormatAddr.Company(CompanyAddr, CompanyInfo);
                GLSetup.Get();
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
        CurrencyCodeCaption = 'Currency';
        DocType_CustLedgEntry1Caption = 'Doc Type';
    }
    trigger OnInitReport()
    begin
        CompanyInformation.Get();
        CompanyInformation.CalcFields(Picture)
    end;

    var
        GLSetup: Record "General Ledger Setup";
        Cust: Record Customer;
        EmailCptnlbl: Label 'Email:';
        TelCptnlbl: Label 'Tel:';
        DateCptnlbl: Label 'Date';
        OurReferenceCptnlbl: Label 'Our Reference';
        NegShowAmountCustLedgEntry1: Decimal;
        PartyRefCptnlbl: Label 'Party Ref';
        InvoiceAmountCptnlbl: Label 'Invoice Amount';
        PaidAdjYTDCptnlbl: Label 'Paid/Adj YTD';
        BalanceCptnlbl: Label 'Balance';
        Documenttypecptnlbl: Label 'Document Type';
        PaymentAdjCurrencyCptnlbl: Label 'Payment/AdjCurrency';
        DateCptinlbl: Label 'Date:';
        CuurencyCodeCptnLbl: label 'Currency Code';
        PaymentCptnlbl: Label 'Payment';
        SubTotalCptnlbl: Label 'Sub Total';
        TaxCptnlbl: Label 'Tax';

        NetPaymentCptnlbl: Label 'Net Payment';
        PaymentRefCptnlbl: Label 'Payment Ref:';
        PayeeCptnlbl: Label 'Payee:';
        BankCptnlbl: Label 'Bank:';
        PaymentReferencecptnlbl: Label 'Document No.';
        AcknowledgementCptnlbl: Label 'Acknowledgement';
        PreparedbyCptnlbl: Label 'Prepared by';
        CACptnlbl: Label 'Checked By';
        FMCptnlbl: Label 'Approved By';
        AuthorizationCptnlbl: Label 'Authorized By';
        Currency: Record Currency;
        CompanyInformation: Record "Company Information";
        FormatAddr: Codeunit "Format Address";
        ReportTitle: Text[30];
        PaymentDiscountTitle: Text[30];
        CompanyAddr: array[8] of Text[100];
        CustAddr: array[8] of Text[100];
        RemainingAmount: Decimal;
        AppliedAmount: Decimal;
        PmtDiscInvCurr: Decimal;
        PmtTolInvCurr: Decimal;
        PmtDiscPmtCurr: Decimal;
        Text003: Label 'Payment Receipt';
        Text004: Label 'Payment Voucher';
        Text006: Label 'Pmt. Disc. Given';
        Text007: Label 'Pmt. Disc. Rcvd.';
        PmtTolPmtCurr: Decimal;
        ShowAmount: Decimal;
        CompanyInfoPhoneNoCaptionLbl: Label 'Phone No.';
        CompanyInfoGiroNoCaptionLbl: Label 'Giro No.';
        CompanyInfoBankNameCptnLbl: Label 'Bank';
        CompanyInfoBankAccNoCptnLbl: Label 'Account No.';
        ReceiptNoCaptionLbl: Label 'Receipt No.';
        CompanyInfoVATRegNoCptnLbl: Label 'GST Reg. No.';
        CustLedgEntry1PostDtCptnLbl: Label 'Posting Date';
        AmountCaptionLbl: Label 'Applied Amt';
        PaymAmtSpecificationCptnLbl: Label 'Payment Amount Specification';
        PmtTolInvCurrCaptionLbl: Label 'Pmt Tol.';
        DocumentDateCaptionLbl: Label 'Document Date';
        InvoiceAmtLbl: Label 'Invoice Amt';
        CompanyInfoEMailCaptionLbl: Label 'Email';
        CompanyInfoHomePageCptnLbl: Label 'Home Page';
        PaymAmtNotAllocatedCptnLbl: Label 'Payment Amount Not Allocated';
        CustLedgEntryOrgAmtCptnLbl: Label 'Payment Amount';
        ExternalDocumentNoCaptionLbl: Label 'External Document No.';
        Title: Label 'Receipt Slip';

    protected var
        CompanyInfo: Record "Company Information";

    local procedure CurrencyCode(SrcCurrCode: Code[10]): Code[10]
    begin
        if SrcCurrCode = '' then
            exit(GLSetup."LCY Code");
        exit(SrcCurrCode);
    end;
}
