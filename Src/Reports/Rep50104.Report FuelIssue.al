report 50104 FuelIssueReport
{
    Caption = 'Fuel Issue';
    //UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Reports/layout/Fuel Issue Report.rdlc';
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
            column(FuelIssueCptnlbl; FuelIssueCptnlbl) { }
            column(HDate; HDate) { }
            column(FleetwavePrintFuelCptnlbl; FleetwavePrintFuelCptnlbl) { }
            column(IssueNumberCptnlbl; IssueNumberCptnlbl) { }
            column(Fuel_Issue_No_; "Fuel Issue No.") { }
            column(RegistrationNoCptnlbl; RegistrationNoCptnlbl) { }
            column(Vehicle_No_; "Vehicle No.") { }
            column(PumpCptnlbl; PumpCptnlbl) { }
            column(Pump; Pump) { }
            column(FuelingStationNameCptnlbl; FuelingStationNameCptnlbl) { }
            column(Fueling_Station_Name; "Fueling Station Name") { }
            column(DriverIDCptnlb; DriverIDCptnlb) { }
            column(Driver_ID; "Driver ID") { }
            column(DriverNameCptnlb; DriverNameCptnlb) { }
            column(Driver_Name; "Driver Name") { }
            column(OdometerCptnlbl; OdometerCptnlbl) { }
            column(Odometer; Odometer) { }
            column(QtyIssuedCptnlbl; QtyIssuedCptnlbl) { }
            column(Net_Requirement_In_Litres; "Net Requirement In Litres") { }
            column(TripNumberCptnlbl; TripNumberCptnlbl) { }
            column(Trip_ID; "Trip ID") { }
            column(LocationCodeCptnlbl; LocationCodeCptnlbl) { }
            column(Location_Code; "Shortcut Dimension 6 Code") { }
            column(DateCptnlbl; DateCptnlbl) { }
            column(Issue_Date; "Issue Date") { }
            column(FuelTypeCptnlbl; FuelTypeCptnlbl) { }
            column(Fuel_Type; "Fuel Type") { }
            column(TankSizeCptnlbl; TankSizeCptnlbl) { }
            column(Tank_Size; "Tank Size") { }
            column(CreatedByCptnlbl; CreatedByCptnlbl) { }
            column(Created_By; "Created By") { }
            column(CreatedDateCptnlbl; CreatedDateCptnlbl) { }
            column(Created_Date; "Created Date") { }
            column(TransactionTimeCptnlbl; TransactionTimeCptnlbl) { }
            column(Transaction_Time; "Transaction Time") { }
            column(TransactionNumberCptnlbl; TransactionNumberCptnlbl) { }
            column(Transaction_No_; "Transaction No.") { }
            column(PostedCptnLbl; PostedCptnLbl) { }
            column(Posted; Posted) { }
            column(ChangedByCptnlbl; ChangedByCptnlbl) { }
            column(Last_Modified_by; "Last Modified by") { }
            column(ApprovedByCptnlbl; ApprovedByCptnlbl) { }
            column(CreatedDateUTC; CreatedDateUTC) { }
            column(ChangedDateUTCCptnlbl; ChangedDateUTCCptnlbl) { }
            column(Last_Modified_Date; "Last Modified Date") { }
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
        FuelIssueCptnlbl: Label ' Fuel Issue';
        HDate: DateTime;
        FleetwavePrintFuelCptnlbl: Label 'FleetWave - Print Fuel';
        IssueNumberCptnlbl: Label 'Issue No.';
        RegistrationNoCptnlbl: Label 'Registration No.:';
        PumpCptnlbl: Label 'Pump:';
        FuelingStationNameCptnlbl: Label 'Fueling Station Name:';
        DriverIDCptnlb: Label 'Driver ID:';
        DriverNameCptnlb: Label 'Driver Name:';
        OdometerCptnlbl: Label 'Odometer:';
        QtyIssuedCptnlbl: Label 'Qty Issued:';
        QtyIssued: Decimal;
        PriceperunitCptnlbl: Label 'Price per unit:';
        Priceperunit: Decimal;
        CostCptnlbl: Label 'Cost:';
        Cost: Decimal;
        TripNumberCptnlbl: Label 'Trip ID:';
        LocationCodeCptnlbl: Label 'Location Code:';
        DateCptnlbl: Label 'Date';
        FuelNoteNumberCptnlbl: Label 'Fuel Note No.:';
        FuelNoteNumber: Code[20];
        FuelingStationCptnlbl: Label 'Fueling Station:';
        FuelingStation: Text[20];
        FuelTypeCptnlbl: Label 'Fuel Type:';
        FuelType: Text[20];
        UnitofMeasureCptnlbl: Label 'Unit of Measure:';
        UnitofMeasure: Text[20];
        CostCentreCptnlbl: Label 'Costcentre:';
        Costcentre: Text[20];
        TankSizeCptnlbl: Label 'Tank Size:';
        TankSize: Decimal;
        MiscellaneousActualVehicleIDCptnlbl: Label 'Miscellaneous Actual Vehicle ID:';
        MiscellaneousActualVehicleID: Code[20];
        FRQApprovalCodeCptnlbl: Label 'FRQ Approval Code:';
        FRQApprovalCode: Code[20];
        CreatedByCptnlbl: Label 'Created By:';
        CreatedDateCptnlbl: Label 'Created Date:';
        CreatedDate: Date;
        CompanyCodeCptnlbl: Label 'Company Code:';
        CompanyCode: Text[30];
        TransactionTimeCptnlbl: Label 'Transaction Time:';
        TransactonTime: Time;
        TransactionNumberCptnlbl: Label 'Transaction No.:';
        TransactionNumber: Text[20];
        PostedCptnLbl: Label 'Posted:';
        Posted: Text[20];
        CDate: Date;
        ChangedByCptnlbl: Label 'Changed By';
        ChangedBy: Text[20];
        ApprovedByCptnlbl: Label 'Approved By';
        CreatedDateUTC: Date;
        ChangedDateUTCCptnlbl: Label 'Changed date (UTC)';
        ChangedDate: DateTime;
        Text001: Label '(UTC+05:30) Chennai, Kolkata, Mumbai, New Delhi.';
        FieldNameCptnLbl: Label 'Field name';
        FieldName: Text[20];
        OldValueCptnlbl: Label 'Old value';
        OldValue: Code[20];
        NewValueCptnLbl: Label 'New value';
        NewValue: Code[20];
        CreatedTimeCptnlbl: Label 'Created time';
        CreatdTime: Time;
        TableNameCptnlbl: Label ' Table name';
        TableName: Text[20];
        RecnoCptnlbl: Label 'RECNO';
        Recno: Text[20];
        StatusCodeCptnlbl: Label 'Status Code';
        StatusCode: Code[20];
        StatusCommentsCptnlbl: Label 'Status comments';
        StatusDateCptnlbl: Label ' Status Date';
        DurationMinutesCptnlbl: Label 'Duraton minutes';
        EmailCptnlbl: Label 'Email:';
        TelCptnlbl: Label 'Tel:';






}