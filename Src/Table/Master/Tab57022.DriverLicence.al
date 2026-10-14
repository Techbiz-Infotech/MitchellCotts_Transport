table 57022 "Driver Licence"
{
    Caption = 'Driver Licence';
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
        field(2; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(3; "Driver Name"; Text[50])
        {
            Caption = 'Driver Name';
            DataClassification = ToBeClassified;
        }
        field(4; "Driver Licence type"; Text[50])
        {
            Caption = 'Driver Licence type';
            DataClassification = ToBeClassified;
            TableRelation = "Driver Licence type";
        }
        field(5; "Licence No."; Code[20])
        {
            Caption = 'Licence No.';
            DataClassification = ToBeClassified;
        }
        field(6; "Licence Expiry"; Date)
        {
            Caption = 'Licence Expiry';
            DataClassification = ToBeClassified;
        }


    }
    keys
    {
        key(PK; "Driver Id", "Entry No.")
        {
            Clustered = true;
        }
    }
}
