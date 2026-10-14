table 57052 "Transport Request Header"
{

    Caption = 'Request For Transport';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Transport Request List";
    LookupPageId = "Transport Request List";

    fields
    {
        field(1; " RFT No"; Code[50])
        {
            Caption = ' RFT No';
            //Editable = False;
        }
        field(2; "Shipping Line"; Code[50])
        {
            Caption = 'Shipping Line';
        }
        field(3; "No. Series"; Code[20])
        {
        }
        field(4; "Application Date"; Date)
        {
            //Editable = False;
        }
        field(5; Status; Enum "Trip Status")
        {
            Editable = False;
        }
        field(6; "No of Containers"; Integer)
        {

        }
        field(7; "B/L No"; code[50])
        {

        }
        field(16; "Client No. "; Code[50])
        {

            TableRelation = "Clearing Agent";
            Caption = 'Clearing & Forwarding Agent';
            trigger OnValidate()
            var
                Customer: record customer;
            begin
                Customer.reset;
                Customer.SetRange("No.", "Client No. ");
                if Customer.FindFirst() then
                    "Client Name " := Customer.Name
                ELSE
                    "Client Name " := '';

            end;

        }
        field(8; "Client Name "; Code[50])
        {
            Caption = 'Clearing & Forwarding Agent Name';
            Editable = False;
        }
        field(9; "Consignee No"; Code[50])
        {
            TableRelation = Customer."No.";
            trigger OnValidate()
            var
                Customer: record customer;
            begin
                Customer.reset;
                Customer.SetRange("No.", "Consignee No");
                if Customer.FindFirst() then "Consignee Name" := Customer.Name;

            end;

        }
        field(40; "Consignee Name"; Code[50])
        {
            TableRelation = Customer."No.";

        }

        field(10; "CNF File Ref"; Code[50])
        {

        }
        field(11; "Vessel Name"; Code[50])
        {

        }
        field(12; "Vessel ETA"; Date)
        {

        }
        field(13; Shipment; code[50])
        {
            Caption = 'Shipment';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

        }
        field(14; "EIR Depot"; code[50])
        {
            //TableRelation = "EIR Depot".Code;

        }
        field(15; "Entry No"; code[50])
        {

        }
        field(17; "Line Count"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count("Transport Request Lines" WHERE(" RFT No" = field(" RFT No")));
            Editable = false;
        }
        field(18; "Expiry Date"; Date)
        {
            trigger OnValidate()
            begin
                rec.TestField("Free Days");
                if rec."Expiry Date" <> 0D then "Validity Date" := CalcDate('-' + Format("Free Days") + 'D', rec."Expiry Date");

            end;
        }
        field(19; "Free Days"; Integer)
        {
            Caption = 'Free Days';
        }
        field(20; "Validity Date"; Date)
        {
            Caption = 'Validity Date';

            trigger OnValidate()
            begin
                rec.TestField("Free Days");
                if rec."Validity Date" <> 0D then "Expiry Date" := CalcDate(Format("Free Days") + 'D', rec."Validity Date");
            end;
        }
        field(21; "Client Ref No"; Code[20])
        {
            Caption = 'Client Ref No';
            DataClassification = ToBeClassified;

        }



    }
    keys
    {
        key(PK; " RFT No")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
    begin

        if " RFT No" = '' then begin
            Unigroupsetup.Get;
            Unigroupsetup.TestField(Unigroupsetup."Request For Transport Nos");
            "No. Series" := Unigroupsetup."Request For Transport Nos";
            if NoSeriesMgt.AreRelated(Unigroupsetup."Request For Transport Nos", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            " RFT No" := NoSeriesMgt.GetNextNo("No. Series");
            //NoSeriesMgt.InitSeries(Unigroupsetup."Request For Transport Nos", xRec."No. Series", 0D, " RFT No", "No. Series");
        end;

        REC."Application Date" := Today;
    end;

    VAR
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgt: Codeunit "No. Series";
}