table 50165 "Trip Cues"
{
    Caption = 'Unigroup Cues';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            Caption = 'Primary Key';
            DataClassification = ToBeClassified;
        }
        field(2; "Live Trips"; Integer)
        {
            Caption = 'Live Trips';
            FieldClass = FlowField;
            CalcFormula = count(Trip where("Trip Status" = const(Live)));
        }
        field(3; "Delivered & Closed Trips"; Integer)
        {
            Caption = 'Completed Trips';
            FieldClass = FlowField;
            CalcFormula = count(Trip where("Trip Status" = const("Completed")));
        }
        field(4; "Approved Trips"; Integer)
        {
            Caption = 'Approved Trips';
            FieldClass = FlowField;
            CalcFormula = count(Trip where("Trip Status" = const(Approved)));
        }
        field(5; "Over Due Trips"; Integer)
        {
            Caption = 'Over Due Trips';
            FieldClass = FlowField;
            CalcFormula = count(Trip where("Trip Status" = const(Live), "Due Date" = field("Overdue Date Filter")));
        }
        field(6; "Overdue Date Filter"; Date)
        {
            Caption = 'Overdue Date Filter';
            FieldClass = FlowFilter;
        }
        field(7; Created; Integer)
        {
            Caption = 'Created';
            FieldClass = FlowField;
            CalcFormula = count(Trip where("Trip Stage" = const(Created)));
        }
        field(8; "Inspection Completed"; Integer)
        {
            Caption = 'Inspection Completed';
            FieldClass = FlowField;
            CalcFormula = count(Trip);
        }
        field(9; "Fuel Issue Completed"; Integer)
        {
            Caption = 'Fuel & Allowances';
            FieldClass = FlowField;
            CalcFormula = count(Trip where("Trip Stage" = const("Fuel & Allowances")));
        }
        field(10; "Allowances disbursed"; Integer)
        {
            Caption = 'Allowances disbursed';
            FieldClass = FlowField;
            CalcFormula = count(Trip where("Trip Stage" = const("Fuel & Allowances")));
        }
        field(11; Live; Integer)
        {
            Caption = 'Live';
            FieldClass = FlowField;
            CalcFormula = count(Trip where("Trip Status" = const(Live)));
        }
        field(12; "Delivery and Closing Completed"; Integer)
        {
            Caption = 'Delivery and Closing Completed';
            FieldClass = FlowField;
            CalcFormula = count(Trip where("Trip Stage" = const("Delivery and Closing Completed")));
        }
        field(13; "Billing Completed"; Integer)
        {
            Caption = 'Billing Completed';
            FieldClass = FlowField;
            CalcFormula = count(Trip where("Trip Stage" = const("Billing Completed")));
        }
        field(14; "Closure Requests"; Integer)
        {
            Caption = 'Closure Requests';
            FieldClass = FlowField;
            CalcFormula = count(Trip where("Closure Pending Approval" = const(true)));
        }
        field(15; "Terminate Requests"; Integer)
        {
            Caption = 'Terminate Requests';
            FieldClass = FlowField;
            CalcFormula = count(Trip where("Terminate Pending Approval" = const(true)));
        }
        field(16; "Phys. Inv Requests"; Integer)
        {
            Caption = 'Phys. Inventory Requests';
            DataClassification = ToBeClassified;
            // FieldClass = FlowField;
            // CalcFormula = count("Item Journal Line" WHERE("Approval Status Inv" = CONST("Pending Approval")));
        }
        field(17; "Phys. Inv Request"; Integer)
        {
            Caption = 'Request to Approve';
            FieldClass = FlowField;
            CalcFormula = count("Item Journal Line" WHERE("Journal Template Name" = const('PHYS. INVE'), "Approval Status Inv" = const("Pending Approval")));
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
