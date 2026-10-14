report 57014 "Inspection Checklist"
{
    Caption = 'Inspection Checklist';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Reports/layout/Inspection Checklist Report.rdlc';
    dataset
    {
        dataitem("Inspection Header"; "Inspection Header")
        {
            DataItemTableView = sorting("Inspection No.");
            RequestFilterFields = "Inspection No.";
            column(CompanyInformation; CompanyInformation.Picture) { }
            column(CompanyInformation_Name; CompanyInformation.Name) { }
            column(CompanyInformation_Address; CompanyInformation.Address) { }
            column(CompanyInformation_Address2; CompanyInformation."Address 2") { }
            column(CompanyInformation_Postcode; CompanyInformation."Post Code") { }
            column(MechanicalCheckListCptnlbl; MechanicalCheckListCptnlbl) { }
            column(EmailCptnlbl; EmailCptnlbl) { }
            column(CompanyInformation_Email; CompanyInformation."E-Mail") { }
            column(TelCptnlbl; TelCptnlbl) { }
            column(CompanyInformation_Phone; CompanyInformation."Phone No.") { }
            column(InspectionNoCptnlbl; InspectionNoCptnlbl) { }
            column(Inspection_No_; "Inspection No.") { }
            column(TimeCptnlbl; TimeCptnlbl) { }
            column(Inspection_Time; "Inspection Time") { }
            column(DateCptnlbl; DateCptnlbl) { }
            column(Inspection_Date; "Inspection Date") { }
            column(TruckRegistrationCptnlbl; TruckRegistrationCptnlbl) { }
            column(Vehicle_No_; "Vehicle No.") { }
            column(TrailerRegistrationCptnlbl; TrailerRegistrationCptnlbl) { }
            column(Trailer_No_; "Trailer No.") { }
            column(DriverIdCptnlbl; DriverIdCptnlbl) { }
            column(Driver_ID; "Driver ID") { }
            column(DriverNameCptnlbl; DriverNameCptnlbl) { }
            column(Driver_Name; "Driver Name") { }
            column(MileageCptnlbl; MileageCptnlbl) { }
            column(Mileage;Mileage) { }
            dataitem("Inspection Line"; "Inspection Line")
            {
                DataItemLinkReference = "Inspection Header";
                DataItemLink = "Inspection No." = field("Inspection No.");
                column(Check_List; "Check List") { }
                column(YesCptnlbl; YesCptnlbl) { }
                column(Ok_or_Not_Ok_; "Ok or Not Ok?") { }
                column(Inspection_Category; "Inspection Category") { }
                column(Remarks; Remarks) { }
                column(MechanicCptnlbl; MechanicCptnlbl) { }
                column(SignCptnlbl; SignCptnlbl) { }
                column(ElectricianCptnlbl; ElectricianCptnlbl) { }
                column(TyremanCptnlbl; TyremanCptnlbl) { }
                column(WelderCptnlbl; WelderCptnlbl) { }
                column(PanelbeaterCptnlbl; PanelbeaterCptnlbl) { }
                column(DriverCptnlbl; DriverCptnlbl) { }
                column(GeneralCommentsCptnlbl; GeneralCommentsCptnlbl) { }
                column(WorkshopSupervisorCptnlbl; WorkshopSupervisorCptnlbl) { }
                column(WorkshopManagerCptnlbl; WorkshopManagerCptnlbl) { }

            }
        }


    }
    trigger OnPreReport()
    begin
        CompanyInformation.Get();
        CompanyInformation.CalcFields(Picture);
    end;

    var
        myInt: Integer;
        CompanyInformation: Record "Company Information";
        EmailCptnlbl: Label 'Email:';
        TelCptnlbl: Label 'Tel:';
        SignCptnlbl: Label 'Sign';
        DateCptnlbl: Label 'Date';
        TimeCptnlbl: Label 'Time:';
        InspectionNoCptnlbl: Label 'Inspection No';
        TruckRegistrationCptnlbl: Label 'Truck Registration:';
        TrailerRegistrationCptnlbl: Label 'Trailer Registration:';
        DriverNameCptnlbl: Label 'Driver Name:';
        MileageCptnlbl: Label 'Mileage:';
        YesCptnlbl: Label 'Yes/No';
        MechanicCptnlbl: Label 'Mechanic';
        ElectricianCptnlbl: Label 'Electrician';
        TyremanCptnlbl: Label 'Tyreman';
        WelderCptnlbl: Label 'Welder';
        PanelbeaterCptnlbl: Label 'Panel beater';
        DriverCptnlbl: Label 'Driver';
        GeneralCommentsCptnlbl: Label 'General Comments';
        WorkshopSupervisorCptnlbl: Label ' Workshop Supervisor';
        WorkshopManagerCptnlbl: Label ' Workshop Manager';
        DriverIdCptnlbl: Label ' Driver ID:';
        MechanicalCheckListCptnlbl: Label ' Mechanical Check List';

}
