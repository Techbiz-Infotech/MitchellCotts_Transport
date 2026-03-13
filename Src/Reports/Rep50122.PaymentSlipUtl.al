report 50122 "Payment Slip Utl"
{
    Caption = 'Payment Slip Utl';
    //ApplicationArea = All;
    UsageCategory = Documents;
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Reports/layout/Payment Slip Utl.rdlc';

    dataset
    {
        dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
        {
            DataItemTableView = SORTING("Document Type", "Vendor No.", "Posting Date", "Currency Code") WHERE("Document Type" = FILTER(Payment | Refund));
            RequestFilterFields = "Vendor No.", "Posting Date", "Document No.";
            dataitem(PageLoop; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                column(Title; Title) { }
                column(Vend_Name; Vend.Name) { }
                column(PaymentReferenceCptnlbl; PaymentReferenceCptnlbl) { }
                column(CompanyInformation; CompanyInfo.Picture) { }
                column(CompanyInformation_Name; CompanyInfo.Name) { }
                column(CompanyInformation_Address; CompanyInfo.Address) { }
                column(CompanyInformation_Address2; CompanyInfo."Address 2") { }
                column(CompanyInformation_Postcode; CompanyInfo."Post Code") { }
                column(EmailCptnlbl; EmailCptnlbl) { }
                // column(External_Document_No_VendLedgEntry; "Vendor Ledger Entry"."External Document No.")
                // { }
                column(External_Document_No_VendLedgEntry; "Vendor Ledger Entry"."Payment Reference") { }
                column(CompanyInformation_Email; CompanyInfo."E-Mail") { }
                column(TelCptnlbl; TelCptnlbl) { }
                column(CompanyInformation_Phone; CompanyInfo."Phone No.") { }
                column(PayeeCptnlbl; PayeeCptnlbl) { }
                column(PaymentRefCptnlbl; PaymentRefCptnlbl) { }
                column(BankCptnlbl; BankCptnlbl) { }
                column(DateCptnlbl; DateCptnlbl) { }
                column(PaymentAdjCurrencyCptnlbl; PaymentAdjCurrencyCptnlbl) { }
                column(AcknowledgementCptnlbl; AcknowledgementCptnlbl) { }
                column(PreparedbyCptnlbl; PreparedbyCptnlbl) { }
                column(ApprovedByCptnlbl; ApprovedByCptnlbl) { }
                column(AuthorizedByCptnlbl; AuthorizedByCptnlbl) { }
                column(CheckedByCptnlbl; CheckedByCptnlbl) { }
                column(CACptnlbl; CACptnlbl) { }
                column(FMCptnlbl; FMCptnlbl) { }
                column(AuthorizationCptnlbl; AuthorizationCptnlbl) { }
                column(CompanyLogo; CompanyInfo.Picture)
                { }
                column(VendAddr6; VendAddr[6])
                {
                }
                column(VendAddr7; VendAddr[7])
                {
                }
                column(VendAddr8; VendAddr[8])
                {
                }
                column(VendAddr4; VendAddr[4])
                {
                }
                column(VendAddr5; VendAddr[5])
                {
                }
                column(VendAddr3; VendAddr[3])
                {
                }
                column(VendAddr1; VendAddr[1])
                {
                }
                column(VendAddr2; VendAddr[2])
                {
                }
                column(VendNo_VendLedgEntry; "Vendor Ledger Entry"."Vendor No.")
                {
                    IncludeCaption = true;
                }
                column(DocDate_VendLedgEntry; "Vendor Ledger Entry"."Document Date")
                {
                }
                column(DocType_VendLedgEntry; "Vendor Ledger Entry"."Document Type")
                {
                }
                column(Documenttypecptnlbl1; Documenttypecptnlbl) { }
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
                column(PhoneNo; CompanyInfo."Phone No.")
                {
                }
                column(HomePage; CompanyInfo."Home Page")
                {
                }
                column(Email; CompanyInfo."E-Mail")
                {
                }
                column(VATRegistrationNo; CompanyInfo."VAT Registration No.")
                {
                }
                column(GiroNo; CompanyInfo."Giro No.")
                {
                }
                column(BankName; CompanyInfo."Bank Name")
                {
                }
                column(BankAccountNo; CompanyInfo."Bank Account No.")
                {
                }
                column(ReportTitle; ReportTitle)
                {
                }
                column(DocNo_VendLedgEntry; "Vendor Ledger Entry"."Document No.")
                {
                }
                column(PymtDiscTitle; PaymentDiscountTitle)
                {
                }
                column(CompanyInfoPhoneNoCaption; CompanyInfoPhoneNoCaptionLbl)
                {
                }
                column(CompanyInfoGiroNoCaption; CompanyInfoGiroNoCaptionLbl)
                {
                }
                column(CompanyInfoBankNameCaption; CompanyInfoBankNameCaptionLbl)
                {
                }
                column(CompanyInfoBankAccNoCaption; CompanyInfoBankAccNoCaptionLbl)
                {
                }
                column(RcptNoCaption; RcptNoCaptionLbl)
                {
                }
                column(PayNoCation; PayNoCationLbl)
                {
                }
                column(InvoiceAmtLbl; InvoiceAmtLbl) { }
                column(CompanyInfoVATRegNoCaption; CompanyInfoVATRegNoCaptionLbl)
                {
                }
                column(PostingDateCaption; PostingDateCaptionLbl)
                {
                }
                column(AmtCaption; AmtCaptionLbl)
                {
                }
                column(PymtAmtSpecCaption; PymtAmtSpecCaptionLbl)
                {
                }
                column(PymtTolInvCurrCaption; PymtTolInvCurrCaptionLbl)
                {
                }
                column(AccountantCaption; AccountantCaptionLbl)
                { }
                column(ApprovedCaption; ApprovedCaptionLbl)
                { }
                column(AuthorisedCaption; AuthorisedCaptionLbl)
                { }
                column(Receipient; ReceipientCpationLbl)
                { }
                column(ValueInText; ValueInText)
                {
                }
                column(SubTotalCptnlbl; SubTotalCptnlbl) { }

                column(BalAcNo_VendLedgEntry; "Vendor Ledger Entry"."Bal. Account No.")
                {
                    IncludeCaption = true;
                }

                dataitem(DetailedVendorLedgEntry1; "Detailed Vendor Ledg. Entry")
                {
                    DataItemLink = "Applied Vend. Ledger Entry No." = FIELD("Entry No.");
                    DataItemLinkReference = "Vendor Ledger Entry";
                    DataItemTableView = SORTING("Applied Vend. Ledger Entry No.", "Entry Type") WHERE(Unapplied = CONST(false));

                    column(AppliedVLENo_DtldVendLedgEntry; "Applied Vend. Ledger Entry No.")
                    {
                    }
                    dataitem(VendLedgEntry1; "Vendor Ledger Entry")
                    {
                        DataItemLink = "Entry No." = FIELD("Vendor Ledger Entry No.");
                        DataItemLinkReference = DetailedVendorLedgEntry1;
                        DataItemTableView = SORTING("Entry No.");
                        //CalcFields = "Original Amount";
                        column(PostingDate_VendLedgEntry1; Format("Posting Date"))
                        {
                        }
                        column(DocType_VendLedgEntry1; "Document Type")
                        {
                            // IncludeCaption = true;
                        }
                        // column(Original_Amount; "Original Amount")
                        // {

                        // }

                        column(DocNo_VendLedgEntry1; "Document No.")
                        {
                            //IncludeCaption = true;
                        }
                        column(DocumentCptnlbl; DocumentCptnlbl) { }
                        column(OurReferenceCptnlbl; OurReferenceCptnlbl) { }
                        column(PartyRefCptnlbl; PartyRefCptnlbl) { }
                        column(InvoiceAmountCptnlbl; InvoiceAmountCptnlbl) { }
                        column(PaidAdjYTDCptnlbl; PaidAdjYTDCptnlbl) { }
                        column(BalanceCptnlbl; BalanceCptnlbl) { }
                        column(PaymentCptnlbl1; PaymentCptnlbl) { }

                        column(Description_VendLedgEntry1; Description)
                        {
                            IncludeCaption = true;
                        }
                        column(NegShowAmountVendLedgEntry1; -NegShowAmountVendLedgEntry1)
                        {
                        }
                        column(CurrCode_VendLedgEntry1; CurrencyCode("Currency Code"))
                        {
                        }
                        column(Remaining_Amount_vendLedg1; "Remaining Amount")
                        { }
                        column(NegPmtDiscInvCurrVendLedgEntry1; -NegPmtDiscInvCurrVendLedgEntry1)
                        {
                        }
                        column(NegPmtTolInvCurrVendLedgEntry1; -NegPmtTolInvCurrVendLedgEntry1)
                        {
                        }
                        column(External_Document_No_VendLedgEntry1; "External Document No.")
                        { }
                        column(Amount; Amount)
                        { }
                        trigger OnAfterGetRecord()
                        begin
                            if "Entry No." = "Vendor Ledger Entry"."Entry No." then
                                CurrReport.Skip();

                            NegPmtDiscInvCurrVendLedgEntry1 := 0;
                            NegPmtTolInvCurrVendLedgEntry1 := 0;
                            PmtDiscPmtCurr := 0;
                            PmtTolPmtCurr := 0;

                            NegShowAmountVendLedgEntry1 := -DetailedVendorLedgEntry1.Amount;

                            if "Vendor Ledger Entry"."Currency Code" <> "Currency Code" then begin
                                NegPmtDiscInvCurrVendLedgEntry1 := Round("Pmt. Disc. Rcd.(LCY)" * "Vendor Ledger Entry"."Original Currency Factor");
                                NegPmtTolInvCurrVendLedgEntry1 := Round("Pmt. Tolerance (LCY)" * "Vendor Ledger Entry"."Original Currency Factor");
                                AppliedAmount :=
                                  Round(
                                    -DetailedVendorLedgEntry1.Amount / "Original Currency Factor" * "Vendor Ledger Entry"."Original Currency Factor",
                                    Currency."Amount Rounding Precision");
                            end else begin
                                NegPmtDiscInvCurrVendLedgEntry1 := Round("Pmt. Disc. Rcd.(LCY)" * "Vendor Ledger Entry"."Original Currency Factor");
                                NegPmtTolInvCurrVendLedgEntry1 := Round("Pmt. Tolerance (LCY)" * "Vendor Ledger Entry"."Original Currency Factor");
                                AppliedAmount := -DetailedVendorLedgEntry1.Amount;
                            end;

                            PmtDiscPmtCurr := Round("Pmt. Disc. Rcd.(LCY)" * "Vendor Ledger Entry"."Original Currency Factor");

                            PmtTolPmtCurr := Round("Pmt. Tolerance (LCY)" * "Vendor Ledger Entry"."Original Currency Factor");

                            RemainingAmount := (RemainingAmount - AppliedAmount) + PmtDiscPmtCurr + PmtTolPmtCurr;

                        end;

                    }
                    trigger OnAfterGetRecord()
                    begin
                        ReportCheck.InitTextVariable();
                        ReportCheck.FormatNoText(NumberText, ABS("Vendor Ledger Entry"."Original Amount"), CurrencyCode("Vendor Ledger Entry"."Currency Code"));
                        ValueInText := NumberText[1] + '' + NumberText[2];
                    end;
                }
                dataitem(DetailedVendorLedgEntry2; "Detailed Vendor Ledg. Entry")
                {
                    DataItemLink = "Vendor Ledger Entry No." = FIELD("Entry No.");
                    DataItemLinkReference = "Vendor Ledger Entry";
                    DataItemTableView = SORTING("Vendor Ledger Entry No.", "Entry Type", "Posting Date") WHERE(Unapplied = CONST(false));
                    column(VLENo_DtldVendLedgEntry; "Vendor Ledger Entry No.")
                    {
                    }
                    dataitem(VendLedgEntry2; "Vendor Ledger Entry")
                    {
                        DataItemLink = "Entry No." = FIELD("Applied Vend. Ledger Entry No.");
                        DataItemLinkReference = DetailedVendorLedgEntry2;
                        DataItemTableView = SORTING("Entry No.");
                        column(NegAppliedAmt; -AppliedAmount)
                        {
                        }
                        column(Description_VendLedgEntry2; Description)
                        {
                        }
                        column(DocNo_VendLedgEntry2; "Document No.")
                        {
                        }
                        column(DocType_VendLedgEntry2; "Document Type")
                        {
                        }
                        column(PostingDate_VendLedgEntry2; Format("Posting Date"))
                        {
                        }
                        column(CurrCode_VendLedgEntry2; CurrencyCode("Currency Code"))
                        {
                        }
                        column(NegPmtDiscInvCurrVendLedgEntry2; -NegPmtDiscInvCurrVendLedgEntry1)
                        {
                        }
                        column(NegPmtTolInvCurr1VendLedgEntry2; -NegPmtTolInvCurrVendLedgEntry1)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if "Entry No." = "Vendor Ledger Entry"."Entry No." then
                                CurrReport.Skip();

                            NegPmtDiscInvCurrVendLedgEntry1 := 0;
                            NegPmtTolInvCurrVendLedgEntry1 := 0;
                            PmtDiscPmtCurr := 0;
                            PmtTolPmtCurr := 0;

                            NegShowAmountVendLedgEntry1 := DetailedVendorLedgEntry2.Amount;

                            if "Vendor Ledger Entry"."Currency Code" <> "Currency Code" then begin
                                NegPmtDiscInvCurrVendLedgEntry1 := Round("Pmt. Disc. Rcd.(LCY)" * "Original Currency Factor");
                                NegPmtTolInvCurrVendLedgEntry1 := Round("Pmt. Tolerance (LCY)" * "Original Currency Factor");
                            end else begin
                                NegPmtDiscInvCurrVendLedgEntry1 := Round("Pmt. Disc. Rcd.(LCY)" * "Vendor Ledger Entry"."Original Currency Factor");
                                NegPmtTolInvCurrVendLedgEntry1 := Round("Pmt. Tolerance (LCY)" * "Vendor Ledger Entry"."Original Currency Factor");
                            end;

                            PmtDiscPmtCurr := Round("Pmt. Disc. Rcd.(LCY)" * "Vendor Ledger Entry"."Original Currency Factor");

                            PmtTolPmtCurr := Round("Pmt. Tolerance (LCY)" * "Vendor Ledger Entry"."Original Currency Factor");

                            AppliedAmount := DetailedVendorLedgEntry2.Amount;
                            RemainingAmount := (RemainingAmount - AppliedAmount) + PmtDiscPmtCurr + PmtTolPmtCurr;
                        end;
                    }
                }
                dataitem(Total; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    column(NegRemainingAmt; -RemainingAmount)
                    {
                    }

                    column(TaxCptnlbl; TaxCptnlbl) { }
                    column(NetPaymentCptnlbl; NetPaymentCptnlbl) { }
                     column(PaymentCptnlbl; PaymentCptnlbl) { }
                     column(CuurencyCodeCptnLbl; CuurencyCodeCptnLbl) { }

                    column(CurrCode_VendLedgEntry; CurrencyCode("Vendor Ledger Entry"."Currency Code"))
                    {
                    }
                    column(NegOriginalAmt_VendLedgEntry; -"Vendor Ledger Entry"."Original Amount")
                    {
                    }
                    column(ExtDocNo_VendLedgEntry; "Vendor Ledger Entry"."External Document No.")
                    {
                    }
                    column(PymtAmtNotAllocatedCaption; PymtAmtNotAllocatedCaptionLbl)
                    {
                    }
                    column(PymtAmtCaption; PymtAmtCaptionLbl)
                    {
                    }
                    column(ExternalDocNoCaption; ExternalDocNoCaptionLbl)
                    {
                    }

                }
            }

            trigger OnAfterGetRecord()
            begin
                Vend.Get("Vendor No.");
                FormatAddr.Vendor(VendAddr, Vend);
                if not Currency.Get("Currency Code") then
                    Currency.InitRoundingPrecision;

                if "Document Type" = "Document Type"::Payment then begin
                    ReportTitle := Text004;
                    PaymentDiscountTitle := Text007;
                end else begin
                    ReportTitle := Text003;
                    PaymentDiscountTitle := Text006;
                end;

                CalcFields("Original Amount");
                RemainingAmount := -"Original Amount";
            end;

            trigger OnPreDataItem()
            begin
                CompanyInfo.Get();
                FormatAddr.Company(CompanyAddr, CompanyInfo);
                CompanyInfo.CalcFields(Picture);
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
        PageCaption = 'Page';
        DocDateCaption = 'Document Date';
        EmailCaption = 'Email';
        HomePageCaption = 'Home Page';
        DocType_VendLedgEntry1Caption = 'Doc Type';
        DocNo_VendLedgEntry1Caption = 'Doc No.';
        EXTDocNo_VendLedgEntry1 = 'Ext Doc No.';
    }

    var
        CompanyInfo: Record "Company Information";
        GLSetup: Record "General Ledger Setup";
        Vend: Record Vendor;
        ReportCheck: Report Check;
        NumberText: array[2] of Text[80];
        ValueInText: text[1024];
        Currency: Record Currency;
        Documenttypecptnlbl: Label 'Document Type';
        CuurencyCodeCptnLbl: label 'Currency Code';
        FormatAddr: Codeunit "Format Address";
        ReportTitle: Text[30];
        PaymentDiscountTitle: Text[30];
        CompanyAddr: array[8] of Text[100];
        VendAddr: array[8] of Text[100];
        RemainingAmount: Decimal;
        AppliedAmount: Decimal;
        NegPmtDiscInvCurrVendLedgEntry1: Decimal;
        NegPmtTolInvCurrVendLedgEntry1: Decimal;
        PmtDiscPmtCurr: Decimal;
        Text003: Label 'Payment Receipt';
        Text004: Label 'Payment Voucher';
        Text006: Label 'Payment Discount Given';
        Text007: Label 'Payment Discount Received';
        PmtTolPmtCurr: Decimal;
        NegShowAmountVendLedgEntry1: Decimal;
        CompanyInfoPhoneNoCaptionLbl: Label 'Phone No.';
        CompanyInfoGiroNoCaptionLbl: Label 'Giro No.';
        CompanyInfoBankNameCaptionLbl: Label 'Bank';
        CompanyInfoBankAccNoCaptionLbl: Label 'Account No.';
        RcptNoCaptionLbl: Label 'Receipt No.';
        PayNoCationLbl: Label 'Payment No.';
        CheckedByCptnlbl: Label 'Checked By';
        ApprovedByCptnlbl: Label 'Approved By';
        AuthorizedByCptnlbl: Label 'Authorized By';

        CompanyInfoVATRegNoCaptionLbl: Label 'GST Registration No.';
        PostingDateCaptionLbl: Label 'Posting Date';
        AmtCaptionLbl: Label 'Applied Amt';
        InvoiceAmtLbl: Label 'Invoice Amt';
        PymtAmtSpecCaptionLbl: Label 'Payment Amount Specification';
        PymtTolInvCurrCaptionLbl: Label 'Payment Tolerance';
        PymtAmtNotAllocatedCaptionLbl: Label 'Payment Amount Not Allocated';
        PymtAmtCaptionLbl: Label 'Payment Amount';
        ExternalDocNoCaptionLbl: Label 'Reference/Cheque No.';
        AccountantCaptionLbl: Label 'Accountant';

        AcknowledgementCptnlbl: Label 'Acknowledgement';
        PreparedbyCptnlbl: Label 'Prepared by';
        CACptnlbl: Label 'CA';
        FMCptnlbl: Label 'FM';
        AuthorizationCptnlbl: Label 'Authorization';
        PaymentAdjCurrencyCptnlbl: Label 'Payment/Adj Currency';
        Title: Label 'Payment Slip';
        PaymentRefCptnlbl: Label 'Cheque Ref:';
        DateCptnlbl: Label 'Date';
        PayeeCptnlbl: Label 'Payee:';
        BankCptnlbl: Label 'Bank:';
        DocumentCptnlbl: Label 'Document';
        OurReferenceCptnlbl: Label 'Our Reference';
        PartyRefCptnlbl: Label 'Party Ref';
        InvoiceAmountCptnlbl: Label 'Invoice Amount';
        PaidAdjYTDCptnlbl: Label 'Paid/Adj YTD';
        BalanceCptnlbl: Label 'Balance';
        PaymentCptnlbl: Label 'Payment';
        SubTotalCptnlbl: Label 'Sub Total';
        TaxCptnlbl: Label 'Tax';
        NetPaymentCptnlbl: Label 'Net Payment';
        PaymentReferenceCptnlbl: Label 'Document No.';
        EmailCptnlbl: Label 'Email:';
        TelCptnlbl: Label 'Tel:';
        ApprovedCaptionLbl: Label 'Approved by';
        AuthorisedCaptionLbl: Label 'Authorised by';
        ReceipientCpationLbl: Label 'Receipient';


    local procedure CurrencyCode(SrcCurrCode: Code[10]): Code[10]
    begin
        if SrcCurrCode = '' then
            exit(GLSetup."LCY Code");

        exit(SrcCurrCode);
    end;
}




