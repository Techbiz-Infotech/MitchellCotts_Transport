report 50111 "Stock Issue"
{
    Caption = 'Stock Issue';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Reports/layout/Stock Issue Report.rdlc';
    dataset
    {
        dataitem("Stock Issue header"; "Stock Issue header")
        {
            DataItemTableView = SORTING("Stock Issue No.");
            RequestFilterFields = "Stock Issue No.";
            column(CompanyInformation; CompanyInformation.Picture) { }
            column(CompanyInformation_Name; CompanyInformation.Name) { }
            column(CompanyInformation_Address; CompanyInformation.Address) { }
            column(CompanyInformation_Address2; CompanyInformation."Address 2") { }
            column(CompanyInformation_Postcode; CompanyInformation."Post Code") { }
            column(EmailCptnlbl; EmailCptnlbl) { }
            column(CompanyInformation_Email; CompanyInformation."E-Mail") { }
            column(TelCptnlbl; TelCptnlbl) { }
            column(CompanyInformation_Phone; CompanyInformation."Phone No.") { }
            column(StockIssueCptnlbl; StockIssueCptnlbl) { }
            column(StockIssueNoCptnlbl; StockIssueNoCptnlbl) { }
            column(Stock_Issue_No_; "Stock Issue No.") { }
            column(StockIssueDateCptnlbl; StockIssueDateCptnlbl) { }
            column(Stock_Issue_Date; "Stock Issue Date") { }
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
            dataitem("Stock Issue line"; "Stock Issue line")
            {
                DataItemLinkReference = "Stock Issue header";
                DataItemLink = "Document No." = field("Stock Issue No.");
                column(PartNoCptnlbl; PartNoCptnlbl) { }
                column(No_; "No.") { }
                column(DescriptionCptnlbl; DescriptionCptnlbl) { }
                column(Description; Description) { }
                column(QuantityCptnlbl; QuantityCptnlbl) { }
                column(Quantity; Quantity) { }
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
        StockIssueCptnlbl: Label 'Stock Issue';
        StockIssueNoCptnlbl: Label 'Stock Issue No';
        StockIssueDateCptnlbl: Label 'Stock Issue Date';
        StockIssueStatusCptnlbl: Label 'Stock Issue Status:';
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
