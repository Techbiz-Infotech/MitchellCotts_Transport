report 50107 "Gate Pass"
{
    //ApplicationArea = All;
    Caption = 'Gate Pass';
    //UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Reports/layout/Gate Pass Report.rdlc';
    dataset
    {
        dataitem(Gatepass; Gatepass)
        {
            DataItemTableView = SORTING("Gatepass No.");
            RequestFilterFields = "Gatepass No.";
            column(CompanyInformation; CompanyInformation.Picture) { }
            column(CompanyInformation_Name; CompanyInformation.Name) { }
            column(CompanyInformation_Address; CompanyInformation.Address) { }
            column(CompanyInformation_Address2; CompanyInformation."Address 2") { }
            column(CompanyInformation_Postcode; CompanyInformation."Post Code") { }
            column(EmailCptnlbl; EmailCptnlbl) { }
            column(CompanyInformation_Email; CompanyInformation."E-Mail") { }
            column(GatePassCptnlbl; GatePassCptnlbl) { }
            column(DateCptnlbl; DateCptnlbl) { }
            column(Gatepass_Date; "Gatepass Date") { }
            column(GatePassNoCptnlbl; GatePassNoCptnlbl) { }
            column(Gatepass_No_; "Gatepass No.") { }
            column(TimeCptnlbl; TimeCptnlbl) { }
            column(Created_time; "Created time") { }
            column(Gatepass_Type; "Gatepass Type") { }
            column(VehicleIDCptnlbl; VehicleIDCptnlbl) { }
            column(Vehicle_No_; "Vehicle No.") { }
            column(FromCptnlbl; FromCptnlbl) { }
            column(From_Source_; "From(Source)") { }
            column(ToCptnlbl; ToCptnlbl) { }
            column(To__Destination_; "To (Destination)") { }
            column(PurposeCptnlbl; PurposeCptnlbl) { }
            column(Purpose_Description; "Purpose/Description") { }
            column(RemarksCptnlbl; RemarksCptnlbl) { }
            column(Remarks; Remarks) { }
            column(RequestedByCptnlbl; RequestedByCptnlbl) { }
            column(Text001; Text001) { }
            column(NameCptnlbl; NameCptnlbl) { }
            column(SIGNCptnlbl; SIGNCptnlbl) { }
            column(CollectedByCptnlbl; CollectedByCptnlbl) { }
            column(IDNOCptnlbl; IDNOCptnlbl) { }
            column(DATECptnlabl; DATECptnlabl) { }
            column(DateofIssueCptn; DateofIssueCptn) { }
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
        Text001: Label 'This is a System approved document that may not require/have a physical signature';
        DateCptnlbl: Label 'Date:';
        TimeCptnlbl: Label 'Time';
        GatePassCptnlbl: Label 'Gate Pass';
        GatePassNoCptnlbl: Label 'Gate Pass No:';
        VehicleIDCptnlbl: Label 'Vehicle ID:';
        FromCptnlbl: Label 'From :';
        DATECptnlabl: Label 'DATE';
        ToCptnlbl: Label 'To:';
        PurposeCptnlbl: Label 'Purpose:';
        RemarksCptnlbl: Label 'Remarks:';
        EmailCptnlbl: Label 'Email:';
        Email: Text[30];
        DateofIssueCptn: Label 'Date of Issue:';
        RequestedByCptnlbl: Label 'Requested By:';
        PrintedOnCptnlbl: Label 'Printed On:';
        NameCptnlbl: Label 'Name:';
        SIGNCptnlbl: Label 'SIGN';
        CollectedByCptnlbl: label 'Collected By:';
        IDNOCptnlbl: label 'ID NO:';
        PrintedOn: Date;
        PrintedByCptnlbl: Label 'Printed By';
        PrintedBy: Text[30];
}
