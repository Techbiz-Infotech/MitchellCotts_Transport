report 50126 "Fuel issue Note"
{
    //ApplicationArea = All;
    Caption = 'Fuel Issue Note';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Reports/layout/Fuel Issue Note Report.rdlc';
    dataset
    {
        dataitem("Fuel Issue"; "Fuel Issue")
        {
            DataItemTableView = SORTING("Fuel Issue No.");
            RequestFilterFields = "Fuel Issue No.";
            column(CompanyInformation; CompanyInformation.Picture) { }
            column(CompanyInformation_Name; CompanyInformation.Name) { }
            column(CompanyInformation_Address; CompanyInformation.Address) { }
            column(CompanyInformation_Address2; CompanyInformation."Address 2") { }
            column(CompanyInformation_Postcode; CompanyInformation."Post Code") { }
            column(EmailCptnlbl; EmailCptnlbl) { }
            column(CompanyInformation_Email; CompanyInformation."E-Mail") { }
            column(TelCptnlbl; TelCptnlbl) { }
            column(CompanyInformation_Phone; CompanyInformation."Phone No.") { }
            column(FuelIssueNoteCptnlbl; FuelIssueNoteCptnlbl) { }
            column(IssueNoCptnlbl; IssueNoCptnlbl) { }
            column(Fuel_Issue_No_; "Fuel Issue No.") { }
            column(SuppliedToCptnlbl; SuppliedToCptnlbl) { }
            column(Vehicle_No_; "Vehicle No.") { }
            column(OdometerCptnlbl; OdometerCptnlbl) { }
            column(Odometer; Odometer) { }
            column(LitresIssuedCptnlbl; LitresIssuedCptnlbl) { }
            column(Net_Requirement_In_Litres; "Net Requirement In Litres") { }
            column(DateCptnlbl; DateCptnlbl) { }
            column(Issue_Date; "Issue Date") { }
            column(TripIdCptnlbl; TripIdCptnlbl) { }
            column(Trip_ID; "Trip ID") { }
            column(DriverIdCptnlbl; DriverIdCptnlbl) { }
            column(Driver_ID; "Driver ID") { }
            column(DriverNameCptnlbl; DriverNameCptnlbl) { }
            column(Driver_Name; "Driver Name") { }
            column(PumpCptnlbl; PumpCptnlbl) { }
            column(Pump; Pump) { }
            column(FuelingstationNameCptnlbl; FuelingstationNameCptnlbl) { }
            column(Fueling_Station_Name; "Fueling Station Name") { }
            column(LocationCptnlbl; LocationCptnlbl) { }
            column(Shortcut_Dimension_6_Code; "Shortcut Dimension 6 Code") { }
            column(ReceivedByCptnl; ReceivedByCptnl) { }
            column(IssuedByCptnlbl; IssuedByCptnlbl) { }
            column(FuelAttendantsConfirmationCptnlbl; FuelAttendantsConfirmationCptnlbl) { }
            column(DATECptnlbl1; DATECptnlbl1) { }
            column(SIGNCptnlbl; SIGNCptnlbl) { }
            column(CreatedByCptnlbl; CreatedByCptnlbl) { }
            column(ApprovedByCptnlbl; ApprovedByCptnlbl) { }
            column(PrintedByCptnlbl; PrintedByCptnlbl) { }
            column(NameCptnlbl; NameCptnlbl) { }
            column(PrintedOnCptnlbl; PrintedOnCptnlbl) { }
            column(RemarksCptnlbl; RemarksCptnlbl) { }
            column(Remarks; Remarks) { }
            column(PostedByCptnlbl; PostedByCptnlbl) { }
            column(PostedBy; GetFullName("Fuel Issue".SystemCreatedBy)) { }


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
        IssueNoCptnlbl: Label 'Issue No:';
        SuppliedToCptnlbl: Label 'Vehicle To:';
        OdometerCptnlbl: Label 'Odometer (KMS):';
        LitresIssuedCptnlbl: Label 'Litres Issued:';
        DateCptnlbl: Label 'Date:';
        TripIdCptnlbl: Label 'Trip ID:';
        DriverIdCptnlbl: Label 'Driver ID:';
        DriverNameCptnlbl: Label 'Driver Name:';
        FuelIssueNoteCptnlbl: Label 'FUEL ISSUE NOTE';
        PumpCptnlbl: Label 'Pump:';
        FuelingstationNameCptnlbl: Label 'Fueling station Name:';
        LocationCptnlbl: Label 'Location:';
        ReceivedByCptnl: Label 'Received By:';
        IssuedByCptnlbl: Label 'Issued By:';
        NameCptnlbl: Label 'Name:';
        SIGNCptnlbl: Label 'SIGN';
        DATECptnlbl1: Label 'DATE';
        FuelAttendantsConfirmationCptnlbl: Label 'Fuel Attendants Confirmation:';
        ApprovedByCptnlbl: Label 'Approved By:';
        CreatedByCptnlbl: Label 'Created By:';
        PrintedOnCptnlbl: Label 'Printed On:';
        PrintedByCptnlbl: Label 'Printed By:';
        EmailCptnlbl: Label 'Email:';
        TelCptnlbl: Label 'Tel:';
        RemarksCptnlbl: Label 'Remarks:';
        PostedByCptnlbl: Label 'Posted By:';

}
