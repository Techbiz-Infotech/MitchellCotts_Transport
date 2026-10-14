table 57021 "Driver Holidays"
{
    Caption = 'Driver Holidays';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Driver Id"; Code[20])
        {
            Caption = 'Driver Id';
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

        field(2; "Driver Name"; Text[50])
        {
            Caption = 'Driver Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; "Start Date"; Date)
        {
            Caption = 'Start Date';
            DataClassification = ToBeClassified;
        }
        field(4; "End Date"; Date)
        {
            Caption = 'End Date';
            DataClassification = ToBeClassified;
        }
        field(5; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }

    }
    keys
    {
        key(PK; "Driver Id")
        {
            Clustered = true;
        }
    }
}
