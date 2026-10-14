report 57022 "Stock return"
{
    Caption = 'Stock Return';
    //ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Reports/layout/Stock Return Report.rdlc';
    dataset
    {
        dataitem("Stock Return Header"; "Stock Return Header")
        {
            DataItemTableView = SORTING("Stock Return No.");
            RequestFilterFields = "Stock Return No.";
            column(CompanyInformation; CompanyInformation.Picture) { }
            column(CompanyInformation_Name; CompanyInformation.Name) { }
            column(CompanyInformation_Address; CompanyInformation.Address) { }
            column(CompanyInformation_Address2; CompanyInformation."Address 2") { }
            column(CompanyInformation_Postcode; CompanyInformation."Post Code") { }
            column(EmailCptnlbl; EmailCptnlbl) { }
            column(CompanyInformation_Email; CompanyInformation."E-Mail") { }
            column(TelCptnlbl; TelCptnlbl) { }
            column(CompanyInformation_Phone; CompanyInformation."Phone No.") { }
            column(StockReturnCptnlbl; StockReturnCptnlbl) { }
            column(StockReturnNoCptnlbl; StockReturnNoCptnlbl) { }
            column(Stock_Return_No_; "Stock Return No.") { }
            column(StockReturnDateCptnlbl; StockReturnDateCptnlbl) { }
            column(Stock_Return_Date; "Stock Return Date") { }
            column(JobCardNoCptnlbl; JobCardNoCptnlbl) { }
            column(Job_Card_No_; "Job Card No.") { }
            column(TypeOfJobCptnlbl; TypeOfJobCptnlbl) { }
            column(Job_Card_Type; "Job Type") { }
            column(VehicleNoCptnlbl; VehicleNoCptnlbl) { }
            column(Vehicle_No_; "Vehicle No.") { }
            column(DriverIDCptnlbl; DriverIDCptnlbl) { }
            column(Driver_ID; "Driver ID") { }
            column(MechanicNameCptnlbl; MechanicNameCptnlbl) { }
            column(Mechanic_Name; "Mechanic Name") { }
            column(ReturnByCptnlbl; ReturnByCptnlbl) { }
            column(Return_By; "Return By")
            {

            }
            dataitem("Stock Return Line"; "Stock Return Line")
            {
                DataItemLinkReference = "Stock Return Header";
                DataItemLink = "Document No." = field("Stock Return No.");
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
        StockReturnCptnlbl: Label 'Stock Return';
        StockReturnNoCptnlbl: Label 'Stock Return No';
        StockReturnDateCptnlbl: Label 'Stock Return Date';
        ReturnByCptnlbl: Label 'Return By:';
        JobCardNoCptnlbl: Label 'Job Card No:';
        TypeOfJobCptnlbl: Label 'Type Of Job:';
        VehicleNoCptnlbl: Label 'Vehicle No:';
        MechanicNameCptnlbl: Label 'Mechanic Name:';
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
