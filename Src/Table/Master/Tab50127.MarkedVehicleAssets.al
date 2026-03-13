table 50127 "Marked Vehicle Assets"
{
    Caption = 'Marked Vehicle Assets';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Allocation No."; Code[20])
        {
            Caption = 'Allocation No.';
            DataClassification = ToBeClassified;
            TableRelation = Allocation;
        }
        field(2; "Allocation Status"; Text[50])
        {
            Caption = 'Allocation Status';
            DataClassification = ToBeClassified;
        }
        field(3; "Allocate to"; Text[50])
        {
            Caption = 'Allocate to';
            DataClassification = ToBeClassified;
        }
        field(4; "Driver ID"; Code[20])
        {
            Caption = 'Driver ID';
            DataClassification = ToBeClassified;
            TableRelation = Employee where("Job Title" = const('Driver'));
            trigger OnValidate()
            var
                DriverIDRec: Record Employee;
            begin
                IF DriverIDRec.Get("Driver ID") THEN
                    "Driver Name" := DriverIDRec.FullName()
                ELSE
                    "Driver Name" := '';
            end;
        }
        field(5; "Driver Name"; Text[50])
        {
            Caption = 'Driver Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Asset Type"; Text[50])
        {
            Caption = 'Asset Type';
            DataClassification = ToBeClassified;
        }
        field(7; "Asset Make"; Text[50])
        {
            Caption = 'Asset Make';
            DataClassification = ToBeClassified;
        }
        field(8; "Asset Model"; Text[50])
        {
            Caption = 'Asset Model';
            DataClassification = ToBeClassified;
        }
        field(9; "Asset Serial"; Integer)
        {
            Caption = 'Asset Serial';
            DataClassification = ToBeClassified;
        }
        field(10; "Asset issue date"; Date)
        {
            Caption = 'Asset Issue Date';
            DataClassification = ToBeClassified;
        }
        field(11; "Qty Issued"; Integer)
        {
            Caption = 'Qty Issued';
            DataClassification = ToBeClassified;
        }
        field(12; Reason; Text[250])
        {
            Caption = 'Reason';
            DataClassification = ToBeClassified;
        }
        field(13; "Asset Renewal Date"; Date)
        {
            Caption = 'Asset Renewal Date';
            DataClassification = ToBeClassified;
        }
        field(14; "Asset Status"; Text[50])
        {
            Caption = 'Asset Status';
            DataClassification = ToBeClassified;
        }
        field(15; "Asset return date"; Date)
        {
            Caption = 'Asset Return Date';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Allocation No.")
        {
            Clustered = true;
        }
    }
}
