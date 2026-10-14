report 57019 "Payment Voucher Utl"
{
    Caption = 'UTL-Payment Voucher';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    //ApplicationArea = all;
    RDLCLayout = './Src/Reports/layout/Payment Voucher Utl.rdlc';
    dataset
    {
        // dataitem("G/L Register"; "G/L Register")
        // {
        //     DataItemTableView = sorting("No.");
        //     //RequestFilterFields = "No.";

        //     column(No_GLReg; "No.")
        //     {
        //     }
            dataitem("G/L Entry"; "G/L Entry")
            {
                DataItemTableView = sorting("Document No.", "Posting Date")
                                    order(descending);
                RequestFilterFields = "Document No.", "Posting Date";
                column(CompanyInformation; CompanyInformation.Picture) { }
                column(CompanyInformation_Name; CompanyInformation.Name) { }
                column(CompanyInformation_Address; CompanyInformation.Address) { }
                column(CompanyInformation_Address2; CompanyInformation."Address 2") { }
                column(CompanyInformation_Postcode; CompanyInformation."Post Code") { }
                column(EmailCptnlbl; EmailCptnlbl) { }
                column(CompanyInformation_Email; CompanyInformation."E-Mail") { }
                column(TelCptnlbl; TelCptnlbl) { }
                column(City;CompanyInformation.City){}
                column(CompanyInformation_Phone; CompanyInformation."Phone No.") { }
                column(IsoCodeCptnlbl; IsoCodeCptnlbl) { }
                column(Title; Title) { }
                column(VoucherRefcptnlb; VoucherRefcptnlb) { }
                column(Entry_No_; "Entry No.") { }
                column(Document_No_; "Document No.") { }
                column(DateCptnlbl; DateCptnlbl) { }
                column(Posting_Date; "Posting Date") { }
                column(AccountDescriptionCptnlbl; AccountDescriptionCptnlbl) { }
                column(Description; Description) { }
                column(AccountNoCptnlbl; AccountNoCptnlbl) { }
                column(G_L_Account_No_; "G/L Account No.") { }
                column(AmountDrCptnlbl; AmountDrCptnlbl) { }
                column(DebitAmount_GLEntry; "Debit Amount") { }
                column(AmountCrCptnlbl; AmountCrCptnlbl) { }
                column(CreditAmount_GLEntry; "Credit Amount") { }
                column(ChequeNoCptnlbl; ChequeNoCptnlbl) { }
                column(External_Document_No_; "External Document No.") { }
                column(PartyCptnlbl; PartyCptnlbl) { }
                column(Vendor_No; Vendor."No.") { }
                column(Vendor_Name; Vendor.Name) { }
                column(ExchangeRateCptnlbl; ExchangeRateCptnlbl) { }
                column(Exchange_Rate_Amount; ExchangeCurrCode."Exchange Rate Amount") { }
                column(ModuleAPSSourceCptnlbl; ModuleAPSSourceCptnlbl) { }
                column(TotalCptnlbl; TotalCptnlbl) { }
                column(StatusCptnlbl; StatusCptnlbl) { }
                column(DebitAmountTotal; DebitAmountTotal) { }
                column(CreditAmountTotal; CreditAmountTotal) { }
                column(Page_Lbl; PageLbl) { }
                column(CrText; CrText) { }
                column(DrText; DrText) { }
                column(GLAccName; GLAccName) { }
                column(AcknowledgementCptnlbl; AcknowledgementCptnlbl) { }
                column(PreparedbyCptnlbl; PreparedbyCptnlbl) { }
                column(CACptnlbl; CACptnlbl) { }
                column(FMCptnlbl; FMCptnlbl) { }
                column(AuthorizationCptnlbl; AuthorizationCptnlbl) { }
                trigger OnAfterGetRecord()
                begin
                    Vendor.Reset();
                    Vendor.SetRange("No.");
                    if Vendor.FindFirst() then;
                    GLAccName := FindGLAccName("Source Type", "Entry No.", "Source No.", "G/L Account No.");
                    if Amount < 0 then begin
                        CrText := ToLbl;
                        DrText := '';
                    end else begin
                        CrText := '';
                        DrText := DrLbl;
                    end;

                    if PostingDate <> "G/L Entry"."Posting Date" then begin
                        PostingDate := "G/L Entry"."Posting Date";
                        TotalDebitAmt := 0;
                    end;
                    if DocumentNo <> "G/L Entry"."Document No." then begin
                        DocumentNo := "G/L Entry"."Document No.";
                        TotalDebitAmt := 0;
                    end;
                    if PostingDate = "G/L Entry"."Posting Date" then begin
                        TotalDebitAmt += "G/L Entry"."Debit Amount";

                    end;

                    if (PrePostingDate <> "G/L Entry"."Posting Date") or (PreDocumentNo <> "G/L Entry"."Document No.") then begin
                        DebitAmountTotal := 0;
                        CreditAmountTotal := 0;
                        PrePostingDate := "G/L Entry"."Posting Date";
                        PreDocumentNo := "G/L Entry"."Document No.";
                    end;
                    DebitAmountTotal := DebitAmountTotal + "Debit Amount";
                    CreditAmountTotal := CreditAmountTotal + "Credit Amount";

                end;

                // trigger OnPreDataItem()
                // begin
                //     SetRange("Entry No.", "G/L Register"."From Entry No.", "G/L Register"."To Entry No.");
                //     SetCurrentKey("Document No.", "Posting Date", Amount);
                // end;

            }
        }
   // }
    trigger OnInitReport()
    begin
        CompanyInformation.Get();
        CompanyInformation.CalcFields(Picture)
    end;

    var
        Vendor: Record Vendor;
        CompanyInformation: Record "Company Information";
        ExchangeCurrCode: Record "Currency Exchange Rate";
        Date: Date;
        EmailCptnlbl: Label 'Email:';
        TelCptnlbl: Label 'Tel:';
        VoucherRefcptnlb: Label 'Voucher Ref';
        DateCptnlbl: Label 'Date';
        AccountDescriptionCptnlbl: Label 'Account Description';
        AccountNoCptnlbl: Label 'Account No';
        AmountDrCptnlbl: Label 'Amount Dr';
        AmountCrCptnlbl: Label 'Amount Cr';
        ChequeNoCptnlbl: Label 'Cheque No';
        PartyCptnlbl: Label 'Party';
        ExchangeRateCptnlbl: Label 'Exchange Rate';
        TotalCptnlbl: Label 'Total';
        StatusCptnlbl: Label 'Status';
        AcknowledgementCptnlbl: Label 'Acknowledgement';
        PreparedbyCptnlbl: Label 'Prepared by';
        CACptnlbl: Label 'CA';
        FMCptnlbl: Label 'FM';
        AuthorizationCptnlbl: Label 'Authorization';
        ModuleAPSSourceCptnlbl: Label 'Module APS Source';
        PageLbl: Label 'Page';
        PrePostingDate: Date;
        PreDocumentNo: Code[30];
        DebitAmountTotal: Decimal;
        CreditAmountTotal: Decimal;
        PrintBody5: Boolean;
        PostingDate: Date;
        TotalDebitAmt: Decimal;
        SourceCode: Record "Source Code";
        GLAccName: Text[50];
        DocumentNo: Code[20];
        CrText: Text[2];
        DrText: Text[2];
        DrLbl: Label 'Dr';
        ToLbl: Label 'To';
        IsoCodeCptnlbl: Label 'Iso Code:';
        Title: Label 'Payment Voucher';


    procedure FindGLAccName(
    "Source Type": Enum "Gen. Journal Source Type";
    "Entry No.": Integer;
    "Source No.": Code[20];
    "G/L Account No.": Code[20]): Text[50]
    var
        VendorLedgerEntry: Record "Vendor Ledger Entry";
        Vendor: Record Vendor;
        CustLedgerEntry: Record "Cust. Ledger Entry";
        Customer: Record Customer;
        BankAccountLedgerEntry: Record "Bank Account Ledger Entry";
        BankAccount: Record "Bank Account";
        FALedgerEntry: Record "FA Ledger Entry";
        FixedAsset: Record "Fixed Asset";
        GLAccount: Record "G/L Account";
        AccName: Text[50];
    begin
        case "Source Type" of
            "Source Type"::Vendor:
                if VendorLedgerEntry.Get("Entry No.") then begin
                    Vendor.Get("Source No.");
                    AccName := CopyStr(Vendor.Name, 1, MaxStrLen(AccName));
                end else begin
                    GLAccount.Get("G/L Account No.");
                    AccName := CopyStr(GLAccount.Name, 1, MaxStrLen(AccName));
                end;
            "Source Type"::Customer:
                if CustLedgerEntry.Get("Entry No.") then begin
                    Customer.Get("Source No.");
                    AccName := CopyStr(Customer.Name, 1, MaxStrLen(AccName));
                end else begin
                    GLAccount.Get("G/L Account No.");
                    AccName := CopyStr(GLAccount.Name, 1, MaxStrLen(AccName));
                end;
            "Source Type"::"Bank Account":
                if BankAccountLedgerEntry.Get("Entry No.") then begin
                    BankAccount.Get("Source No.");
                    AccName := CopyStr(BankAccount.Name, 1, MaxStrLen(AccName));
                end else begin
                    GLAccount.Get("G/L Account No.");
                    AccName := CopyStr(GLAccount.Name, 1, MaxStrLen(AccName));
                end;
            "Source Type"::"Fixed Asset":
                begin
                    FALedgerEntry.Reset();
                    FALedgerEntry.SetRange("G/L Entry No.", "Entry No.");
                    if not FALedgerEntry.IsEmpty() then begin
                        FixedAsset.Get("Source No.");
                        AccName := CopyStr(FixedAsset.Description, 1, MaxStrLen(AccName));
                    end else begin
                        GLAccount.Get("G/L Account No.");
                        AccName := CopyStr(GLAccount.Name, 1, MaxStrLen(AccName));
                    end;
                end else begin
                GLAccount.Get("G/L Account No.");
                AccName := CopyStr(GLAccount.Name, 1, MaxStrLen(AccName));
            end;
                        GLAccount.Get("G/L Account No.");
                        AccName := CopyStr(GLAccount.Name, 1, MaxStrLen(AccName));
        end;
        exit(AccName);
    end;
}
