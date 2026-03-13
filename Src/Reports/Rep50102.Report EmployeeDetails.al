report 50102 EmployeeDetailsReport
{
    //ApplicationArea = All;
    Caption = 'Employee Details';
    //UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Reports/layout/Employee Details Report.rdlc';
    dataset
    {
        dataitem(Employee; Employee)
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.";
            column(CustPicture; CustTenantMedia.Content)
            {
            }
            column(CompanyInformation; CompanyInformation.Picture) { }
            column(EmployeeDetailsCptnlbl; EmployeeDetailsCptnlbl) { }
            column(BioGraphyCptnlbl; BioGraphyCptnlbl) { }
            column(PayrollNoCptnlbl; PayrollNoCptnlbl) { }
            column(No_Emp; "No.") { }
            column(FullNameCptnlbl; FullNameCptnlbl) { }
            column(FullName; FullName) { }
            column(DateofBirthCptnlbl; DateofBirthCptnlbl) { }
            column(Birth_Date; "Birth Date") { }
            column(SexCptnlbl; SexCptnlbl) { }
            column(Gender; Gender) { }
            column(IDNoCptnlbl; IDNoCptnlbl) { }
            column(IDNo; IDNo) { }
            column(AlexanderForbesNoCptnlbl; AlexanderForbesNoCptnlbl) { }
            column(AlexanderForbesNo; AlexanderForbesNo) { }
            column(AddressCptnlbl; AddressCptnlbl) { }
            column(Adress; Adress) { }
            column(HomeTownCptnlbl; HomeTownCptnlbl) { }
            column(HomeTown; HomeTown) { }
            column(EmploymentDetailsCptnlbl; EmploymentDetailsCptnlbl) { }
            column(PositionCptnlbl; PositionCptnlbl) { }
            column(Position; Position) { }
            column(DepartmentCptnlbl; DepartmentCptnlbl) { }
            column(Department; Department) { }
            column(EmploymentStatusCptnlbl; EmploymentStatusCptnlbl) { }
            column(Status; Status) { }
            column(StartDateCptnlbl; StartDateCptnlbl) { }
            column(Employment_Date; "Employment Date") { }
            column(EndDateCptnlbl; EndDateCptnlbl) { }
            column(EndDate; EndDate) { }
            column(LicenseTypeCptnlbl; LicenseTypeCptnlbl) { }
            column(Driverlic_Driver_Licence_type; Driverlic."Driver Licence type") { }
            column(LicenseNoCptnlbl; LicenseNoCptnlbl) { }
            column(Driverlic_Licence_No; Driverlic."Licence No.") { }
            column(LicenseExpiryDateCptnlbl; LicenseExpiryDateCptnlbl) { }
            column(Driverlic_Licence_Expiry; Driverlic."Licence Expiry") { }
            column(EmergencyContactsCptnlbl; EmergencyContactsCptnlbl) { }
            column(NameCptnlbl_EmerCtn; NameCptnlbl) { }
            column(Name_EmgContact; Name) { }
            column(AddressCptnlbl_EmerCtn; AddressCptnlbl) { }
            column(Address_1; "Address 1") { }
            column(MobileNumberCptnlbl_EmerCtn; MobileNumberCptnlbl) { }
            column(Phone; Phone) { }
            column(IDNumberCptnlbl_EmerCtn; IDNumberCptnlbl) { }
            column(Emer_Contact_ID_No_; "Emer Contact ID No.") { }
            column(RelationshipCptnlbl_EmerCtn; RelationshipCptnlbl) { }
            column(Relationship_type_EmerCtn; "Relationship type") { }
            dataitem("Employee Relative"; "Employee Relative")
            {
                column(NextOfKinDetailsCptnlbl; NextOfKinDetailsCptnlbl) { }
                column(NameCptnlbl; NameCptnlbl) { }
                column(First_Name; "First Name") { }
                column(MobileNumberCptnlbl; MobileNumberCptnlbl) { }
                column(Phone_No_; "Phone No.") { }
                column(AddressCptnlbl_NextOfKin; AddressCptnlbl) { }
                column(Next_Kin_Address; "Next Kin Address") { }
                column(IDNumberCptnlbl; IDNumberCptnlbl) { }
                column(IDNumber; IDNumber) { }
                column(RelationshipCptnlbl; RelationshipCptnlbl) { }
                column(Relative_Code; "Relative Code") { }
                column(TrainingDetailsCptnlbl; TrainingDetailsCptnlbl) { }
                column(DateCptnlbl; DateCptnlbl) { }
                column(Date; Date) { }
                column(CourseNameCptnlbl; CourseNameCptnlbl) { }
                column(CourseDetailsCptnlbl; CourseDetailsCptnlbl) { }
                column(TrainingLevelCptnlbl; TrainingLevelCptnlbl) { }
                column(ProviderCptnlbl; ProviderCptnlbl) { }
                column(LocationCptnlbl; LocationCptnlbl) { }
                column(WarningDisciplinaryDetailsCptnlbl; WarningDisciplinaryDetailsCptnlbl) { }
                column(WarningDateCptnlbl; WarningDateCptnlbl) { }
                column(WarningDate; WarningDate) { }
                column(DescriptionCptnlbl; DescriptionCptnlbl) { }
                column(Description; Description) { }
                column(WarningMethodCptnlbl; WarningMethodCptnlbl) { }
                column(Text001; Text001) { }
                column(Text002; Text002) { }
                column(PrintedOnCptnlbl; PrintedOnCptnlbl) { }
                column(PrintedOn; PrintedOn) { }
                column(PrintedByCptnlbl; PrintedByCptnlbl) { }
                column(PrintedBy; PrintedBy) { }
            }
            trigger OnAfterGetRecord()
            var
                Emp: Record Employee;
            begin
                Driverlic.Reset();
                Driverlic.SetRange("Driver Id", Employee."No.");
                if Driverlic.FindFirst() then;


                if Emp.Get("No.") then
                    if Emp.Image.HasValue then begin
                        CustTenantMedia.Get(Emp.Image.MediaId);
                        CustTenantMedia.CalcFields(Content);
                    end;
            end;

        }

    }
    trigger OnPreReport()
    begin
        CompanyInformation.Get();
        CompanyInformation.CalcFields(Picture);
    end;

    var
        CustTenantMedia: Record "Tenant Media";
        ItemTenantMedia: Record "Tenant Media";
        CompanyInformation: Record "Company Information";
        Driverlic: Record "Driver Licence";
        EmployeeDetailsCptnlbl: Label 'EMPLOYEE DETAILS';
        BioGraphyCptnlbl: Label 'BioGraphy';
        EmploymentDetailsCptnlbl: Label 'Employment Details';
        PayrollNoCptnlbl: Label 'Payroll No.:';
        PayrollNo: Integer;
        FullNameCptnlbl: Label 'Full Name:';
        FullName: Text[30];
        DateofBirthCptnlbl: Label 'Date of Birth:';
        DateofBirth: Date;
        SexCptnlbl: Label 'Sex:';
        Sex: Text[20];
        IDNoCptnlbl: Label 'ID No.:';
        IDNo: Integer;
        AlexanderForbesNoCptnlbl: Label 'Alexander Forbes No.:';
        AlexanderForbesNo: Code[20];
        AddressCptnlbl: Label 'Address:';
        Adress: Text[30];
        HomeTownCptnlbl: Label 'Home Town:';
        HomeTown: Text[30];
        PositionCptnlbl: Label 'Position:';
        Position: Text[20];
        DepartmentCptnlbl: Label 'Department:';
        Department: Integer;
        EmploymentStatusCptnlbl: Label 'Employment Status:';
        EmploymentStatus: Text[20];
        StartDateCptnlbl: Label 'Start Date:';
        StartDate: Date;
        EndDateCptnlbl: Label 'End Date:';
        EndDate: Date;
        LicenseTypeCptnlbl: Label 'License Type:';
        LicenseType: Text[20];
        LicenseNoCptnlbl: Label 'License No.:';
        LicenseNo: Code[20];
        LicenseExpiryDateCptnlbl: Label 'License Expiry Date:';
        LicenseExpiryDate: Date;
        NextOfKinDetailsCptnlbl: Label 'Next of Kin details';
        NameCptnlbl: Label 'Name:';
        Name: Text[30];
        MobileNumberCptnlbl: Label 'Mobile Number:';
        MobileNumber: Code[20];
        IDNumberCptnlbl: Label 'ID Number:';
        IDNumber: Code[20];
        RelationshipCptnlbl: Label 'Relationship:';
        Relationship: Text[20];
        EmergencyContactsCptnlbl: Label 'Emergency Contacts';
        TrainingDetailsCptnlbl: Label 'Training Details';
        DateCptnlbl: Label 'Date';
        Date: Date;
        CourseNameCptnlbl: Label 'Course Name';
        CourseDetailsCptnlbl: Label 'Course Details';
        TrainingLevelCptnlbl: Label 'Training Level';
        ProviderCptnlbl: Label 'Provider';
        LocationCptnlbl: Label 'Location';
        WarningDisciplinaryDetailsCptnlbl: Label 'Warning/Disciplinary Details';
        WarningDateCptnlbl: Label 'Warning Date';
        WarningDate: Date;
        DescriptionCptnlbl: Label 'Description';
        Description: Text;
        WarningMethodCptnlbl: Label 'Warning Method';
        Text001: Label 'County Government of Kisumu Prosperity House(Former Nyanza Privincial Headquarter Building) 2nd Floor Kisumu,';
        Text002: Label 'Kenya. P.O.Box 2738-40100 Kisumu City';
        PrintedOnCptnlbl: Label 'Printd On:';
        PrintedOn: Date;
        PrintedByCptnlbl: Label 'Printed By:';
        PrintedBy: Text[20];

}