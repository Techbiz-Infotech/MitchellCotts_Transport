report 50108 VehicleAllocationReport
{
    //ApplicationArea = All;
    Caption = 'Vehicle Allocation';
    //UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Reports/layout/Vehicle Allocation Report.rdlc';
    dataset
    {
        dataitem(Allocation; Allocation)
        {
            DataItemTableView = SORTING("Allocation No");
            RequestFilterFields = "Allocation No";
            column(CompanyInformation; CompanyInformation.Picture) { }
            column(CompanyInformation_Name; CompanyInformation.Name) { }
            column(CompanyInformation_Address; CompanyInformation.Address) { }
            column(CompanyInformation_Address2; CompanyInformation."Address 2") { }
            column(CompanyInformation_Postcode; CompanyInformation."Post Code") { }
            column(EmailCptnlbl; EmailCptnlbl) { }
            column(CompanyInformation_Email; CompanyInformation."E-Mail") { }
            column(TelCptnlbl; TelCptnlbl) { }
            column(CompanyInformation_Phone; CompanyInformation."Phone No.") { }
            column(Date; Date) { }
            column(FleetwavePrintAllocationCptnlbl; FleetwavePrintAllocationCptnlbl) { }
            column(DriverNameCptnlbl; DriverNameCptnlbl) { }
            column(Driver_Name; "Driver Name") { }
            column(CostCentreCptnlbl; CostCentreCptnlbl) { }
            column(CostCentre; CostCentre) { }
            column(RegistrationNoCptnlbl; RegistrationNoCptnlbl) { }
            column(Vehicle_No_; "Vehicle No.") { }
            column(LocationCodeCptnlbl; LocationCodeCptnlbl) { }
            column(Location_Code; "Location Code") { }
            column(LockCptnlbl; LockCptnlbl) { }
            column(Lock; Lock) { }
            column(CompanyCodeCptnlbl; CompanyCodeCptnlbl) { }
            column(Company_Code; "Company Code") { }
            column(PeriodfromCptnlbl; PeriodfromCptnlbl) { }
            column(StartDateCptnlbl; StartDateCptnlbl) { }
            column(Start_Date; "Start Date") { }
            column(OdometerCptnlbl; OdometerCptnlbl) { }
            column(Odometer; Odometer) { }
            column(PeriodtoCptnlbl; PeriodtoCptnlbl) { }
            column(EnddateCptnlbl; EnddateCptnlbl) { }
            column(End_Date; "End Date") { }
            column(AllocationReasonCptnlbl; AllocationReasonCptnlbl) { }
            column(AllocationReason; AllocationReason) { }
            column(EndOdometerCptnlbl; EndOdometerCptnlbl) { }
            column(End_Odometer; "End Odometer") { }
            column(CreatedByCptnlbl; CreatedByCptnlbl) { }
            column(SystemCreatedBy; SystemCreatedBy) { }
            column(DateCptnlbl; DateCptnlbl) { }
            column(SystemCreatedAt; SystemCreatedAt) { }
            column(ChangedByCptnlbl; ChangedByCptnlbl) { }
            column(SystemModifiedBy; SystemModifiedBy) { }
            column(SystemModifiedAt; SystemModifiedAt) { }
            cOLUMN(CreatedDateUTCCptnlbl; CreatedDateUTCCptnlbl) { }
            column(CreatedDate; CreatedDate) { }
            column(ChangedDateUTCCptnlbl; ChangedDateUTCCptnlbl) { }
            column(ChangedDate; ChangedDate) { }
            column(Text001; Text001) { }
        }
    }
    trigger OnPreReport()
    begin
        CompanyInformation.Get();
        CompanyInformation.CalcFields(Picture);
    end;

    var
        CompanyInformation: Record "Company Information";
        Date: DateTime;
        EmailCptnlbl: Label 'Email:';
        TelCptnlbl: Label 'Tel:';
        FleetwavePrintAllocationCptnlbl: Label 'FleetWave-Print Allocation';
        DriverNameCptnlbl: Label 'Driver Name ';
        DriverName: Text[20];
        CostCentreCptnlbl: Label 'CostCentre';
        CostCentre: Text[30];
        RegistrationNoCptnlbl: Label 'Registration No.';
        RegistrationNo: Code[20];
        LocationCodeCptnlbl: Label 'Location Code';
        LocationCode: Text[20];
        LockCptnlbl: Label 'Lock';
        Lock: Text[20];
        CompanyCodeCptnlbl: Label 'Company Code';
        CompanyCode: Text[20];
        PeriodfromCptnlbl: Label 'Period from:';
        StartDateCptnlbl: Label 'Start Date';
        StartDate: Date;
        Odometer: Decimal;
        OdometerCptnlbl: Label 'Odometer';
        PeriodtoCptnlbl: Label 'Period to:';
        EnddateCptnlbl: Label 'End Date';
        ENDDATE: Date;
        EndOdometer: Decimal;
        EndOdometerCptnlbl: Label 'End Odometer';
        AllocationReasonCptnlbl: Label 'Allocation reason';
        AllocationReason: Text[20];
        CreatedByCptnlbl: Label 'Created By';
        CreatedBy: Text[20];
        DateCptnlbl: Label 'Date';
        CDate: Date;
        ChangedByCptnlbl: Label 'Changed By';
        ChangedBy: Text[20];
        ChangedByDate: Date;
        CreatedDateUTCCptnlbl: Label 'Created Date (UTC)';
        CreatedDate: Date;
        ChangedDateUTCCptnlbl: Label 'Changed date (UTC)';
        ChangedDate: DateTime;
        Text001: Label '(UTC+05:30) Chennai, Kolkata, Mumbai, New Delhi.';
}