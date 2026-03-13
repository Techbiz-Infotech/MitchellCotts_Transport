Report 50101 Consignment
{
    //ApplicationArea = All;
    Caption = 'Consignment';
    //UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Reports/layout/Consignment Report.rdlc';
    dataset
    {
        dataitem(Trip; Trip)
        {
            RequestFilterFields = "Trip ID";
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING(Number);

                //dataitem(PageLoop; "Integer")
                //{
                //DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                column(ReportTitleCopyText; StrSubstNo(Text013, CopyText))
                {
                }
                column(CompanyInformation; CompanyInformation.Picture) { }
                column(CompanyInformation_Name; CompanyInformation.Name) { }
                column(CompanyInformation_Address; CompanyInformation.Address) { }
                column(CompanyInformation_Address2; CompanyInformation."Address 2") { }
                column(CompanyInformation_Postcode; CompanyInformation."Post Code") { }
                column(EmailCptnlbl; EmailCptnlbl) { }
                column(CompanyInformation_Email; CompanyInformation."E-Mail") { }
                column(TransportConsignmentNoteCptnlbl; TransportConsignmentNoteCptnlbl) { }
                column(OwnersRiskCptnlbl; OwnersRiskCptnlbl) { }
                column(OriginalDocumentCptnlbl; OriginalDocumentCptnlbl) { }
                column(TCNoteNoCptnlbl; TCNoteNoCptnlbl) { }
                column(Trip_ID; Trip."Trip ID") { }
                column(DateCptnlbl; DateCptnlbl) { }
                column(Trip_Date; Trip."Trip Date") { }
                column(ConsignTypecptnlbl; ConsignTypecptnlbl) { }
                column(Consignment_Type; Trip."Consignment Type") { }

                column(TransportFromCptnlbl; TransportFromCptnlbl) { }
                column(From_Source_; Trip."From(Source)") { }
                column(VehicleNoCptnlbl; VehicleNoCptnlbl) { }
                column(Vehicle_No_; Trip."Vehicle No.") { }
                column(ClientNameCptnlbl; ClientNameCptnlbl) { }
                column(Client_Name; Trip."Client Name") { }
                Column(ToCptnlbl; ToCptnlbl) { }
                column(To__Destination_; Trip."To (Destination)") { }
                column(DriverNameCptnlbl; DriverNameCptnlbl) { }
                column(ShowUnitCost; ShowUnitCost) { }
                column(Outputno; OutputNo) { }
                column(CopyText; CopyText) { }
                column(Driver_Name; Trip."Driver Name") { }
                column(ClientNoCptnlbl; ClientNoCptnlbl) { }
                column(Client_No; Trip."Client No.") { }
                column(SizeCptnlbl; SizeCptnlbl) { }
                column(Container_Size; Trip."Container Size") { }
                column(TypeCptnlbl; TypeCptnlbl) { }
                column(Container_Type; Trip."Container Type") { }
                column(ContainerNoCptnlbl; ContainerNoCptnlbl) { }
                column(Container_No_; Trip."Container No.") { }
                column(SealNoCptnlbl; SealNoCptnlbl) { }
                column(Seal_No_; Trip."Seal No.") { }
                column(DescriptionCptnlbl; DescriptionCptnlbl) { }
                column(Goods_desc; Trip."Goods desc") { }

                column(CargoTypeCptnlbl; CargoTypeCptnlbl) { }
                column(Cargo_Type; Trip."Consignment Type") { }
                column(RemarksCptnlbl; RemarksCptnlbl) { }
                column(Remarks; Trip.Remarks) { }
                column(ImportantCptnlbl; ImportantCptnlbl) { }
                column(Text001; Text001) { }
                column(Text002; Text002) { }
                column(Text003; Text003) { }
                column(Text004; Text004) { }
                column(Text005; Text005) { }
                column(Text006; Text006) { }
                column(Text008; Text008) { }
                column(Text009; Text009) { }
                column(Text010; Text010) { }
                column(ReceivedByCptnlbl; ReceivedByCptnlbl) { }
                column(FullNameCptnlbl; FullNameCptnlbl) { }
                column(IDNoCptnlbl; IDNoCptnlbl) { }
                column(DateCaptnlbl; DateCaptnlbl) { }
                column(SignCptnlbl; SignCptnlbl) { }
                column(RubberStampCptnlbl; RubberStampCptnlbl) { }
                column(Text011; Text011) { }
                column(Text012; Text012) { }
                column(PrintedOnCptnlbl; PrintedOnCptnlbl) { }
                column(PrintedByCptnlbl; PrintedByCptnlbl) { }
                column(PrintedBy; PrintedBy) { }
                column(Date; Date) { }
                column(Numberloop; Number) { }
                //}
                trigger OnAfterGetRecord();
                begin

                    if Number > 1 then begin
                        CopyText := 'COPY';//FormatDocument.GetCOPYText();
                        OutputNo := OutputNo + 1;

                    end;

                end;

                trigger OnPreDataItem();
                begin
                    NoOfLoops := Abs(NoOfCopies) + 1;
                    CopyText := '';
                    SetRange(Number, 1, NoOfLoops);
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

    procedure GetCOPYText(): Text[30]
    begin
        exit(' ' + COPYTxt);
    end;

    var
        COPYTxt: Label 'COPY', Comment = 'COPY';
        CompanyInformation: Record "Company Information";
        Customercargodet: Record "Customer and Cargo Details";
        TransportConsignmentNoteCptnlbl: Label 'TRANSPORT CONSIGNMENT NOTE';
        OwnersRiskCptnlbl: Label 'OWNERS RISK';
        OriginalDocumentCptnlbl: Label 'ORIGINAL DOCUMENT';
        TCNoteNo: Text[20];
        Text013: Label 'ORIGINAL DOCUMENT %1', Comment = '%1 = Trid ID';
        TCNoteNoCptnlbl: Label 'TC/NOTE NO.:';
        DateCptnlbl: Label 'Date:';
        Date: Date;
        ConsignTypecptnlbl: Label 'Consign. Type:';
        ConsignType: Text[20];
        FileNoCptnlbl: Label 'File No.:';
        FileNo: Code[20];
        ClientNoCptnlbl: Label 'Client No.:';
        ConsigneesName: Text[30];
        AddressCptnlbl: Label 'Address:';
        Address: Text[30];
        TransportFromCptnlbl: Label 'Transport From:';
        TransportFrom: Text[30];
        VehicleNoCptnlbl: Label 'Vehicle No.:';
        VehicleNo: Code[20];
        ClientNameCptnlbl: Label 'Client Name:';
        ClientName: Text[30];
        VesselCptnlbl: Label 'Vessel:';
        Vessel: Text[30];
        ToCptnlbl: Label 'To:';
        To: Text[20];
        DriverNameCptnlbl: Label 'Driver Name:';
        DriverName: Text[30];
        SizeCptnlbl: Label 'SIZE';
        TypeCptnlbl: Label 'TYPE';
        ContainerNoCptnlbl: Label 'CONTAINER NO.';
        SealNoCptnlbl: Label 'SEAL NO.';
        DescriptionCptnlbl: Label 'DESCRIPTION';
        WeightCptnlbl: Label 'WEIGHT';
        Weight: Decimal;
        Tareweight: Decimal;
        TareWeightCptnlbl: Label 'TARE WEIGHT';
        MarksandNumbersCptnlbl: Label ' MARKS & NUMBERS';
        CargoTypeCptnlbl: Label 'CARGO TYPE';
        RemarksCptnlbl: Label 'REMARKS';
        ImportantCptnlbl: Label 'IMPORTANT:';
        ReceivedByCptnlbl: Label 'Received By:';
        FullNameCptnlbl: Label 'Full Name';
        IDNoCptnlbl: Label 'ID NO.';
        DateCaptnlbl: Label 'DATE';
        SignCptnlbl: Label 'SIGN';
        RubberStampCptnlbl: Label 'RUBBER STAMP';
        PrintedOnCptnlbl: Label 'Printed On:';
        PrintedByCptnlbl: Label 'Printed By';
        PrintedBy: Text[30];
        EmailCptnlbl: Label 'Email:';
        Text001: Label 'All goods are stored and carried at owner''s risk and the company will not be liable in any way whatsoever for negligence of the';
        Text002: Label 'company or its servants or agents. Without prejudice to the generality of the foregoing, the company will not be responsible for any loss,';
        Text003: Label 'damage, delay or detention of any goods due to any collision, overturning, robbery, theft, civil commotion, riots or disturbances, war, or inherent';
        Text004: Label 'vice or defect in the goods carried, defective packing or faulty, wrong or insufficient address of the consignee. The company shall have the';
        Text005: Label 'general as well as partuicular lien on all goods for unpaid acounts. Gross weight to be in accordance with the government permitted limits.';
        Text006: Label 'Please receive the above mentioned goods for carriage paid/forward at owner''s risk and subject to above condition.';
        Text008: Label 'ACKNOWLEDGEMENT RECEIPT OF GOODS';
        Text009: Label 'We hereby acknowledge the receipt in full of goods as per above details and certify that goods have arrived in good';
        Text010: Label 'Order and condition.';
        Text011: Label 'Unigroup Transporters Ltd P.O Box 51664-80100 Mombasa, Kenya. Mijikenda street, Near Railways station Offices/Yard';
        Text012: Label 'Plot No.:XIII/153-Mombasa';
        ShowUnitCost: Boolean;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        OutputNo: Integer;
        FormatDocument: Codeunit "Format Document";
}




