table 50166 "Jobs & Maintenance"
{
    Caption = 'Jobs & Maintenance';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            Caption = 'Primary Key';
            DataClassification = ToBeClassified;
        }
        field(2; "Invoiced Trips"; Integer)
        {
            Caption = 'Invoiced Trips';
            DataClassification = ToBeClassified;
            // FieldClass = FlowField;
            // CalcFormula = count(Trip where("Invoice Date" = field("Date Filter")));
        }
        field(3; "Inspection Due In 7days"; Integer)
        {
            Caption = 'Inspection Due In 7days';
            FieldClass = FlowField;
            CalcFormula = count("Fixed Asset" where("Next Inspection Date" = field("Date Filter"),"Is Trailer"=const(false)));
        }
        field(4; "Overdue Inspection"; Integer)
        {
            Caption = 'Overdue Inspection';
            FieldClass = FlowField;
            CalcFormula = count("Fixed Asset" where("Next Inspection Date" = field("Overdue Date Filter"),"Is Trailer"=const(false)));
        }
        field(5; "Service Due in 7days"; Integer)
        {
            Caption = 'Service Due in 7days';
            FieldClass = FlowField;
            CalcFormula = count("Fixed Asset" where("Next Service Date" = field("Date Filter"),"Is Trailer"=const(false)));
        }
        field(6; "Overdue Service"; Integer)
        {
            Caption = 'Overdue Service';
            FieldClass = FlowField;
            CalcFormula = count("Fixed Asset" where("Next Service Date" = field("Overdue Date Filter"),"Is Trailer"=const(false)));
        }
        field(7; "Open Jobs"; Integer)
        {
            Caption = 'Open Jobs';
            FieldClass = FlowField;
            CalcFormula = count("Workshop Jobs" where("job status" = filter(Open)));
        }
        field(8; "WIP Jobs"; Integer)
        {
            Caption = 'WIP Jobs';
            FieldClass = FlowField;
            CalcFormula = count("Workshop Jobs" where("job status" = filter("Work in Progress")));
        }
        field(9; "Parts on Order Jobs"; Integer)
        {
            Caption = 'Pending Stock Issue Jobs';
            FieldClass = FlowField;
            CalcFormula = count("Workshop Jobs" where("job status" = filter("Pending Stock Issue")));
        }
        field(10; "Closed Jobs"; Integer)
        {
            Caption = 'Closed Jobs';
            FieldClass = FlowField;
            CalcFormula = count("Workshop Jobs" where("job status" = filter(Closed)));
        }
        field(11; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(12; "Overdue Date Filter"; Date)
        {
            Caption = 'Overdue Date Filter';
            FieldClass = FlowFilter;
        }
        field(13; "Due Date Filter"; Date)
        {
            Caption = 'Due Date Filter';
            FieldClass = FlowFilter;
        }


    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
