report 57004 EmployeeGatePassReport
{
    //ApplicationArea = All;
    Caption = 'Employee Gate Pass';
    //UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Reports/layout/Employee Gate Pass Report.rdlc';
    dataset
    {
        dataitem(Employee; Employee)
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.";
            column(CompanyInformation; CompanyInformation.Picture) { }
            column(CompanyInformation_Name; CompanyInformation.Name) { }
            column(CompanyInformation_Address; CompanyInformation.Address) { }
            column(CompanyInformation_Address2; CompanyInformation."Address 2") { }
            column(CompanyInformation_Postcode; CompanyInformation."Post Code") { }
            column(CompanyInformation_Email; CompanyInformation."E-Mail") { }
            column(Text001; Text001) { }
            column(DateCptnlbl; DateCptnlbl) { }
            column(Date; Date) { }
            column(NameOfEmployeeCptnlbl; NameOfEmployeeCptnlbl) { }
            column(FullName; FullName) { }
            column(IDNoCptnlbl; IDNoCptnlbl) { }
            column(No_; "No.") { }
            column(DepartmentCptnlbl; DepartmentCptnlbl) { }
            column(Department; Department) { }
            column(TheapplicantwillremainoutforCptnlbl; TheapplicantwillremainoutforCptnlbl) { }
            column(HoursCptnlbl; HoursCptnlbl) { }
            column(AsFromCptnlbl; AsFromCptnlbl) { }
            column(AMorPMCptnlbl; AMorPMCptnlbl) { }
            column(ToCptnlbl; ToCptnlbl) { }
            column(ReasonfortheleaveoutCptnlbl; ReasonfortheleaveoutCptnlbl) { }
            column(OfficialCptnlbl; OfficialCptnlbl) { }
            column(PersonalCptnlbl; PersonalCptnlbl) { }
            column(LostHoursRecoverableCptnlbl; LostHoursRecoverableCptnlbl) { }
            column(HODSectionHead; HODSectionHead) { }
            column(HumanResourcesandADMOfficerCptnlbl; HumanResourcesandADMOfficerCptnlbl) { }
            column(Text002; Text002) { }
            column(Text003; Text003) { }
            column(EmailCptnlbl; EmailCptnlbl) { }
            column(PrintedOnCptnlbl; PrintedOnCptnlbl) { }
            column(PrintedOn; PrintedOn) { }
            column(PrintedByCptnlbl; PrintedByCptnlbl) { }
            column(PrintedBy; PrintedBy) { }

        }
    }
    trigger OnPreReport()
    begin
        CompanyInformation.Get();
        CompanyInformation.CalcFields(Picture);
    end;

    var
        CompanyInformation: Record "Company Information";
        Text001: Label 'PERMISSION TO LEAVE UNIGROUP TRANSPORTERS PREMISES/YARD';
        DateCptnlbl: Label 'Date:';
        Date: Date;
        NameOfEmployeeCptnlbl: Label 'Name Of Employee:';
        NameOfEmployee: Text[30];
        IDNoCptnlbl: Label 'ID NO.:';
        IDNo: Code[20];
        DepartmentCptnlbl: Label 'DEPARTMENT:';
        Department: Text[20];
        TheapplicantwillremainoutforCptnlbl: Label 'The applicant will remain out for:';
        HoursCptnlbl: Label 'Hours';
        AsFromCptnlbl: Label 'As From:';
        AMorPMCptnlbl: Label '(AM/PM)';
        ToCptnlbl: Label 'To';
        ReasonfortheleaveoutCptnlbl: Label 'Reason For the Leave Out:';
        OfficialCptnlbl: Label 'OFFICIAL';
        PersonalCptnlbl: Label 'PERSONAL';
        LostHoursRecoverableCptnlbl: Label 'LOST HOURS RECOVERABLE(Please Tick One)';
        HODSectionHead: Label 'HOD/SECTION HEAD';
        HumanResourcesandADMOfficerCptnlbl: Label 'HUMAN RESOURCES & ADM OFFICER';
        Text002: Label 'NOTE: ALL CONCERNED PARTIES PLEASE NOTE THAT PERSONAL AFFAIRS WILL BE TREATED AS LOST HOURS AND';
        Text003: Label 'WILL BE RECOVERED FROM YOUR MONTHLY SALARY.';
        EmailCptnlbl: Label 'Email:';
        Email: Text[30];
        PrintedOnCptnlbl: Label 'Printed On:';
        PrintedOn: Date;
        PrintedByCptnlbl: Label 'Printed By';
        PrintedBy: Text[30];
}