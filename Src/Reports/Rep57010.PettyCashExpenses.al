report 57010 "Petty Cash Expenses"
{
    //ApplicationArea = All;
    Caption = 'Petty Cash Expenses';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Reports/layout/Petty Cash Expenses Report.rdlc';
    dataset
    {
        dataitem(PettyCashExpensesDetail; "Petty Cash Expenses Detail")
        {
            DataItemTableView = SORTING("Voucher No.");
            RequestFilterFields = "Voucher No.", "Trip ID";
            column(CompanyInformation; CompanyInformation.Picture) { }
            column(CompanyInformation_Name; CompanyInformation.Name) { }
            column(CompanyInformation_Address; CompanyInformation.Address) { }
            column(CompanyInformation_Address2; CompanyInformation."Address 2") { }
            column(CompanyInformation_Postcode; CompanyInformation."Post Code") { }
            column(EmailCptnlbl; EmailCptnlbl) { }
            column(CompanyInformation_Email; CompanyInformation."E-Mail") { }
            column(TelCptnlbl; TelCptnlbl) { }
            column(CompanyInformation_Phone; CompanyInformation."Phone No.") { }
            column(DateCptnlbl; DateCptnlbl) { }
            column(Creation_date; "Creation date") { }
            column(LTDCptnlbl; LTDCptnlbl) { }
            column(TripExpenseCptnlbl; TripExpenseCptnlbl) { }
            column(CashVoucherCptnlbl; CashVoucherCptnlbl) { }
            column(Voucher_No_; "Voucher No.") { }
            column(DriverIDCptnlbl; DriverIDCptnlbl) { }
            column(Driver_ID; "Driver ID") { }
            column(DriverNameCptnlbl; DriverNameCptnlbl) { }
            column(Driver_Name; "Driver Name") { }
            column(TruckRegistrationNumberCptnlbl; TruckRegistrationNumberCptnlbl) { }
            column(Vehicle_No_; "Vehicle No.") { }
            column(TripRefCptnlbl; TripRefCptnlbl) { }
            column(Transaction_Reference_No_; "Transaction Reference No.") { }
            column(TransactionDateCptnlbl; TransactionDateCptnlbl) { }
            column(TransactionDate; Trip."Trip Date") { }
            column(TripTypeCptnlbl; TripTypeCptnlbl) { }
            column(Trip_Type; Trip."Consignment Type") { }
            column(FromSourcecptnlbl; FromSourcecptnlbl) { }
            column(From; From) { }
            column(TODestinationCptnlbl; TODestinationCptnlbl) { }
            column(Destination; Destination) { }
            column(ExpenseTypeCptnlbl; ExpenseTypeCptnlbl) { }
            column(Expense_Type; "Expense Type") { }
            column(LocationCptnlbl; LocationCptnlbl) { }
            column(Location; Trip."Shortcut Dimension 4 Code") { }
            column(RemarkCptnlbl; RemarkCptnlbl) { }
            column(Remarks_Comments; "Remarks/Comments") { }
            column(TotalAmountCptnlbl; TotalAmountCptnlbl) { }
            column(Petty_Cash_Amount; "Petty Cash Amount") { }
            column(IssuedByCptnlbl; IssuedByCptnlbl) { }
            column(NameCptnlbl; NameCptnlbl) { }
            column(Name; Name) { }
            column(SignCptnlbl; SignCptnlbl) { }
            column(Sign; Sign) { }
            column(ReceivedByCptnlbl; ReceivedByCptnlbl) { }
            column(Driver_Name1; "Driver Name") { }
            column(AuthorizedByCptnlbl; AuthorizedByCptnlbl) { }
            trigger OnAfterGetRecord()
            begin
                Trip.Reset();
                Trip.SetRange("Trip ID", "Trip ID");
                if Trip.FindFirst() then;
            end;
        }
    }
    trigger OnPreReport()
    begin
        CompanyInformation.Get();
        CompanyInformation.CalcFields(Picture);
    end;

    var
        Date: DateTime;
        CompanyInformation: Record "Company Information";
        Trip: Record Trip;
        TripExpenseCptnlbl: Label 'Trip Expense';
        LTDCptnlbl: Label 'LTD';
        CashVoucherCptnlbl: Label 'CASH VOUCHER';
        DriverIDCptnlbl: Label 'Driver ID:';
        DriverNameCptnlbl: Label 'Driver Name:';
        TruckRegistrationNumberCptnlbl: Label 'Truck Registration No.:';
        TripRefCptnlbl: Label 'Trip Ref:';
        TripRef: Text[20];
        TransactionDateCptnlbl: Label 'Transaction Date:';
        TransactionDate: Date;
        TruckRegistrationNumber: Code[20];
        TripTypeCptnlbl: Label 'Trip Type:';
        FromSourceCptnlbl: Label 'From (Source):';
        ToDestinationCptnlbl: Label 'To (Destination):';
        ExpenseTypeCptnlbl: Label 'Expense Type:';
        LocationCptnlbl: Label 'Location:';
        RemarkCptnlbl: Label 'Remark & Comments:';
        TypeCptnlbl: Label 'Type';
        Type: Text[20];
        TotalAmountCptnlbl: Label 'Total Amount:';
        IssuedByCptnlbl: Label 'Issued By:';
        NameCptnlbl: Label 'Name:';
        Name: Text[20];
        SignCptnlbl: Label 'Sign:';
        Sign: Text[20];
        ReceivedByCptnlbl: Label 'Received By:';
        AuthorizedByCptnlbl: Label 'Authorized By:';
        TripType: Text[20];
        Location: Text[20];
        DateCptnlbl: Label 'Date:';
        EmailCptnlbl: Label 'Email:';
        TelCptnlbl: Label 'Tel:';
        ExpenseTotal: Decimal;

}
