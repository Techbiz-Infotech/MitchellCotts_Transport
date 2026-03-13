report 50145 "No of trips per truck"
{
    //ApplicationArea = All;
    Caption = 'No of trips per truck';
    //UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Reports/layout/No of trips per truck.rdlc';
    dataset
    {
        dataitem(Trip; Trip)
        {
            DataItemTableView = sorting("Trip Date", "Vehicle No.");
            RequestFilterFields = "Vehicle No.", "Global Dimension 2 Code", "Route Code";
            RequestFilterHeading = 'Trip Count';
            column(CompanyInformation; CompanyInformation.Picture) { }
            column(CompanyInformation_Name; CompanyInformation.Name) { }
            column(CompanyInformation_Address; CompanyInformation.Address) { }
            column(CompanyInformation_Address2; CompanyInformation."Address 2") { }
            column(CompanyInformation_Postcode; CompanyInformation."Post Code") { }
            column(EmailCptnlbl; EmailCptnlbl) { }
            column(CompanyInformation_Email; CompanyInformation."E-Mail") { }
            column(TelCptnlbl; TelCptnlbl) { }
            column(CompanyInformation_Phone; CompanyInformation."Phone No.") { }
            column(Page_Lbl; PageLbl) { }
            column(DateCptnlbl; DateCptnlbl) { }

            column(Vehicle_No_; "Vehicle No.") { }
            column(TripsCountCptnlbl; TripsCountCptnlbl) { }
            column(MonthNameJan; StrSubstNo('Jan %1', Year)) { }
            column(MonthNameFeb; StrSubstNo('Feb %1', Year)) { }

            column(MonthNameMar; StrSubstNo('Mar %1', Year)) { }

            column(MonthNameApr; StrSubstNo('Apr %1', Year)) { }

            column(MonthNameMay; StrSubstNo('May %1', Year)) { }

            column(MonthNameJun; StrSubstNo('Jun %1', Year)) { }

            column(MonthNameJuly; StrSubstNo('July %1', Year)) { }

            column(MonthNameAug; StrSubstNo('Aug %1', Year)) { }

            column(MonthNameSep; StrSubstNo('Sep %1', Year)) { }

            column(MonthNameOct; StrSubstNo('Oct %1', Year)) { }

            column(MonthNameNov; StrSubstNo('Nov %1', Year)) { }

            column(MonthNameDec; StrSubstNo('Dec %1', Year)) { }
            column(VCount_1; VCount[1]) { }
            column(VCount_2; VCount[2]) { }
            column(VCount_3; VCount[3]) { }
            column(VCount_4; VCount[4]) { }
            column(VCount_5; VCount[5]) { }
            column(VCount_6; VCount[6]) { }
            column(VCount_7; VCount[7]) { }
            column(VCount_8; VCount[8]) { }
            column(VCount_9; VCount[9]) { }
            column(VCount_10; VCount[10]) { }
            column(VCount_11; VCount[11]) { }
            column(VCount_12; VCount[12]) { }
            trigger OnAfterGetRecord()
            begin
                Clear(VCount);
                GetMonthlyCount("Vehicle No.");
                // if TotalCount = 0 then
                //     CurrReport.Skip();
            end;


        }

    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(options)
                {
                    // field(StartDate; StartDate[1])
                    // {
                    //     ApplicationArea = all;
                    //     Caption = 'Start Date';
                    // }
                    // field(EndDate; EndDate[1])
                    // {
                    //     ApplicationArea = all;
                    //     Caption = 'End Date';
                    // }
                    field(Year; Year)
                    {
                        ApplicationArea = all;
                        Caption = 'Year';
                    }
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    Procedure GetMonthlyCount(truckCode: code[20]): Integer

    begin
        GetDatefilter();
        for i := 1 to 12 do begin
            TripRec.Reset();
            TripRec.SetFilter("Trip Date", '%1..%2', StartDate[i], EndDate[i]);
            TripRec.SetRange("Vehicle No.", truckCode);
            if TripRec.FindFirst() then
            case i of
                1:
                    VCount[1] := GetVehicleCount(truckCode, i);
                2:
                    VCount[2] := GetVehicleCount(truckCode, i);
                3:
                    VCount[3] := GetVehicleCount(truckCode, i);
                4:
                    VCount[4] := GetVehicleCount(truckCode, i);
                5:
                    VCount[5] := GetVehicleCount(truckCode, i);
                6:
                    VCount[6] := GetVehicleCount(truckCode, i);
                7:
                    VCount[7] := GetVehicleCount(truckCode, i);
                8:
                    VCount[8] := GetVehicleCount(truckCode, i);
                9:
                    VCount[9] := GetVehicleCount(truckCode, i);
                10:
                    VCount[10] := GetVehicleCount(truckCode, i);
                11:
                    VCount[11] := GetVehicleCount(truckCode, i);
                12:
                    VCount[12] := GetVehicleCount(truckCode, i);
            end;
        end;
        //TotalCount := VCount[1] + VCount[2] + VCount[3] + VCount[4] + VCount[5] + VCount[6] + VCount[7] + VCount[8] + VCount[9] + VCount[10] + VCount[11] + VCount[12];
    end;

    local procedure GetVehicleCount(truckCode: Code[20]; j: Integer): Integer;
    begin
        Clear(Month);
        TripRec.Reset();
        TripRec.SetFilter("Trip Date", '%1..%2', StartDate[j], EndDate[j]);
        TripRec.SetRange("Vehicle No.", truckCode);
        if TripRec.FindFirst() then
            repeat
                //Month := TripRec.Count;
                Month += 1;
            until TripRec.Next() = 0;
        exit(Month);
    end;

    local procedure GetDatefilter()
    begin
        StartDate[1] := DMY2Date(1, 1, Year);
        EndDate[1] := CalcDate('1M', StartDate[1]) - 1;
        for i := 2 to 12 do begin
            StartDate[i] := CalcDate('1M', StartDate[i - 1]);
            EndDate[i] := CalcDate('1M', StartDate[i]) - 1;

        end;

    end;

    trigger OnPreReport()
    begin
        CompanyInformation.Get();
        CompanyInformation.CalcFields(Picture);
    end;

    var
        TripsCountCptnlbl: Label 'Trips Count';
        i, j : Integer;
        DateCptnlbl: Label 'Date';
        Year: Integer;
        PageLbl: Label 'Page';
        StartDate: array[20] of Date;
        EndDate: array[20] of Date;
        MonthFilter: Text[20];
        VCount: array[20] of Integer;
        TripRec: Record Trip;
        Month: Integer;
        TotalCount: Integer;
        CompanyInformation: Record "Company Information";
        EmailCptnlbl: Label 'Email:';
        TelCptnlbl: Label 'Tel:';
        
}
