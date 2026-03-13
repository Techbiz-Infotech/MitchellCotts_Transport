report 50105 MedicalLeaveOutFormReport
{
    //ApplicationArea = All;
    Caption = 'Medical Leave Out Form';
    //UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Reports/layout/Medical Leave Out form Report.rdlc';
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
            column(MedicalLeaveOutFormCptnlbl; MedicalLeaveOutFormCptnlbl) { }
            column(DateCptnlbl; DateCptnlbl) { }
            column(Date; Date) { }
            column(NameofEmployeeCptnlbl; NameofEmployeeCptnlbl) { }
            column(FullName; FullName) { }
            column(IDNoCptnlbl; IDNoCptnlbl) { }
            column(No_; "No.") { }
            column(DepartmentCptnlbl; DepartmentCptnlbl) { }
            column(Department; Department) { }
            column(WKNoCptnlbl; WKNoCptnlbl) { }
            column(WKNO; WKNO) { }
            column(HospitalToAttendedCptnlbl; HospitalToAttendedCptnlbl) { }
            column(HospitaltoAttendded; HospitaltoAttendded) { }
            column(HODNameCptnlbl; HODNameCptnlbl) { }
            column(HODName; HODName) { }
            column(HODSignCptnlbl; HODSignCptnlbl) { }
            column(HODSign; HODSign) { }
            column(HRADMOffcerSignCptnlbl; HRADMOffcerSignCptnlbl) { }
            column(HRADMOfficierSign; HRADMOfficierSign) { }
            column(DiagnosisandDoctorsRemarksCptnlbl; DiagnosisandDoctorsRemarksCptnlbl) { }
            column(DiagnosisandDoctorsRemarks; DiagnosisandDoctorsRemarks) { }
            column(OffDutyFromDateCptnlbl; OffDutyFromDateCptnlbl) { }
            Column(OffDutyFromDate; OffDutyFromDate) { }
            column(LightDutyFromDateCptnlbl; LightDutyFromDateCptnlbl) { }
            column(LightDutyFromDate; LightDutyFromDate) { }
            column(DocsCommentDatetoresumeworkCptnlbl; DocsCommentDatetoresumeworkCptnlbl) { }
            column(DocsCommentDatetoresumework; DocsCommentDatetoresumework) { }
            column(DoctorsNameCptnlbl; DoctorsNameCptnlbl) { }
            column(DoctorsName; DoctorsName) { }
            column(SignCptnlbl; SignCptnlbl) { }
            column(Sign; Sign) { }
            column(RubberStampCptnlbl; RubberStampCptnlbl) { }
            column(RubberStamp; RubberStamp) { }
            column(ForOfficialuseUPonReturnCptnlbl; ForOfficialuseUPonReturnCptnlbl) { }
            column(HeadOfDepartmentCptnlbl; HeadOfDepartmentCptnlbl) { }
            column(AdministrationOrHROfficierCptnlbl; AdministrationOrHROfficierCptnlbl) { }
            column(Text001; Text001) { }
            column(Text002; Text002) { }
            column(Text003; Text003) { }
            column(Text004; Text004) { }
            column(EmailCptnlbl; EmailCptnlbl) { }
            column(E_Mail; "E-Mail") { }
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
        MedicalLeaveOutFormCptnlbl: Label 'MEDICAL LEAVE OUT FORM';
        DateCptnlbl: Label 'Date:';
        Date: Date;
        NameofEmployeeCptnlbl: Label 'Name of Employee:';
        NameofEmployee: Text[30];
        IDNoCptnlbl: Label ' ID NO.:';
        IDNO: Integer;
        DepartmentCptnlbl: Label 'DEPARTMENT:';
        Department: Text[20];
        WKNoCptnlbl: Label 'WK/NO:';
        WKNO: Integer;
        HospitalToAttendedCptnlbl: Label 'Hospital to Attended:';
        HospitaltoAttendded: Text[30];
        HODNameCptnlbl: Label 'HOD Name:';
        HODName: Text[30];
        HODSignCptnlbl: Label 'HOD Sign:';
        HODSign: Text[20];
        HRADMOffcerSignCptnlbl: Label 'HR & ADM Officier Sign:';
        HRADMOfficierSign: Text[20];
        DiagnosisandDoctorsRemarksCptnlbl: Label 'Diagnosis & Doctor''s Remarks:';
        DiagnosisandDoctorsRemarks: Text[60];
        OffDutyFromDateCptnlbl: Label 'Off Duty From(Date)';
        OffDutyFromDate: Date;
        LightDutyFromDateCptnlbl: Label 'Light Duty From(Date)';
        LightDutyFromDate: Date;
        DocsCommentDatetoresumeworkCptnlbl: Label 'Doc''s Comments/Date to Resume work';
        DocsCommentDatetoresumework: Text[50];
        DoctorsNameCptnlbl: Label 'Doctor''s Name:';
        DoctorsName: Text[50];
        SignCptnlbl: Label 'Sign:';
        Sign: Text[20];
        RubberStampCptnlbl: Label 'Rubber Stamp:';
        RubberStamp: Text[30];
        ForOfficialuseUPonReturnCptnlbl: Label 'For Official Use Upon return:';
        HeadOfDepartmentCptnlbl: Label 'Head Of Department';
        AdministrationOrHROfficierCptnlbl: Label 'Administration/HR Officer';
        Text001: Label 'NOTE: THIS SHEET MUST BE HANDED OVER TO THE DOCTOR AND THEN RETURNED TO THE HUMAN RESOURCES';
        Text002: Label 'OFFICE WITHIN 24HOURS.';
        Text003: Label 'Unigroup Transporters Ltd P.O Box 81664-80100 Mombasa, Kenya. Mijikenda street, Near Railways station Offices/Yard';
        Text004: Label 'Plot No.:XIII/153-Mombasa';
        EmailCptnlbl: Label 'Email:';
        Email: Text[30];
        PrintedOnCptnlbl: Label 'Printed On:';
        PrintedOn: Date;
        PrintedByCptnlbl: Label 'Printed By';
        PrintedBy: Text[30];
}

