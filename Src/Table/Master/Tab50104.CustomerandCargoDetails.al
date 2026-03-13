table 50104 "Customer and Cargo Details"
{
    Caption = 'Customer and Cargo Details';
    DataClassification = ToBeClassified;


    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = ToBeClassified;
            AutoIncrement = true;
            Editable = false;
        }
        field(2; "Trip ID"; Code[20])
        {
            Caption = 'Trip ID';
            DataClassification = ToBeClassified;
            TableRelation = Trip;
        }
        field(3; "D/Note No."; Integer)
        {
            Caption = 'D/Note No.';
            DataClassification = ToBeClassified;
        }
        field(4; Number; Integer)
        {
            Caption = 'Number';
            DataClassification = ToBeClassified;
        }
        field(5; "Departure Date"; Date)
        {
            Caption = 'Departure Date';
            DataClassification = ToBeClassified;
        }
        field(6; "Departure Time"; Time)
        {
            Caption = 'Departure Time';
            DataClassification = ToBeClassified;
        }
        field(7; "Departure Odometer"; Decimal)
        {
            Caption = 'Departure Odometer';
            DataClassification = ToBeClassified;
        }
        field(8; "Route Name"; Text[100])
        {
            Caption = 'Route Name';
            DataClassification = ToBeClassified;
        }
        field(9; From; Text[100])
        {
            Caption = 'From';
            DataClassification = ToBeClassified;
        }
        field(10; Destination; Text[50])
        {
            Caption = 'Destination';
            DataClassification = ToBeClassified;
        }
        field(11; "Loading Date"; Date)
        {
            Caption = 'Loading Date';
            DataClassification = ToBeClassified;
        }
        field(12; "Loading File No."; Integer)
        {
            Caption = 'Loading File No.';
            DataClassification = ToBeClassified;
        }
        field(13; "Loading InterCharge No."; Integer)
        {
            Caption = 'Loading InterCharge No.';
            DataClassification = ToBeClassified;
        }
        field(14; "Loading Comments"; Text[150])
        {
            Caption = 'Loading Comments';
            DataClassification = ToBeClassified;
        }
        field(15; "Loading Checklist No."; Code[20])
        {
            Caption = 'Loading Checklist No.';
            DataClassification = ToBeClassified;
        }
        field(16; "Clearing Agent Name"; Text[50])
        {
            Caption = 'Clearing Agent Name';
            DataClassification = ToBeClassified;

        }
        field(17; "Clearing Agent Address"; Text[250])
        {
            Caption = 'Clearing Agent Address';
            DataClassification = ToBeClassified;
        }
        field(18; "Consignee Name"; Text[50])
        {
            Caption = 'Consignee Name';
            DataClassification = ToBeClassified;
        }
        field(19; "Consignee Address"; Text[250])
        {
            Caption = 'Consignee Address';
            DataClassification = ToBeClassified;
        }
        field(20; "Customer Name"; Text[50])
        {
            Caption = 'Customer Name';
            DataClassification = ToBeClassified;

        }
        field(21; "Arrival Date(Customer)"; Date)
        {
            Caption = 'Arrival Date(Customer)';
            DataClassification = ToBeClassified;
        }
        field(22; "Arrival Time(Customer)"; Time)
        {
            Caption = 'Arrival Time(Customer)';
            DataClassification = ToBeClassified;
        }
        field(23; "Client arrival odometer"; Decimal)
        {
            Caption = 'Client arrival odometer';
            DataClassification = ToBeClassified;
        }
        field(24; "Departure Date(Customer)"; Date)
        {
            Caption = 'Departure Date(Customer)';
            DataClassification = ToBeClassified;
        }
        field(25; "Departure Time(Customer)"; Time)
        {
            Caption = 'Departure Time(Customer)';
            DataClassification = ToBeClassified;
        }
        field(26; "Offloading Date"; Date)
        {
            Caption = 'Offloading Date';
            DataClassification = ToBeClassified;
        }
        field(27; "Offloading Time"; Time)
        {
            Caption = 'Offloading Time';
            DataClassification = ToBeClassified;
        }
        field(28; "Offloading delay (Days)"; Integer)
        {
            Caption = 'Offloading delay (Days)';
            DataClassification = ToBeClassified;
        }
        field(29; Comment; Text[250])
        {
            Caption = 'Comment';
            DataClassification = ToBeClassified;
        }
        field(30; "Trailer Type"; Enum "Trailer Type")
        {
            Caption = 'Trailer Type';
            DataClassification = ToBeClassified;
        }
        field(31; "Cargo Type"; Enum "cargo Type")
        {
            Caption = 'Cargo Type';
            DataClassification = ToBeClassified;
        }
        field(32; "Vessel No."; Code[20])
        {
            Caption = 'Vessel No.';
            DataClassification = ToBeClassified;
        }
        field(33; "Container Size"; Enum "Container Size")
        {
            Caption = 'Container Size';
            DataClassification = ToBeClassified;
        }
        field(34; "Container Type"; Enum "Cargo Type")
        {
            Caption = 'Container Type';
            DataClassification = ToBeClassified;
        }
        field(35; "Container No."; Code[20])
        {
            Caption = 'Container No.';
            DataClassification = ToBeClassified;
        }
        field(36; "Goods desc"; Text[250])
        {
            Caption = 'Goods desc';
            DataClassification = ToBeClassified;
        }
        field(37; "Container Status"; Text[250])
        {
            Caption = 'Container Status';
            DataClassification = ToBeClassified;
        }
        field(38; "Marks & No."; Decimal)
        {
            Caption = 'Marks & No.';
            DataClassification = ToBeClassified;
        }
        field(39; "Tare Weight"; Decimal)
        {
            Caption = 'Tare Weight';
            DataClassification = ToBeClassified;
        }
        field(40; "Seal No."; Code[20])
        {
            Caption = 'Seal No.';
            DataClassification = ToBeClassified;
        }
        field(41; Weight; Decimal)
        {
            Caption = 'Weight';
            DataClassification = ToBeClassified;
        }
        field(42; "Shipping Line"; Text[250])
        {
            Caption = 'Shipping Line';
            DataClassification = ToBeClassified;
        }
        field(43; Remarks; Text[250])
        {
            Caption = 'Remarks';
            DataClassification = ToBeClassified;
        }
        field(44; "Container Size 2"; Enum "Container Size")
        {
            Caption = 'Container Size 2';
            DataClassification = ToBeClassified;
        }
        field(45; "Container Type 2"; Enum "Cargo Type")
        {
            Caption = 'Container Type 2';
            DataClassification = ToBeClassified;
        }
        field(46; "Container No. 2"; Code[20])
        {
            Caption = 'Container No. 2';
            DataClassification = ToBeClassified;
        }
        field(47; "Goods description 2"; Text[250])
        {
            Caption = 'Goods description 2';
            DataClassification = ToBeClassified;
        }
        field(48; "Container Status 2"; Text[250])
        {
            Caption = 'Container Status 2';
            DataClassification = ToBeClassified;
        }
        field(49; "Marks & No.2"; Decimal)
        {
            Caption = 'Marks & No. 2';
            DataClassification = ToBeClassified;
        }
        field(50; "Tare Weight 2"; Decimal)
        {
            Caption = 'Tare Weight 2';
            DataClassification = ToBeClassified;
        }
        field(51; "Seal No. 2"; Code[20])
        {
            Caption = 'Seal No. 2';
            DataClassification = ToBeClassified;
        }
        field(52; "Weight 2"; Decimal)
        {
            Caption = 'Weight 2';
            DataClassification = ToBeClassified;
        }
        field(53; "Shipping Line 2"; Text[250])
        {
            Caption = 'Shipping Line 2';
            DataClassification = ToBeClassified;
        }
        field(54; "Remarks 2"; Text[250])
        {
            Caption = 'Remarks 2';
            DataClassification = ToBeClassified;
        }
        field(55; "Loose Cargo Charge"; Decimal)
        {
            Caption = 'Loose Cargo Charge';
            DataClassification = ToBeClassified;
        }
        field(56; "Total Charge"; Decimal)
        {
            Caption = 'Total Charge';
            DataClassification = ToBeClassified;
        }
        field(57; "Customer No."; Text[50])
        {
            Caption = 'Customer No.';
            DataClassification = ToBeClassified;
            TableRelation = Customer;
            trigger OnValidate()
            var
                CustomerNoRec: Record Customer;
            begin
                IF CustomerNoRec.Get("Customer No.") THEN
                    "Customer Name" := CustomerNoRec.Name
                ELSE
                    "Customer Name" := '';
            end;
        }
        field(58; "Clearing Agent No."; code[20])
        {
            Caption = 'Clearing Agent No.';
            DataClassification = ToBeClassified;
            TableRelation = "Clearing Agent";
            trigger OnValidate()
            var
                ClearinNoRec: Record "Clearing Agent";
            begin
                IF ClearinNoRec.Get("Clearing Agent No.") THEN
                    "Clearing Agent Name" := ClearinNoRec."Clearing Agent Name"
                ELSE
                    "Clearing Agent Name" := ' ';
            end;


        }
        field(100; "Created By"; Code[20])
        {
            Caption = 'Created By';
            DataClassification = ToBeClassified;
        }
        field(101; "Created Date"; Date)
        {
            Caption = 'Created Date';
            DataClassification = ToBeClassified;
        }
        field(102; "Last Modified by"; Code[20])
        {
            Caption = 'Last Modified by';
            DataClassification = ToBeClassified;
        }
        field(103; "Last Modified Date"; Date)
        {
            Caption = 'Last Modified Date';
            DataClassification = ToBeClassified;
        }
        field(104; "Global Dimension 1 Code"; Code[20])
        {
            Caption = 'Global Dimension 1 Code';
            DataClassification = ToBeClassified;
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(105; "Global Dimension 2 Code"; Code[20])
        {
            Caption = 'Global Dimension 2 Code';
            DataClassification = ToBeClassified;
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(106; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
        }
        field(107; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
        }
        field(108; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
        }
        field(109; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));

        }
        field(110; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
        }
        field(111; "Shortcut Dimension 8 Code"; Code[20])
        {
            CaptionClass = '1,2,8';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(8),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
        }
    }
    keys
    {
        key(PK; "Entry No.", "Trip ID")
        {
            Clustered = true;
        }
    }
}
