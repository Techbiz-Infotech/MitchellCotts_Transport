report 57007 OndfloorJobCardReport
{
    //ApplicationArea = All;
    Caption = 'On Floor Job card';
    //UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Reports/layout/On Floor Job Card Report.rdlc';
    dataset
    {
        dataitem("Workshop Jobs"; "Workshop Jobs")
        {
            RequestFilterFields = "Job Card No.";
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    column(CompanyInformation; CompanyInformation.Picture) { }
                    column(Date; Date) { }
                    column(Job_Card_No_; "Workshop Jobs"."Job Card No.") { }
                    column(OnFloorJobCardDocumentCptnlbl; OnFloorJobCardDocumentCptnlbl) { }
                    column(OnFloorJobCardCptnlbl; OnFloorJobCardCptnlbl) { }
                    column(StartDateCptnlbl; StartDateCptnlbl) { }
                    column(Job_Date; "Workshop Jobs"."Job Date") { }
                    column(StartTimeCptnlbl; StartTimeCptnlbl) { }
                    column(Time_in; "Workshop Jobs"."Time In") { }
                    column(EnddateCptnlbl; EnddateCptnlbl) { }
                    column(Job_End_Date; "Workshop Jobs"."Job End Date") { }
                    column(EndTimeCptnlbl; EndTimeCptnlbl) { }
                    column(Time_Out; "Workshop Jobs"."Time Out") { }
                    column(BreakdownCptnlbl; BreakdownCptnlbl) { }
                    column(Breakdown; Breakdown) { }
                    column(AppointedMechanicCptnlbl; AppointedMechanicCptnlbl) { }
                    column(Appointed_Mechanic; "Workshop Jobs"."Appointed Mechanic Name") { }
                    column(AppointedElectricianCptnlbl; AppointedElectricianCptnlbl) { }
                    column(Appointed_Electrician; "Workshop Jobs"."Appointed Electrician Name") { }
                    column(AppointedWelderCptnlbl; AppointedWelderCptnlbl) { }
                    column(Appointe_Welder; "Workshop Jobs"."Appointed Welder Name") { }
                    column(AppointedPanelBeaterCptnlbl; AppointedPanelBeaterCptnlbl) { }
                    column(Appointed_PanelBeater; "Workshop Jobs"."Appointed Panel Beater Name") { }
                    column(AppointedTyreManCptnlbl; AppointedTyreManCptnlbl) { }
                    column(Appointed_TyreMan; "Workshop Jobs"."Appointed Tyreman Name") { }
                    column(RegistrationNoCptnlbl; RegistrationNoCptnlbl) { }
                    column(Vehicle_No_; "Workshop Jobs"."Vehicle No.") { }
                    column(FleetNoCptnlbl; FleetNoCptnlbl) { }
                    column(Vehicle_No_1; "Workshop Jobs"."Vehicle No.") { }
                    column(DriverNameCptnlbl; DriverNameCptnlbl) { }
                    column(Driver_Name; "Workshop Jobs"."Driver Name") { }
                    column(MakeCptnlbl; MakeCptnlbl) { }
                    column(Make_Code; "Workshop Jobs"."Make Code") { }
                    column(ModelCptnlbl; ModelCptnlbl) { }
                    column(Model_Code; "Workshop Jobs"."Model Code") { }
                    column(MileageInCptnlbl; MileageInCptnlbl) { }
                    column(MileageIn; "Workshop Jobs"."Mileage In") { }
                    column(ShowUnitCost; ShowUnitCost) { }
                    column(Outputno; OutputNo) { }
                    column(CopyText; CopyText) { }
                    column(CommentsCptnlbl; CommentsCptnlbl) { }
                    column(Comments; "Workshop Jobs".Comments) { }
                    column(ClosingCommentsCptnlbl; ClosingCommentsCptnlbl) { }
                    column(ClosingComment; "Workshop Jobs"."Closing Comments") { }
                    dataitem("Requested Parts/Service Line"; "Requested Parts/Service Line")
                    {
                        DataItemLinkReference = "Workshop Jobs";
                        DataItemLink = "Job Card No." = field("Job Card No.");
                        column(JobReasonCptnlbl; JobReasonCptnlbl) { }
                        column(ConsumablesIssueCptnlbl; ConsumablesIssueCptnlbl) { }
                        column(RepairandfabricationCptnlbl; RepairandfabricationCptnlbl) { }
                        column(VehicledefectsCptnlbl; VehicledefectsCptnlbl) { }
                        column(SolutionWorkCarriedoutCptnlbl; SolutionWorkCarriedoutCptnlbl) { }
                        column(PartsIssueandAuthorizationCaptnlbl; PartsIssueandAuthorizationCaptnlbl) { }
                        column(ItemDescriptionCptnlbl; ItemDescriptionCptnlbl) { }
                        column(Description; Description) { }
                        column(ItemNoCptnlbl; ItemNoCptnlbl) { }
                        column(No_; "No.") { }
                        column(QTYCptnlbl; QTYCptnlbl) { }
                        column(Quantity; "Request Quantity") { }
                        column(AUTHSIGNCptnlbl; AUTHSIGNCptnlbl) { }
                        column(PrintedOnCptnlbl; PrintedOnCptnlbl) { }
                        column(PrintedOn; PrintedOn) { }
                        column(PrintedByCptnlbl; PrintedByCptnlbl) { }
                        column(PrintedBy; PrintedBy) { }

                    }

                }
                trigger OnAfterGetRecord();
                begin
                    if Number > 1 then begin
                        CopyText := FormatDocument.GetCOPYText;
                        OutputNo += 1;
                    end;
                end;

                trigger OnPreDataItem();
                begin
                    NoOfLoops := ABS(NoOfCopies) + 1;
                    IF NoOfLoops <= 0 THEN
                        NoOfLoops := 1;
                    CopyText := '';
                    SETRANGE(Number, 1, NoOfLoops);
                    OutputNo := 1;
                end;
            }
        }

    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field("Show Unit Cost"; ShowUnitCost)
                    {
                        ApplicationArea = all;
                    }
                    field(NoOfCopies; NoOfCopies)
                    {
                        ApplicationArea = all;
                    }
                }
            }
        }
        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;
                }
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
        OnFloorJobCardDocumentCptnlbl: Label 'On Floor Job Card Document';
        Date: DateTime;
        OnFloorJobCardCptnlbl: Label 'ON FLOOR JOB CARD';
        OnFloorJobCard: Code[20];
        StartDateCptnlbl: Label 'START DATE:';
        StartDate: Date;
        StartTimeCptnlbl: Label 'START TIME:';
        StartTime: Time;
        EnddateCptnlbl: Label 'END DATE:';
        ENDDATE: Date;
        EndTimeCptnlbl: Label 'END TIME:';
        EndTime: Time;
        BreakdownCptnlbl: Label 'BREAKDOWN?:';
        Breakdown: Boolean;
        AppointedMechanicCptnlbl: Label 'APPOINTED MECHANIC:';
        Appointedmechanic: Text[20];
        AppointedElectricianCptnlbl: Label 'APPOINTED ELECTRICIAN:';
        AppointedElectrician: Text[30];
        AppointedWelderCptnlbl: Label 'APPOINTED WELDER:';
        AppointedWelder: Text[20];
        AppointedPanelBeaterCptnlbl: Label 'APPOINTED PANEL BEATER:';
        AppointedPanelBeater: Text[20];
        AppointedTyreManCptnlbl: Label 'APPOINTED TYRE MAN:';
        AppointedTyreMan: Text[20];
        RegistrationNoCptnlbl: Label 'REGISTRATION NO.:';
        REGISTRATIONNO: Code[20];
        FleetNoCptnlbl: Label 'FLEET NO.:';
        FleetNo: Code[20];
        DriverNameCptnlbl: Label 'DRIVER NAME:';
        DriverName: Text[30];
        MakeCptnlbl: Label 'MAKE:';
        Make: Text[30];
        ModelCptnlbl: Label 'MODEL:';
        Model: Integer;
        MileageInCptnlbl: Label 'MILEAGE IN:';
        MileageIn: Decimal;
        MisceVehicleIDCptnlbl: Label 'MISCE. VEHICLE ID:';
        MisceVehicleID: Code[20];
        JobReasonCptnlbl: Label 'JOB REASON:';
        ConsumablesIssueCptnlbl: Label 'CONSUMABLES ISSUE:';
        RepairandfabricationCptnlbl: Label 'Repair & Fabrication:';
        VehicledefectsCptnlbl: Label 'VEHICLE DEFFFECTS';
        CommentsCptnlbl: Label 'Comments';
        ClosingCommentsCptnlbl: Label 'Closing Comments';
        SolutionWorkCarriedoutCptnlbl: Label 'SOLUTION/WORK CARRIED OUT';
        PartsIssueandAuthorizationCaptnlbl: Label 'PARTS ISSUE AND AUTHORIZATION:';
        ItemDescriptionCptnlbl: Label 'ITEM DESCRIPTION:';
        ItemNoCptnlbl: Label 'Item No.';
        QTYCptnlbl: Label 'QTY';
        AUTHSIGNCptnlbl: Label 'AUTH SIGN';
        PrintedOnCptnlbl: Label 'Printed On:';
        PrintedOn: Date;
        PrintedByCptnlbl: Label 'Printed By';
        PrintedBy: Text[30];
        ShowUnitCost: Boolean;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        OutputNo: Integer;
        FormatDocument: Codeunit "Format Document";
}