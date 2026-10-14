report 57001 ClosedJobCardReport
{
    //ApplicationArea = All;
    Caption = 'Closed Job Card';
    //UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Reports/layout/Closed Job Card Report.rdlc';
    dataset
    {
        dataitem("Workshop Jobs"; "Workshop Jobs")
        {
            DataItemTableView = SORTING("Job Card No.");
            RequestFilterFields = "Job Card No.";
            column(CompanyInformation; CompanyInformation.Picture) { }
            column(CompanyInformation_Name; CompanyInformation.Name) { }
            column(CompanyInformation_Address; CompanyInformation.Address) { }
            column(CompanyInformation_Address2; CompanyInformation."Address 2") { }
            column(CompanyInformation_Postcode; CompanyInformation."Post Code") { }
            column(EmailCptnlbl; EmailCptnlbl) { }
            column(CompanyInformation_Email; CompanyInformation."E-Mail") { }
            column(TelCptnlbl; TelCptnlbl) { }
            column(CompanyInformation_Phone; CompanyInformation."Phone No.") { }
            column(JobStartDateCptnlbl; JobStartDateCptnlbl) { }
            column(DateandTime; DateandTime) { }
            column(JobCardCaptnlb; JobCardCaptnlb) { }
            column(JobNumberCptnlbl; JobNumberCptnlbl) { }
            column(InCptnlbl; InCptnlbl) { }
            column(Time_In; "Time In") { }
            column(OutCptnlbl; OutCptnlbl) { }
            column(Time_Out; "Time Out") { }
            column(JobEndDateCptnlbl; JobEndDateCptnlbl) { }
            column(TimeCptnlbl; TimeCptnlbl) { }
            column(Time; Time) { }
            column(Job_Card_No_; "Job Card No.") { }
            column(RegistrationNoCptnlbl; RegistrationNoCptnlbl) { }
            column(Vehicle_No_; "Vehicle No.") { }
            column(MakeCodeCptnlbl; MakeCodeCptnlbl) { }
            column(Make_Code; "Make Code") { }
            column(ModelCodeCptnlbl; ModelCodeCptnlbl) { }
            column(Model_Code; "Model Code") { }
            column(EngineNumberCptnlbl; EngineNumberCptnlbl) { }
            column(Engine_Number; "Engine Number") { }
            column(CommentsCptnlbl; CommentsCptnlbl) { }
            column(Closing_Comments; "Closing Comments") { }
            column(ChasisNumberCptnlbl; ChasisNumberCptnlbl) { }
            column(Chassis_No_; "Chassis No.") { }
            column(JobStatusCptnlbl; JobStatusCptnlbl) { }
            column(Job_Status; "Job Status") { }
            column(DateCptnlbl; DateCptnlbl) { }
            column(Job_Date; "Job Date") { }
            column(OdometerCptnlbl; OdometerCptnlbl) { }
            column(Odometer_In; "Odometer In") { }
            column(Odometer_Out; "Odometer Out") { }
            column(Job_End_Date; "Job End Date")
            {
            }
            dataitem("Requested Parts/Service Line"; "Requested Parts/Service Line")
            {
                DataItemLinkReference = "Workshop Jobs";
                DataItemLink = "Job Card No." = field("Job Card No.");
                column(RequestedDateCptnlbl; RequestedDateCptnlbl) { }
                column(Requested_Date; "Requested Date") { }
                column(PartNoCptnlbl; PartNoCptnlbl) { }
                column(No_; "No.") { }
                column(DescriptionCptnlbl; DescriptionCptnlbl) { }
                column(Description; Description) { }
                column(QuantityCptnlbl; QuantityCptnlbl) { }
                column(Quantity; "Request Quantity") { }
                column(TotalCostCptnlbl; TotalCostCptnlbl) { }
                column(TotalCost; TotalCost) { }
                column(NBCptnlbl; NBCptnlbl) { }
                column(Text001; Text001) { }
                column(WorkShopRepCptnlbl; WorkShopRepCptnlbl) { }
                column(NameCptnlbl; NameCptnlbl) { }
                column(SignCptnlbl; SignCptnlbl) { }
                column(StoreRepNameCptnlbl; StoreRepNameCptnlbl) { }
                column(SeniorCptnlbl; SeniorCptnlbl) { }
                column(ManagerCptnlbl; ManagerCptnlbl) { }
                column(PrintedOnCptnlbl; PrintedOnCptnlbl) { }
                column(PrintedByCptnlbl; PrintedByCptnlbl) { }
                column(Created_By; "Created By") { }
                column(CreatedByCptnlbl; CreatedByCptnlbl) { }
                column(ClosedByCptnlbl; ClosedByCptnlbl) { }
                column(PrintedBy; PrintedBy) { }
                column(Date; Date) { }

            }
        }

    }
    trigger OnPreReport()
    begin
        CompanyInformation.Get();
        CompanyInformation.CalcFields(Picture);
    end;

    var
        CompanyInformation: Record "Company Information";
        JobStartDateCptnlbl: Label 'Job Start Date:';
        DateandTime: DateTime;
        JobCardCaptnlb: Label 'JOB CARD';
        JobNumberCptnlbl: Label 'Job No.:';
        InCptnlbl: Label 'Time In:';
        OutCptnlbl: Label 'Time Out:';
        JobEndDateCptnlbl: Label 'Job End Date:';
        CreatedByCptnlbl: Label 'Created By:';
        ClosedByCptnlbl: Label 'Closed By:';
        Time: Time;
        TimeCptnlbl: Label 'Time:';
        Odometer: Decimal;
        OdometerCptnlbl: Label 'Odometer';
        RegistrationNoCptnlbl: Label 'Registration No.:';
        MakeCodeCptnlbl: Label 'Make Code:';
        EngineNumber: Code[20];
        EngineNumberCptnlbl: Label 'Engine Number:';
        ReasonforRepairCode: Text[30];
        ReasonforRepairCodeCptnlbl: Label 'Reason for Repair Code:';
        Comments: Text;
        CommentsCptnlbl: Label 'Comments:';
        ModelCode: Code[20];
        ModelCodeCptnlbl: Label 'Model Code:';
        ChasisNumber: Code[20];
        ChasisNumberCptnlbl: Label 'Chasis Number:';
        JobStatusCptnlbl: Label 'Job Status:';
        DateCptnlbl: Label 'DATE';
        Date: Date;
        RequestedDateCptnlbl: Label 'Requested Date';
        DescriptionCptnlbl: Label 'Description';
        QuantityCptnlbl: Label 'Quantity';
        PartNoCptnlbl: Label 'Part No';
        TotalCost: Decimal;
        TotalCostCptnlbl: Label 'Total Cost';
        NBCptnlbl: Label 'NB:';
        WorkShopRepCptnlbl: Label 'Mechanic Name:';
        NameCptnlbl: Label 'NAME:';
        SignCptnlbl: Label 'SIGN:';
        StoreRepNameCptnlbl: Label 'Driver Name:';
        SeniorCptnlbl: Label 'Workshop Supervisor:';
        ManagerCptnlbl: Label 'MANAGER:';
        PrintedOnCptnlbl: Label 'Printed On:';
        PrintedBy: Text[20];
        PrintedByCptnlbl: Label 'Printed By:';
        Text001: Label 'By Signing the above, all stakeholders are satisfied with the work carried out and are witnesses.';
        EmailCptnlbl: Label 'Email:';
        TelCptnlbl: Label 'Tel:';

}









