report 57011 "Stock Request"
{
    Caption = 'Stock Request';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Reports/layout/Stock Request Report.rdlc';
    dataset
    {
        dataitem("Stock request header"; "Stock request header")
        {
            DataItemTableView = SORTING("Stock Request No.");
            RequestFilterFields = "Stock Request No.";
            column(CompanyInformation; CompanyInformation.Picture) { }
            column(CompanyInformation_Name; CompanyInformation.Name) { }
            column(CompanyInformation_Address; CompanyInformation.Address) { }
            column(CompanyInformation_Address2; CompanyInformation."Address 2") { }
            column(CompanyInformation_Postcode; CompanyInformation."Post Code") { }
            column(EmailCptnlbl; EmailCptnlbl) { }
            column(CompanyInformation_Email; CompanyInformation."E-Mail") { }
            column(TelCptnlbl; TelCptnlbl) { }
            column(CompanyInformation_Phone; CompanyInformation."Phone No.") { }
            column(StockRequestCptnlbl; StockRequestCptnlbl) { }
            column(StockRequestNoCptnlbl; StockRequestNoCptnlbl) { }
            column(Stock_Request_No_; "Stock Request No.") { }
            column(StockRequestDateCptnlbl; StockRequestDateCptnlbl) { }
            column(Stock_Request_Date; "Stock Request Date") { }
            column(JobCardNoCptnlbl; JobCardNoCptnlbl) { }
            column(Job_Card_No_; "Job Card No.") { }
            column(TypeOfJobCptnlbl; TypeOfJobCptnlbl) { }
            column(Job_Card_Type; "Job Type") { }
            column(VehicleNoCptnlbl; VehicleNoCptnlbl) { }
            column(Vehicle_No_; "Vehicle No.") { }
            column(DriverIDCptnlbl; DriverIDCptnlbl) { }
            column(Driver_ID; "Driver ID") { }
            column(RequestedByCptnlbl; RequestedByCptnlbl) { }
            column(Requested_By; "Requested By")
            {

            }
            dataitem("Stock request line"; "Stock request line")
            {
                DataItemLinkReference = "Stock request header";
                DataItemLink = "Document No." = field("Stock Request No.");
                column(PartNoCptnlbl; PartNoCptnlbl) { }
                column(No_; "No.") { }
                column(DescriptionCptnlbl; DescriptionCptnlbl) { }
                column(Description; Description) { }
                column(QuantityCptnlbl; QuantityCptnlbl) { }
                column(Quantity; Quantity) { }
                column(RequestedDateCptnlbl; RequestedDateCptnlbl) { }
                column(Stock_Requested_Date; "Stock Requested Date") { }
                column(PrintedOnCptnlbl; PrintedOnCptnlbl) { }
                column(PrintedByCptnlbl; PrintedByCptnlbl) { }
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
        StockRequestCptnlbl: Label 'Stock Request';
        StockRequestNoCptnlbl: Label 'Stock Request No';
        StockRequestDateCptnlbl: Label 'Stock Request Date';
        StockRequestStatusCptnlbl: Label 'Stock Request Status:';
        RequestedByCptnlbl: Label 'Requested By:';
        JobCardNoCptnlbl: Label 'Job Card No:';
        TypeOfJobCptnlbl: Label 'Type Of Job:';
        VehicleNoCptnlbl: Label 'Vehicle No:';
        DriverIDCptnlbl: Label 'Driver ID:';
        RequestedDateCptnlbl: Label 'Requested Date';
        DescriptionCptnlbl: Label 'Description';
        QuantityCptnlbl: Label 'Quantity';
        PartNoCptnlbl: Label 'Part No';
        PrintedOnCptnlbl: Label 'Printed On:';
        PrintedBy: Text[20];
        PrintedByCptnlbl: Label 'Printed By:';
        Date: Date;
        EmailCptnlbl: Label 'Email:';
        TelCptnlbl: Label 'Tel:';


}
