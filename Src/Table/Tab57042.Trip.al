table 57042 Trip
{
    Caption = 'Trip';
    DataClassification = ToBeClassified;
    LookupPageId = "Trip list";
    DrillDownPageId = "Trip list";
    fields
    {
        field(1; "Trip ID"; Code[20])
        {
            Caption = 'Trip ID';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Unigroupsetup: Record "Unigroup Setup";
                NoSeriesMgmt: Codeunit "No. Series";
            begin
                if "Trip ID" <> xRec."Trip ID" then begin
                    Unigroupsetup.Get;
                    NoSeriesMgmt.TestManual(Unigroupsetup."Trip No.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Vehicle No."; Code[20])
        {
            Caption = 'Vehicle No.';
            DataClassification = ToBeClassified;
            TableRelation = IF ("Trip Type" = filter('CONTAINER' | 'LOW LOADER' | 'SHUNTING')) "Transport Request Lines"."Truck No" where(" RFT No" = field("RFT No"))
            ELSE
            "Fixed Asset";            // trigger OnLookup()
            // var
            //     FA: Record "Fixed Asset";
            // begin
            //     FA.SetRange("Is trailer", false);
            //     FA.SetRange("Vehicle Status", FA."Vehicle Status"::Available);
            //     FA.SetFilter("Next Inspection Date", '>=%1', Rec."Trip Date");
            //     FA.SetFilter("Next Service Date", '>=%1', Rec."Trip Date");
            //     if PAGE.RunModal(PAGE::"Vehicle List", FA) = ACTION::LookupOK then
            //         Rec.Validate("Vehicle No.", FA."No.");
            // end;

            trigger OnValidate()
            var
                VehicleRec: Record "Fixed Asset";
            begin
                IF VehicleRec.Get("Vehicle No.") THEN begin
                    If VehicleRec."Vehicle Status" <> VehicleRec."Vehicle Status"::Available then
                        Error('Vehicle status is %1. Please select a different vehicle', VehicleRec."Vehicle Status");
                    if VehicleRec."Driver ID" = '' then
                        error('Driver is not attached to Vehicle. Please assign driver and try again..!!');
                    "Allocated Trailer No." := VehicleRec."Trailer No.";

                    if VehicleRec."Fuel Type" <> VehicleRec."Fuel Type"::" " then
                        Rec."Vehicle Fuel Type" := VehicleRec."Fuel Type"
                    else
                        error('Fuel Type(Diesel or Petrol) must have a value in Vehicle card');
                    "Vehicle Fuel Type" := VehicleRec."Fuel Type";
                    rec.Validate("Driver ID", VehicleRec."Driver ID");
                    "Driver Name" := VehicleRec."Driver Name";
                    "Mobile No." := VehicleRec."Mobile Phone No.";
                    "Next Inspection Date" := VehicleRec."Next Inspection Date";
                    "Next Service Date" := VehicleRec."Next Service Date";
                    "Insurance Expiry Date" := VehicleRec."Insurance Expiry Date";
                    "Transit Goods Expiry" := VehicleRec."Transit goods License Expiry";
                    VehicleRec.CalcFields("Balance Fuel");
                    Rec.Validate("Balance Fuel in Truck", VehicleRec."Balance Fuel");
                    //"Global Dimension 1 Code" := VehicleRec."No.";
                    "Shortcut Dimension 4 Code" := rec."Trip ID";
                end ELSE begin
                    "Allocated Trailer No." := '';
                    "Vehicle Type" := '';
                    //"Vehicle Status" := '';
                    "Driver ID" := '';
                    "Driver Name" := '';
                    "Mobile No." := '';
                    "Next Inspection Date" := 0D;
                    "Next Service Date" := 0D;
                    "Insurance Expiry Date" := 0D;
                    "Transit Goods Expiry" := 0D;
                    "Balance Fuel in Truck" := 0;
                    "Global Dimension 1 Code" := '';

                end
            end;
        }
        field(3; "Allocated Trailer No."; Code[20])
        {
            Caption = 'Allocated Trailer No.';
            DataClassification = ToBeClassified;
            Editable = false;
            trigger OnLookup()
            var
                FA: Record "Fixed Asset";
            begin
                FA.SetRange("Is trailer", true);
                if PAGE.RunModal(PAGE::"Trailer List", FA) = ACTION::LookupOK then
                    Rec.Validate("Allocated Trailer No.", FA."No.");
            end;
        }
        field(4; "System Delivery Date"; Date)
        {
            Caption = 'System Delivery Date';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Consignment Type"; Enum "Consignment Type")
        {
            Caption = 'Consignment Type';
            DataClassification = ToBeClassified;
        }
        field(6; "Trip Date"; Date)
        {
            Caption = 'Trip Date';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "Vehicle Type"; Text[50])
        {
            Caption = 'Vehicle Type';
            DataClassification = ToBeClassified;
            TableRelation = "Vehicle Type";
            Editable = false;
        }
        field(8; "Driver Name"; Text[50])
        {
            Caption = 'Driver Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Mobile No."; Text[20])
        {
            Caption = 'Mobile No.';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; "Next Inspection Date"; Date)
        {
            Caption = 'Next Inspection Date';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(11; "Next Service Date"; Date)
        {
            Caption = 'Next Service Date';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "Driver License Expiry"; Date)
        {
            Caption = 'Driver License Expiry';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; "Vehicle Fuel Type"; Enum "Fuel Type")
        {
            Caption = 'Vehicle Fuel Type';
            DataClassification = ToBeClassified;
            // Editable = false;
        }
        field(14; "Trip Status"; Enum "Trip Status")
        {
            Caption = 'Trip Status';
            DataClassification = ToBeClassified;
            // Editable = false;
        }
        // field(15; "Fuel Issue No."; Code[20])
        // {
        //     Caption = 'Fuel Issue No.';
        //     FieldClass = FlowField;
        //     CalcFormula = lookup("Fuel Issue"."Fuel Issue No." where("Trip ID" = field("Trip ID"), Posted = const(true)));
        //     Editable = false;
        // }
        field(16; "Insurance Expiry Date"; Date)
        {
            Caption = 'Insurance Expiry Date';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17; "Transit Goods Expiry"; Date)
        {
            Caption = 'Transit Goods Expiry';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(18; "Departure Date"; Date)
        {
            Caption = 'Departure Date';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                rec.UpdateInfo();
            end;
        }
        field(19; "Departure Time"; Time)
        {
            Caption = 'Departure Time';
            DataClassification = ToBeClassified;
        }
        field(20; "Departure Odometer(Km)"; Integer)
        {
            Caption = 'Departure Odometer(Km)';
            DataClassification = ToBeClassified;
        }
        field(21; "Delivery Odometer(Km)"; Integer)
        {
            Caption = 'Delivery Odometer(Km)';
            DataClassification = ToBeClassified;
        }
        field(22; "From(Source)"; Code[50])
        {
            Caption = 'From(Source)';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(23; "To (Destination)"; Code[50])
        {
            Caption = 'To (Destination)';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(29; "Client Name"; Text[50])
        {
            Caption = 'Client Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(30; "Container Charge"; Decimal)
        {
            Caption = 'Container Charge';
            DataClassification = ToBeClassified;
        }
        field(31; "Loose Cargo Charge"; Decimal)
        {
            Caption = 'Loose Cargo Charge';
            DataClassification = ToBeClassified;
        }
        field(32; "Total Charge"; Decimal)
        {
            Caption = 'Total Charge';
            DataClassification = ToBeClassified;
        }
        field(33; "Expected No Of Trips"; Integer)
        {
            Caption = 'Expected No Of Trips';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Shunting Details" where("Trip Id" = field("Trip ID")));
        }
        field(34; "Registered Shunting trips"; Integer)
        {
            Caption = 'Registered Shunting Trips';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Shunting Details" where("Trip Id" = field("Trip ID"), "Trip Completed" = const(true)));
        }
        field(35; "Container No."; Code[20])
        {
            Caption = 'Container No.';
            DataClassification = ToBeClassified;
        }
        field(36; "Goods desc"; Text[250])
        {
            Caption = 'Goods description';
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
            ObsoleteState = Removed;
            ObsoleteReason = 'Not required anymore';
        }
        field(39; "Posted Invoices"; Integer)
        {
            Caption = 'Posted Invoices';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(40; "Seal No."; Code[20])
        {
            Caption = 'Seal No.';
            DataClassification = ToBeClassified;
        }
        field(41; Weight; Decimal)
        {
            Caption = 'Weight';
            ObsoleteState = Removed;
            ObsoleteReason = 'Not required anymore';
        }
        field(42; "Shipping Line"; Text[250])
        {
            Caption = 'Shipping Line';
            ObsoleteState = Removed;
            ObsoleteReason = 'Not required anymore';
        }
        field(43; Remarks; Text[250])
        {
            Caption = 'Remarks';
            DataClassification = ToBeClassified;
        }
        field(44; "Driver ID"; Code[20])
        {
            Caption = 'Driver ID';
            DataClassification = ToBeClassified;
            TableRelation = Driver;
            Editable = false;
            trigger OnValidate()
            var
                DriverIDRec: Record Driver;
                DriverLicense: Record "Driver Licence";
            begin
                IF DriverIDRec.Get("Driver ID") THEN begin
                    "Driver Name" := DriverIDRec.Description;
                    "Mobile No." := DriverIDRec."Mobile Phone No.";
                    DriverLicense.reset;
                    DriverLicense.SetRange("Driver Id", Rec."Driver ID");
                    if DriverLicense.Findlast then
                        "Driver License Expiry" := DriverLicense."Licence Expiry"
                    else
                        "Driver License Expiry" := 0D;
                end ELSE begin
                    "Driver Name" := '';
                    "Mobile No." := '';
                end
            end;
        }
        field(45; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
        }
        field(46; Invoiced; Boolean)
        {
            Caption = 'Invoiced';
            DataClassification = ToBeClassified;
            Editable = false;
            trigger OnValidate()
            var
                Usersetup: Record "User Setup";
            begin
                Usersetup.get(UserId);
                if not Usersetup."Master Access" then
                    Error('You are not authorised to do tis action.');
            end;
        }
        field(47; "Alternate Trip ID"; Code[20])
        {
            Caption = 'Alternate Trip ID';
            DataClassification = ToBeClassified;
            TableRelation = Trip where("Trip Status" = const(Approved), "Client No." = field("Client No."));
        }
        field(48; "Mileage In"; Decimal)
        {
            Caption = 'Mileage In';
            DataClassification = ToBeClassified;
        }
        field(49; "Mileage Out"; Decimal)
        {
            Caption = 'Mileage Out';
            DataClassification = ToBeClassified;
        }
        field(50; "KM Travelled"; Integer)
        {
            Caption = 'KM Travelled';
            DataClassification = ToBeClassified;
        }
        field(51; "Seal No. 2"; Code[20])
        {
            Caption = 'Seal No. 2';
            DataClassification = ToBeClassified;
        }
        field(52; "Route Code"; Code[20])
        {
            Caption = 'Route Code';
            DataClassification = ToBeClassified;
            TableRelation = Route where("Route Approval Status" = const(Approved));
            trigger OnValidate()
            var
                RouteCodeRec: Record Route;
                UnigroupSetup: Record "Unigroup Setup";
            begin
                UnigroupSetup.Get();
                IF RouteCodeRec.Get("Route Code") then begin
                    Rec.Validate("From(Source)", RouteCodeRec."Route From");
                    Rec.Validate("To (Destination)", RouteCodeRec."Route To");
                    Rec.Validate("Route Km", RouteCodeRec."Route KM");
                    Rec.Validate("Route Drivers Allowance", RouteCodeRec."Allowance Per Day" * RouteCodeRec."TAT In Days");
                    Rec.Validate("Standard Route Price", RouteCodeRec."Standard Route Price");
                    Rec.Validate("Total Fuel Expected", RouteCodeRec."Fuel Allocation");
                    Rec.Validate("TAT In Days", RouteCodeRec."TAT In Days");
                    Rec.Validate("Actual Drivers Allowance", RouteCodeRec."Allowance Per Day" * RouteCodeRec."TAT In Days");
                    Rec.Validate("Offered Route Price", RouteCodeRec."Standard Route Price");
                end else begin
                    "From(Source)" := '';
                    "To (Destination)" := '';
                    "Route Drivers Allowance" := 0;
                    "Route Km" := 0;
                    "Standard Route Price" := 0;
                    "Total Fuel Expected" := 0;
                    "TAT In Days" := 0;
                    "Offered Route Price" := 0;
                    "Actual Drivers Allowance" := 0;
                end;
                if "Departure Date" <> 0D then begin
                    if RouteCodeRec."TAT In Days" > 1 then
                        Rec.Validate("Due Date", CalcDate(Format(RouteCodeRec."TAT In Days") + 'D', "Departure Date"))
                    else
                        Rec.Validate("Due Date", "Departure Date");
                end;
            end;
        }
        field(53; "Standard Route Price"; Decimal)
        {
            Caption = 'Standard Route Price';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(54; "Offered Route Price"; Decimal)
        {
            Caption = 'Offered Route Price';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Rec.Validate("Route Price Deviation", ("Standard Route Price" - "Offered Route Price"));
                If Rec."Trip Status" = Rec."Trip Status"::Invoiced then
                    Error('You can not change the Offered route price if the trip is invoiced');
            end;
        }
        field(55; "Route Price Deviation"; Decimal)
        {
            Caption = 'Route Price Deviation';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(56; "Route Drivers Allowance"; Decimal)
        {
            Caption = 'Route Drivers Allowance';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(57; "Actual Drivers Allowance"; Decimal)
        {
            Caption = 'Actual Drivers Allowance';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Rec.Validate("Route Allowance Deviation", ("Actual Drivers Allowance" - "Route Drivers Allowance"));

            end;
        }
        field(58; "Route Allowance Deviation"; Decimal)
        {
            Caption = 'Route Allowance Deviation';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(59; "Delivered"; Boolean)
        {
            Caption = 'Delivered';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(60; "Total Fuel Expected"; Decimal)
        {
            Caption = 'Total Fuel Expected';
            DataClassification = ToBeClassified;
            Editable = false;
            trigger OnValidate()
            begin
                Calculatefuel();
            end;

        }
        // field(61; "Total Fuel Issued"; Decimal)
        // {
        //     Caption = 'Total Fuel Issued';
        //     FieldClass = FlowField;
        //     CalcFormula = sum("Fuel Issue"."Net Requirement In Litres" where("Trip ID" = field("Trip ID"), Posted = const(true)));
        //     Editable = false;
        // }
        field(61; "Balance Fuel in Vehicle"; Decimal)
        {
            Caption = 'Balance Fuel in Vehicle';
            ObsoleteState = Removed;
            ObsoleteReason = 'Removed';
            Editable = false;

        }
        field(62; "Shunting Fuel Balance"; Decimal)
        {
            Caption = 'Shunting Fuel Balance';
            DataClassification = ToBeClassified;
            Editable = false;
            trigger OnValidate()
            begin
                Calculatefuel;
            end;

        }
        field(63; "Overdue TAT In Days"; Boolean)
        {
            Caption = 'Overdue TAT In Days';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(64; "Detention Reason"; Enum "Detention Reason")
        {
            Caption = 'Detention Reason';
            DataClassification = ToBeClassified;
        }
        field(65; "Alternate Trip?"; Boolean)
        {
            Caption = 'Alternate Trip?';
            DataClassification = ToBeClassified;
        }
        field(66; "Detention Days"; Decimal)
        {
            Caption = 'Detention Days';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(67; "Actual Delivery Date"; Date)
        {
            Caption = 'Actual Delivery Date';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                CalcDetention();
            end;
        }
        field(68; "Delivery Time"; Time)
        {
            Caption = 'Delivery Time';
            DataClassification = ToBeClassified;
        }
        field(69; "Client No."; code[20])
        {
            Caption = 'Client No.';
            DataClassification = ToBeClassified;
            TableRelation = Customer;
            trigger OnValidate()
            var
                Cust: Record Customer;
            begin
                IF Cust.Get("Client No.") THEN begin
                    "Client Name" := Cust.Name;
                    "sales Person" := Cust."Salesperson Code"
                end ELSE begin
                    "Client Name" := '';
                    "sales Person" := '';
                end;
            end;
        }
        field(70; "TAT In Days"; Integer)
        {
            Caption = 'TAT In Days';
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(71; "Actual Trip Days"; Integer)
        {
            Caption = 'Actual Trip Days';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(72; "Due Date"; Date)
        {
            Caption = 'Due Date';
            DataClassification = ToBeClassified;
        }
        field(73; "Route Km"; Decimal)
        {
            Caption = 'Route KM';
            DataClassification = ToBeClassified;
        }
        field(74; "Weigh Bridge Charges Appl"; Boolean)
        {
            Caption = 'Weigh Bridge Charges Applicable?';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                Rec.TestField("Trip Status", "Trip Status"::Completed);
            end;
        }
        field(75; "WeighBridge charges"; Decimal)
        {
            Caption = 'WeighBridge Charges';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                Rec.TestField("Trip Status", "Trip Status"::Completed);
            end;
        }
        field(76; "Include Departure Day"; Boolean)
        {
            Caption = 'Include Departure Day';
            DataClassification = ToBeClassified;
        }
        field(77; "Location Code"; Code[20])
        {
            Caption = 'Location Code';
            DataClassification = ToBeClassified;
            TableRelation = Location;//where("Use As In-Transit" = const(false));
        }
        field(78; "Gatepass No."; Code[20])
        {
            Caption = 'Gatepass No.';
            DataClassification = ToBeClassified;
            TableRelation = Gatepass;
        }
        field(79; "Fuel Posted"; Boolean)
        {
            Caption = 'Fuel Posted';
            DataClassification = ToBeClassified;
        }
        field(80; "Inspection No."; Code[20])
        {
            Caption = 'Inspection No.';
            DataClassification = ToBeClassified;
        }
        field(81; "Inspection Completed"; Boolean)
        {
            Caption = 'Inspection Completed';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(82; "Tare Weight"; Decimal)
        {
            Caption = 'Tare Weight';
            ObsoleteState = Removed;
            ObsoleteReason = 'Not required anymore';

        }
        field(83; "Container Size 2"; Enum "Container Size")
        {
            Caption = 'Container Size 2';
            DataClassification = ToBeClassified;
        }
        field(84; "Container Type 2"; Enum "Cargo Type")
        {
            Caption = 'Cargo Type 2';
            DataClassification = ToBeClassified;
        }
        field(85; "Container No. 2"; Code[20])
        {
            Caption = 'Container No. 2';
            DataClassification = ToBeClassified;
        }
        field(86; "Goods description 2"; Text[250])
        {
            Caption = 'Goods description 2';
            DataClassification = ToBeClassified;
        }
        field(87; "Container Status 2"; Text[250])
        {
            Caption = 'Container Status 2';
            DataClassification = ToBeClassified;
        }
        field(88; "Marks & No.2"; Decimal)
        {
            Caption = 'Marks & No. 2';
            ObsoleteState = Removed;
            ObsoleteReason = 'Not required anymore';
        }
        field(89; "Tare Weight 2"; Decimal)
        {
            Caption = 'Tare Weight 2';
            ObsoleteState = Removed;
            ObsoleteReason = 'Not required anymore';
        }
        field(90; "Weight 2"; Decimal)
        {
            Caption = 'Weight 2';
            ObsoleteState = Removed;
            ObsoleteReason = 'Not required anymore';
        }
        field(91; "Shipping Line 2"; Text[250])
        {
            Caption = 'Shipping Line 2';
            ObsoleteState = Removed;
            ObsoleteReason = 'Not required anymore';
        }
        field(92; "Remarks 2"; Text[250])
        {
            Caption = 'Remarks 2';
            DataClassification = ToBeClassified;
        }
        field(93; "Container Type"; Enum "Cargo Type")
        {
            Caption = 'Cargo Type';
            DataClassification = ToBeClassified;
        }
        field(94; "Container Size"; Enum "Container Size")
        {
            Caption = 'Container Size';
            DataClassification = ToBeClassified;
        }
        field(95; "Delivery Note No"; Code[20])
        {
            Caption = 'Delivery Note No.';
            DataClassification = ToBeClassified;
        }
        field(96; "Interchange No"; Code[20])
        {
            Caption = 'Interchange No.';
            DataClassification = ToBeClassified;
        }
        field(97; "Booking No"; Code[20])
        {
            Caption = 'Booking No.';
            DataClassification = ToBeClassified;
        }
        field(98; "FRO No"; Code[20])
        {
            Caption = 'FRO No.';
            ObsoleteState = Removed;
            ObsoleteReason = 'Not required anymore';
        }
        field(99; "Additional Remarks"; Text[500])
        {
            Caption = 'Additional Remarks';
            DataClassification = ToBeClassified;
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
            //Editable = false;
        }
        field(105; "Global Dimension 2 Code"; Code[20])
        {
            Caption = 'Global Dimension 2 Code';
            DataClassification = ToBeClassified;
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
            //Editable = false;
        }
        field(106; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
            //Editable = false;
        }
        field(107; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
            //Editable = false;
        }
        field(108; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
            //Editable = false;
        }
        field(109; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
            //Editable = false;

        }
        field(110; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
            //Editable = false;
        }
        field(111; "Shortcut Dimension 8 Code"; Code[20])
        {
            CaptionClass = '1,2,8';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(8),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
            //Editable = false;
        }
        field(112; "Consumed Fuel In Litres"; Decimal)
        {
            Caption = 'Consumed Fuel In Litres';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                ConsumedFuel: Decimal;
            begin
                ConsumedFuel := Rec."Total Fuel Issued" + Rec."Balance Fuel in Truck";
                Rec."Balance to Tranfer after Term" := Rec."Total Fuel Issued" + Rec."Balance Fuel in Truck" - Rec."Consumed Fuel In Litres";
                if rec."Consumed Fuel In Litres" > ConsumedFuel then
                    Error('It can not be more than %1', ConsumedFuel);
            end;
        }
        field(113; "Consumed Petty Cash"; Decimal)
        {
            Caption = 'Consumed Petty Cash';
            DataClassification = ToBeClassified;
        }
        field(114; "Termination Date"; Date)
        {
            Caption = 'Termination Date';
            DataClassification = ToBeClassified;
        }

        field(115; "Total Fuel Issued"; Decimal)
        {
            Caption = 'Total Fuel Issued';
            FieldClass = FlowField;
            CalcFormula = sum("Fuel Issue"."Net Requirement In Litres" where("Trip ID" = field("Trip ID"), Posted = const(true)));
            Editable = false;

        }
        field(116; "Trip Terminated?"; Boolean)
        {
            Caption = 'Trip Terminated?';
            DataClassification = ToBeClassified;
        }
        field(117; "Trip Stage"; Enum "Trip Stage")
        {
            Caption = 'Trip Stage';
            DataClassification = ToBeClassified;
            //Editable = false;
        }
        field(118; "Balance Fuel in Truck"; Integer)
        {
            Caption = 'Balance Fuel in Vehicle';
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(119; "Balance to Tranfer after Term"; Integer)
        {
            Caption = 'Balance fuel to Tranfer after Termination';
            DataClassification = ToBeClassified;
        }
        field(120; "Transfer fuel to altern Trip?"; Boolean)
        {
            Caption = 'Transfer fuel to alternate Trip?';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                if not Rec."Fuel Return after Termination?" then
                    Error('First Confirm Fuel Return after Termination then Try again..!!');
            end;
        }
        field(121; "Fuel Return after Termination?"; Boolean)
        {
            Caption = 'Fuel Return after Termination?';
            DataClassification = ToBeClassified;
        }
        field(122; "Trip Category"; Enum "Trip Category")
        {
            Caption = 'Trip Category';
            DataClassification = ToBeClassified;
        }
        field(123; "Posted Trip Invoices"; Boolean)
        {
            Caption = 'Posted Invoices';
            FieldClass = FlowField;
            CalcFormula = exist("Sales Invoice Line" WHERE("Shortcut Dimension 4 Code" = FIELD("Shortcut Dimension 4 Code")));
            Editable = false;
        }
        field(124; "Posted Trip Credit Memos"; Boolean)
        {
            Caption = 'Posted Credit Memos';
            FieldClass = FlowField;
            CalcFormula = exist("Sales Cr.Memo Line" WHERE("Shortcut Dimension 4 Code" = FIELD("Shortcut Dimension 4 Code")));
            Editable = false;
        }
        field(125; "Closure Pending Approval"; Boolean)
        {
            Caption = 'Trip Closure Pending Approval';
            DataClassification = ToBeClassified;
            //Editable = false;
        }
        field(126; "Terminate Pending Approval"; Boolean)
        {
            Caption = 'Trip Terminate Pending Approval';
            DataClassification = ToBeClassified;
            //Editable = false;
        }
        field(127; "Trip Revenue"; Decimal)
        {
            Caption = 'Trip Revenue';
            DataClassification = ToBeClassified;

        }
        field(128; "sales Person"; code[100])
        {
            TableRelation = "Salesperson/Purchaser";
        }
        field(129; "Trip Type"; code[100])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('TRIP TYPE'),
                                                 "Dimension Value Type" = CONST(Standard),
                                                 Blocked = CONST(false));
        }
        field(130; "RFT No"; code[50])
        {
            TableRelation = "Transport Request Header";

            trigger OnValidate()
            var
                RFT: record "Transport Request Header";
                RFTLines: record "Transport Request Lines";
            begin
                "Vehicle No." := '';
                "Container No." := '';
                "Container No. 2" := '';
                "Client No." := '';
                "Client Name" := '';
                "Global Dimension 2 Code" := '';
                "Allocated Trailer No." := '';
                "Vehicle Type" := '';
                //"Vehicle Status" := '';
                "Driver ID" := '';
                "Driver Name" := '';
                "Mobile No." := '';
                "Next Inspection Date" := 0D;
                "Next Service Date" := 0D;
                "Insurance Expiry Date" := 0D;
                "Transit Goods Expiry" := 0D;
                "Balance Fuel in Truck" := 0;
                "Global Dimension 1 Code" := '';

                "Container Type 2" := "Container Type 2"::" ";
                "Goods description 2" := '';
                "Container Size 2" := "Container Size 2"::" ";

                "Due Date" := 0D;
                "Container Type" := "Container Type"::" ";
                "Goods desc" := '';
                "Container Size" := "Container Size"::" ";


                RFT.reset;
                RFT.setrange(" RFT No", "RFT No");
                if RFT.FindFirst() THEN begin
                    "Client No." := RFT."Consignee No";
                    "Client Name" := RFT."Consignee Name";
                    //"Global Dimension 2 Code" := RFT.Shipment;

                    //"C2 No":=RFT.

                end;
                RFTLines.Reset();
                RFTLines.SetRange(" RFT No", "RFT No");
                if RFTLines.FindFirst() then
                    Rec."Shortcut Dimension 3 Code" := UpperCase(format(RFTLines."Cargo Type  "));
                "Container No." := RFTLines."Container No";



            end;
        }
    }
    keys
    {
        key(PK1; "Trip ID")
        {

        }
        key(Pk2; "Trip Date", "Vehicle No.")
        {

        }
    }
    trigger OnInsert()
    var
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
        DimensionValue: Record "Dimension Value";
        Dim: Record Dimension;
        GLSetup: Record "General Ledger Setup";
        DimCode: Code[20];
        DimValue: Code[20];
    begin
        if "Trip ID" = '' then begin

            Unigroupsetup.Get;
            Unigroupsetup.TestField("Trip No.");
            "No. Series" := Unigroupsetup."Trip No.";
            if NoSeriesMgmt.AreRelated(Unigroupsetup."Trip No.", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "Trip ID" := NoSeriesMgmt.GetNextNo("No. Series");
        end;

        "Trip Date" := WorkDate();
        "Created By" := UserId;
        "Created Date" := WorkDate();
        "Trip Status" := "Trip Status"::Open;
        "Trip Stage" := "Trip Stage"::Created;

        GLSetup.Get();
        DimCode := GLSetup."Shortcut Dimension 4 Code";
        DimValue := Rec."Trip ID";
        if not DimensionValue.Get(DimCode, DimValue) then begin
            DimensionValue.Init();
            DimensionValue.Validate("Dimension Code", DimCode);
            DimensionValue.Validate(Code, DimValue);
            DimensionValue.Validate(Name, DimValue);
            DimensionValue.Insert(true);
        end;
        Rec.Validate("Shortcut Dimension 4 Code", Rec."Trip ID");
    end;

    trigger OnModify()
    var
        UserSetup: Record "User Setup";
    begin
        "Last Modified by" := UserId;
        "Last Modified Date" := WorkDate();
        UserSetup.get(UserId);
        if not UserSetup."Modify Trip" then begin
            if "Trip Stage" = "Trip Stage"::"Billing Completed" then
                if "Trip Status" = "Trip Status"::Completed then
                    Error('You can not change anything for closed Trip');
        end;
    end;

    trigger OnDelete()
    var
        myInt: Integer;
    begin
        Rec.TestStatusOpen();
    end;

    procedure AssistEdit(TripIdRec: Record Trip): Boolean
    var
        TripId: Record Trip;
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        TripId := Rec;
        Unigroupsetup.Get;
        Unigroupsetup.TestField(Unigroupsetup."Trip No.");
        if NoSeriesMgmt.LookupRelatedNoSeries(Unigroupsetup."Trip No.", TripIdRec."No. Series", "No. Series") then begin
            NoSeriesMgmt.GetNextNo(TripId."Trip ID", WorkDate(), true);
            Rec := TripId;
            exit(true);
        end;
    end;

    procedure UpdateInfo()

    begin
        if "Departure Date" <> 0D then begin
            if Rec."TAT In Days" > 1 then
                Rec.Validate("Due Date", CalcDate(Format(Rec."TAT In Days") + 'D', "Departure Date"))
            else
                Rec.Validate("Due Date", "Departure Date");
        end;
    end;

    // procedure TripClose()

    // begin
    //     Rec.TestField("Trip Status", "Trip Status"::Delivered);
    //     if Rec.Delivered then begin
    //         Rec."Trip Status" := Rec."Trip Status"::Closed;
    //         Rec.Modify();
    //     end;
    // end;

    procedure TripTermimated()
    var
        RecTrip: Record Trip;
        RemainingFuel: Decimal;
    begin
        Rec.TestField("Trip Status", "Trip Status"::Live);
        if Rec.Delivered then error('This trip is already delivered');
        if not rec."Trip Terminated?" then begin
            //1
            PostTerminateFuelJournal();
            UpdateFuelLog(2, Rec."Consumed Fuel In Litres", Rec."Termination Date", Rec."Trip ID");

            Rec.CalcFields("Total Fuel Issued");
            //RemainingFuel := Rec."Total Fuel Issued" + Rec."Balance Fuel in Truck" - Rec."Consumed Fuel In Litres";
            RemainingFuel := Rec."Balance to Tranfer after Term";
            if RemainingFuel <> 0 then begin
                //2
                if Rec."Fuel Return after Termination?" then begin
                    TransferFuelReturn();
                    UpdateFuelLog(4, RemainingFuel, Rec."Termination Date", Rec."Trip ID");
                end;
                //3
                if Rec."Transfer fuel to altern Trip?" then begin
                    TransferFuelToAlternateTrip;
                    UpdateFuelLog(1, RemainingFuel, Rec."Termination Date", rec."Trip ID");
                end;
            end;
            Rec."Trip Status" := Rec."Trip Status"::Terminated;
            Rec."Trip Terminated?" := true;
            Rec."Trip Stage" := Rec."Trip Stage"::Terminated;
            Rec.Modify();
        end else
            Error('The %1 Trip is already terminated', Rec."Trip ID");

    end;

    procedure TripDeliveredClosed()
    var
        Vehicle: Record "Fixed Asset";
        Totalfuel: Decimal;
        Shunting: Record "Shunting Details";
        UserSetup: Record "User Setup";
        EstimatedTotalFuel: Decimal;
    begin
        UserSetup.get(UserId);
        if not UserSetup."Close Trip" then
            Error('You do not have Authorized to perform this action');
        Rec.TestField("Global Dimension 1 Code");
        Rec.TestField("Global Dimension 2 Code");
        Rec.TestField("Shortcut Dimension 3 Code");
        Rec.TestField("Shortcut Dimension 4 Code");

        //Rec.TestField("Shortcut Dimension 7 Code");
        //Rec.TestField("Shortcut Dimension 8 Code");
        Rec.TestField("Consumed Fuel In Litres");
        Rec.TestField("Gatepass No.");
        EstimatedTotalFuel := Rec."Total Fuel Issued" + Rec."Balance Fuel in Truck";
        Rec."Balance to Tranfer after Term" := Rec."Total Fuel Issued" + Rec."Balance Fuel in Truck" - Rec."Consumed Fuel In Litres";
        if rec."Consumed Fuel In Litres" > EstimatedTotalFuel then
            Error('It can not be more than %1', EstimatedTotalFuel);
        if rec."Consumed Fuel In Litres" < 1 then
            Error('It can not be less than 1');

        Rec.TestField("Trip Status", "Trip Status"::Live);
        Rec.TestField("Departure Date");
        if (Rec."Trip Type" = 'SHUNTING') or (Rec."Trip Type" = '3PL') then begin
            Shunting.Reset();
            Shunting.SetRange("Trip Id", Rec."Trip ID");
            Shunting.SetFilter("Billing Status", '=%1', Shunting."Billing Status"::Open);
            if shunting.FindFirst() then
                Error('Please complete open shunting trip before closing the trip %1', rec."Trip ID");
        end;
        Rec.TestField("Actual Delivery Date");
        if not Delivered then begin
            Delivered := true;
            "System Delivery Date" := WorkDate();
            "Delivery Time" := time;
            //CalcDetention();
            Rec."Trip Status" := Rec."Trip Status"::Completed;
            Rec."Trip Stage" := Rec."Trip Stage"::"Delivery and Closing Completed";
            Rec.Modify();
            Rec.CalcFields("Total Fuel Issued");

            if not Rec."Fuel Posted" then
                PostFuelJournal();
            UpdateFuelLog(2, Rec."Consumed Fuel In Litres", Rec."Actual Delivery Date", Rec."Trip ID");
            Vehicle.Reset();
            Vehicle.SetRange("No.", "Vehicle No.");
            if Vehicle.FindFirst() then begin
                Vehicle."Vehicle Status" := vehicle."Vehicle Status"::Available;
                Vehicle.Modify();
            end;
        end else begin
            Error('Trip already delivered');
        end;

    end;

    procedure Calculatefuel()

    begin
        Rec.CalcFields("Total Fuel Issued");
        if (Rec."Trip Type" = 'SHUNTING') or (Rec."Trip Type" = '3PL') then begin
            rec."Consumed Fuel In Litres" := "Total Fuel Expected" - "Shunting Fuel Balance";
        end;
    end;



    procedure CalcDetention()

    begin
        if "Include Departure Day" then
            Rec.Validate("Actual Trip Days", ("Actual Delivery Date" - "Departure Date") + 1)
        else
            Rec.Validate("Actual Trip Days", ("Actual Delivery Date" - "Departure Date"));
        Rec.Validate("Detention Days", ("Actual Trip Days" - "TAT In Days"));
        if "Actual Trip Days" > "TAT In Days" then
            "Overdue TAT In Days" := true
        else
            "Overdue TAT In Days" := false;
    end;

    procedure UpdateVehicleFuelLog()
    VehicleFuel: Record "Vehicle Fuel Log";
    var
        EntryNo: Integer;

    begin

        VehicleFuel.Init();
        VehicleFuel."Entry No." := EntryNo;
        VehicleFuel.Date := Rec."Actual Delivery Date";
        VehicleFuel."Entry Type" := VehicleFuel."Entry Type"::"Trip Consumption";
        VehicleFuel."Vehicle No." := Rec."Vehicle No.";
        VehicleFuel."Driver ID." := Rec."Driver ID";
        VehicleFuel."Trip Id" := Rec."Trip ID";
        VehicleFuel.Quantity := -Rec."Total Fuel Expected";
        VehicleFuel.Insert();
    end;

    procedure UpdateFuelLog(lEntryType: Integer; Qty: Decimal; PostingDate: Date; DocNo: code[20])
    VehicleFuel: Record "Vehicle Fuel Log";
    var
        EntryNo: Integer;
        UnigroupSetup: Record "Unigroup Setup";
    begin
        UnigroupSetup.Get();
        VehicleFuel.Init();
        VehicleFuel."Entry No." := EntryNo;
        VehicleFuel.Date := PostingDate;
        if lEntryType = 1 then
            VehicleFuel."Entry Type" := VehicleFuel."Entry Type"::"Fuel Issue";
        if lEntryType = 2 then
            VehicleFuel."Entry Type" := VehicleFuel."Entry Type"::"Trip Consumption";
        if lEntryType = 3 then
            VehicleFuel."Entry Type" := VehicleFuel."Entry Type"::Shortage;
        if lEntryType = 4 then
            VehicleFuel."Entry Type" := VehicleFuel."Entry Type"::"Fuel Return";
        VehicleFuel."Vehicle No." := Rec."Vehicle No.";
        VehicleFuel."Driver ID." := Rec."Driver ID";
        VehicleFuel."Fuel Location" := UnigroupSetup."Vehicle Temp Fuel Location";
        VehicleFuel."Trip Id" := Rec."Trip ID";
        VehicleFuel."Document No." := DocNo;
        if lEntryType = 1 then
            VehicleFuel.Quantity := qty;
        if lEntryType = 2 then
            VehicleFuel.Quantity := -qty;
        if lEntryType = 3 then
            VehicleFuel.Quantity := -qty;
        if lEntryType = 4 then
            VehicleFuel.Quantity := -qty;
        VehicleFuel."System Created" := true;
        VehicleFuel.Insert();
    end;

    procedure TripReOpen()

    begin
        if Rec.Delivered then begin
            Rec."Trip Status" := Rec."Trip Status"::Live;
            Rec.Modify();
        end;
    end;

    procedure TransferFuelReturn()
    var
        TransferorderHeader: Record "Transfer Header";
        Transferorderline: Record "Transfer Line";
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgt: Codeunit "No. Series";
        LineNo: Integer;
        TransferPostShipment: Codeunit "TransferOrder-Post Shipment";
        TransferPostReceipt: Codeunit "TransferOrder-Post Receipt";
        RemainingFuel: Decimal;
    begin
        TransferorderHeader.Init();
        Unigroupsetup.GET;
        TransferorderHeader.VALIDATE(TransferorderHeader."No.", Rec."Trip ID");
        TransferorderHeader.Validate("Transfer-from Code", Unigroupsetup."Vehicle Temp Fuel Location");
        TransferorderHeader.Validate("Transfer-to Code", Rec."Location Code");
        TransferorderHeader."Posting Date" := Rec."Termination Date";
        TransferorderHeader."Direct Transfer" := true;
        TransferorderHeader.Validate("Shipment Date", Rec."Termination Date");
        TransferorderHeader.Validate("Receipt Date", Rec."Termination Date");
        TransferorderHeader.Status := TransferorderHeader.Status::Released;
        TransferorderHeader.Insert();
        LineNo += 10000;
        Transferorderline.Init();
        Transferorderline."Document No." := TransferorderHeader."No.";
        Transferorderline."Line No." := 10000;
        Transferorderline.Validate("Item No.", Unigroupsetup."Default Item for Diesel");
        Rec.CalcFields("Total Fuel Issued");
        RemainingFuel := Rec."Total Fuel Issued" - Rec."Consumed Fuel In Litres";
        Transferorderline.Validate(Quantity, RemainingFuel);
        Transferorderline.Insert();
        TransferPostShipment.Run(TransferorderHeader);
        TransferPostReceipt.Run(TransferorderHeader);
    end;

    procedure TransferFuelToAlternateTrip()
    var
        NoSeriesMgt: Codeunit "No. Series";
        UnigroupSetup: Record "Unigroup Setup";
        FuelRec: Record "Fuel Issue";
        RemainingFuel: Decimal;
        AlternateTrip: Record Trip;
    begin
        AlternateTrip.Get(Rec."Alternate Trip ID");
        UnigroupSetup.Get();
        FuelRec.Init();
        FuelRec."Fuel Issue No." := NoSeriesMgt.GetNextNo(UnigroupSetup."Fuel Issue No.", WorkDate(), true);
        FuelRec.Validate("Trip ID", AlternateTrip."Trip ID");
        FuelRec.Validate("Issue Date", Rec."Termination Date");
        FuelRec.Validate("Driver ID", AlternateTrip."Driver ID");
        FuelRec.Validate("Driver Name", AlternateTrip."Driver Name");
        FuelRec.Validate("Vehicle No.", AlternateTrip."Vehicle No.");
        //FuelRec.Validate("Location Code", Rec."Location Code");
        FuelRec.Validate("Trailer No.", AlternateTrip."Allocated Trailer No.");
        Rec.CalcFields("Total Fuel Issued");
        RemainingFuel := Rec."Total Fuel Issued" + Rec."Balance Fuel in Truck" - Rec."Consumed Fuel In Litres";
        If RemainingFuel < 0 then
            Error('Remaining Fuel should not be less than 0. It is %1', RemainingFuel);
        FuelRec.Validate("Required Fuel In Litres", RemainingFuel);
        FuelRec.Validate("Global Dimension 1 Code", AlternateTrip."Global Dimension 1 Code");
        FuelRec.Validate("Global Dimension 2 Code", AlternateTrip."Global Dimension 2 Code");
        FuelRec.Validate("Shortcut Dimension 3 Code", AlternateTrip."Shortcut Dimension 3 Code");
        FuelRec.Validate("Shortcut Dimension 4 Code", AlternateTrip."Shortcut Dimension 4 Code");
        FuelRec.Validate("Shortcut Dimension 5 Code", AlternateTrip."Shortcut Dimension 5 Code");
        FuelRec.Validate("Shortcut Dimension 6 Code", AlternateTrip."Shortcut Dimension 6 Code");
        FuelRec.Validate("Shortcut Dimension 7 Code", AlternateTrip."Shortcut Dimension 7 Code");
        FuelRec.Validate("Shortcut Dimension 8 Code", AlternateTrip."Shortcut Dimension 8 Code");
        FuelRec.Insert();
        FuelRec.TransferOrderForFuelissue(FuelRec);
        FuelRec.Posted := true;
        FuelRec.Modify();
        UpdateFuelLog(1, RemainingFuel, Rec."Termination Date", Rec."Trip ID");
    end;

    procedure PostTerminateFuelJournal()
    var
        TempItemJnlLine: Record "Item Journal Line" temporary;
        TmpDimSetEntry: Record "Dimension Set Entry" temporary;
        DimValue: Record "Dimension Value";
        DimMgmt: Codeunit DimensionManagement;
        GLSetup: Record "General Ledger Setup";
        NoSeriesMgt: Codeunit "No. Series";
        JournalBatch: Record "Item Journal Batch";
        ItemJnlPostline: Codeunit "Item Jnl.-Post Line";
        Unigroupsetup: Record "Unigroup Setup";
    begin
        rec.TestField("Trip Status", Rec."Trip Status"::Live);
        TempItemJnlLine.Init();
        Unigroupsetup.Get();
        TempItemJnlLine."Journal Template Name" := Unigroupsetup."Fuel Consumption Template Name";
        TempItemJnlLine."Journal Batch Name" := Unigroupsetup."Fuel Consumption Batch Name";
        TempItemJnlLine."Line No." := 10000;
        TempItemJnlLine."Entry Type" := TempItemJnlLine."Entry Type"::"Negative Adjmt.";
        TempItemJnlLine."Posting Date" := Rec."Termination Date";
        TempItemJnlLine."Document No." := Rec."Trip ID";
        TempItemJnlLine."Trip ID" := Rec."Trip ID";
        TempItemJnlLine.Validate("Item No.", Unigroupsetup."Default Item for Diesel");
        If Rec."Consumed Fuel In Litres" < 0 then
            Error('You can not have negative quantity consumed')
        else
            TempItemJnlLine.Validate(Quantity, Rec."Consumed Fuel In Litres");
        TempItemJnlLine.validate(Description, 'Terminated');
        TempItemJnlLine.Validate("Gen. Prod. Posting Group", Unigroupsetup."Prod Group for Trip Fuel");
        TempItemJnlLine.Validate("Location Code", Unigroupsetup."Vehicle Temp Fuel Location");
        GLSetup.Get();
        TmpDimSetEntry.DeleteAll();
        if DimValue.Get(GLSetup."Global Dimension 1 Code", Rec."Global Dimension 1 Code") then begin
            TmpDimSetEntry.Init;
            TmpDimSetEntry.Validate("Dimension Code", GLSetup."Global Dimension 1 Code");
            TmpDimSetEntry.Validate("Dimension Value Code", Rec."Global Dimension 1 Code");
            TmpDimSetEntry.Insert;
        end;
        if DimValue.Get(GLSetup."Global Dimension 2 Code", Rec."Global Dimension 2 Code") then begin
            TmpDimSetEntry.Init;
            TmpDimSetEntry.Validate("Dimension Code", GLSetup."Global Dimension 2 Code");
            TmpDimSetEntry.Validate("Dimension Value Code", Rec."Global Dimension 2 Code");
            TmpDimSetEntry.Insert;
        end;
        if DimValue.Get(GLSetup."Shortcut Dimension 3 Code", Rec."Shortcut Dimension 3 Code") then begin
            TmpDimSetEntry.Init;
            TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 3 Code");
            TmpDimSetEntry.Validate("Dimension Value Code", Rec."Shortcut Dimension 3 Code");
            TmpDimSetEntry.Insert;
        end;
        if DimValue.Get(GLSetup."Shortcut Dimension 4 Code", Rec."Shortcut Dimension 4 Code") then begin
            TmpDimSetEntry.Init;
            TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 4 Code");
            TmpDimSetEntry.Validate("Dimension Value Code", Rec."Shortcut Dimension 4 Code");
            TmpDimSetEntry.Insert;
        end;
        if DimValue.Get(GLSetup."Shortcut Dimension 5 Code", Rec."Shortcut Dimension 5 Code") then begin
            TmpDimSetEntry.Init;
            TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 5 Code");
            TmpDimSetEntry.Validate("Dimension Value Code", Rec."Shortcut Dimension 5 Code");
            TmpDimSetEntry.Insert;
        end;
        if DimValue.Get(GLSetup."Shortcut Dimension 6 Code", Rec."Shortcut Dimension 6 Code") then begin
            TmpDimSetEntry.Init;
            TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 6 Code");
            TmpDimSetEntry.Validate("Dimension Value Code", Rec."Shortcut Dimension 6 Code");
            TmpDimSetEntry.Insert;
        end;
        if DimValue.Get(GLSetup."Shortcut Dimension 7 Code", Rec."Shortcut Dimension 7 Code") then begin
            TmpDimSetEntry.Init;
            TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 7 Code");
            TmpDimSetEntry.Validate("Dimension Value Code", Rec."Shortcut Dimension 7 Code");
            TmpDimSetEntry.Insert;
        end;
        if DimValue.Get(GLSetup."Shortcut Dimension 8 Code", Rec."Shortcut Dimension 8 Code") then begin
            TmpDimSetEntry.Init;
            TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 8 Code");
            TmpDimSetEntry.Validate("Dimension Value Code", Rec."Shortcut Dimension 8 Code");
            TmpDimSetEntry.Insert;
        end;
        TempItemJnlLine.Validate("Dimension Set ID", DimMgmt.GetDimensionSetID(TmpDimSetEntry));
        TempItemJnlLine.Insert(true);
        ItemJnlPostline.RunWithCheck(TempItemJnlLine);
        //Rec."Fuel Posted" := true;
        //Rec.Modify();
    end;

    procedure PostFuelJournal()
    var
        TempItemJnlLine: Record "Item Journal Line" temporary;
        TmpDimSetEntry: Record "Dimension Set Entry" temporary;
        DimValue: Record "Dimension Value";
        DimMgmt: Codeunit DimensionManagement;
        GLSetup: Record "General Ledger Setup";
        NoSeriesMgt: Codeunit "No. Series";
        JournalBatch: Record "Item Journal Batch";
        ItemJnlPostline: Codeunit "Item Jnl.-Post Line";
        Unigroupsetup: Record "Unigroup Setup";
        EventHandler: Codeunit "Event Handler";

    begin
        rec.TestField("Trip Status", Rec."Trip Status"::Completed);
        TempItemJnlLine.Init();
        Unigroupsetup.Get();
        TempItemJnlLine."Journal Template Name" := Unigroupsetup."Fuel Consumption Template Name";
        TempItemJnlLine."Journal Batch Name" := Unigroupsetup."Fuel Consumption Batch Name";
        TempItemJnlLine."Line No." := 10000;
        TempItemJnlLine."Entry Type" := TempItemJnlLine."Entry Type"::"Negative Adjmt.";
        TempItemJnlLine."Posting Date" := Rec."Actual Delivery Date";
        TempItemJnlLine."Document No." := Rec."Trip ID";
        TempItemJnlLine."Trip ID" := Rec."Trip ID";
        if Rec."Vehicle Fuel Type" = Rec."Vehicle Fuel Type"::Diesel then
            TempItemJnlLine.Validate("Item No.", EventHandler.GetFuelItem(1))
        else
            TempItemJnlLine.Validate("Item No.", EventHandler.GetFuelItem(2));
        TempItemJnlLine.Validate(Quantity, Rec."Consumed Fuel In Litres");
        TempItemJnlLine.Validate("Gen. Prod. Posting Group", Unigroupsetup."Prod Group for Trip Fuel");
        TempItemJnlLine.Validate("Location Code", Unigroupsetup."Vehicle Temp Fuel Location");
        GLSetup.Get();
        TmpDimSetEntry.DeleteAll();
        if DimValue.Get(GLSetup."Global Dimension 1 Code", Rec."Global Dimension 1 Code") then begin
            TmpDimSetEntry.Init;
            TmpDimSetEntry.Validate("Dimension Code", GLSetup."Global Dimension 1 Code");
            TmpDimSetEntry.Validate("Dimension Value Code", Rec."Global Dimension 1 Code");
            TmpDimSetEntry.Insert;
        end;
        if DimValue.Get(GLSetup."Global Dimension 2 Code", Rec."Global Dimension 2 Code") then begin
            TmpDimSetEntry.Init;
            TmpDimSetEntry.Validate("Dimension Code", GLSetup."Global Dimension 2 Code");
            TmpDimSetEntry.Validate("Dimension Value Code", Rec."Global Dimension 2 Code");
            TmpDimSetEntry.Insert;
        end;
        if DimValue.Get(GLSetup."Shortcut Dimension 3 Code", Rec."Shortcut Dimension 3 Code") then begin
            TmpDimSetEntry.Init;
            TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 3 Code");
            TmpDimSetEntry.Validate("Dimension Value Code", Rec."Shortcut Dimension 3 Code");
            TmpDimSetEntry.Insert;
        end;
        if DimValue.Get(GLSetup."Shortcut Dimension 4 Code", Rec."Shortcut Dimension 4 Code") then begin
            TmpDimSetEntry.Init;
            TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 4 Code");
            TmpDimSetEntry.Validate("Dimension Value Code", Rec."Shortcut Dimension 4 Code");
            TmpDimSetEntry.Insert;
        end;
        if DimValue.Get(GLSetup."Shortcut Dimension 5 Code", Rec."Shortcut Dimension 5 Code") then begin
            TmpDimSetEntry.Init;
            TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 5 Code");
            TmpDimSetEntry.Validate("Dimension Value Code", Rec."Shortcut Dimension 5 Code");
            TmpDimSetEntry.Insert;
        end;
        if DimValue.Get(GLSetup."Shortcut Dimension 6 Code", Rec."Shortcut Dimension 6 Code") then begin
            TmpDimSetEntry.Init;
            TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 6 Code");
            TmpDimSetEntry.Validate("Dimension Value Code", Rec."Shortcut Dimension 6 Code");
            TmpDimSetEntry.Insert;
        end;
        if DimValue.Get(GLSetup."Shortcut Dimension 7 Code", Rec."Shortcut Dimension 7 Code") then begin
            TmpDimSetEntry.Init;
            TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 7 Code");
            TmpDimSetEntry.Validate("Dimension Value Code", Rec."Shortcut Dimension 7 Code");
            TmpDimSetEntry.Insert;
        end;
        if DimValue.Get(GLSetup."Shortcut Dimension 8 Code", Rec."Shortcut Dimension 8 Code") then begin
            TmpDimSetEntry.Init;
            TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 8 Code");
            TmpDimSetEntry.Validate("Dimension Value Code", Rec."Shortcut Dimension 8 Code");
            TmpDimSetEntry.Insert;
        end;
        TempItemJnlLine.Validate("Dimension Set ID", DimMgmt.GetDimensionSetID(TmpDimSetEntry));
        TempItemJnlLine.Insert(true);
        ItemJnlPostline.RunWithCheck(TempItemJnlLine);
        Rec."Fuel Posted" := true;
        Rec.Modify();
    end;

    procedure CheckInspection()
    var
        Vehicle: Record "Fixed Asset";
        DimValue: Record "Dimension Value";
        GLSetup: Record "General Ledger Setup";
    begin
        GLSetup.Get();
        If DimValue.Get(rec."Trip Type", Rec."Trip Type") then begin
            if DimValue."Inspection Mandatory" then begin
                if DimValue.Code = 'Local' then
                    Rec.TestField("Inspection Completed");
                if DimValue.Code <> 'Local' then begin
                    if Vehicle.Get("Vehicle No.") then begin
                        if (Vehicle."Next Inspection Date" < Today) or (Vehicle."Next Inspection Date" = Today) then
                            //if not Rec."Inspection Completed" then
                            Error('Please completed the vehicle inspection before proceed further');
                    end;
                end;
            end;
        end;
    end;

    procedure CreateFuelissue()
    var
        NoSeriesMgt: Codeunit "No. Series";
        UnigroupSetup: Record "Unigroup Setup";
        FuelRec: Record "Fuel Issue";
    begin
        FuelRec.Reset();
        FuelRec.SetRange("Trip ID", Rec."Trip ID");
        if FuelRec.FindFirst() then
            Error('Fuel issue already created with Reference No. %1', FuelRec."Fuel Issue No.");
        CheckInspection();
        Rec.testfield("Total Fuel Expected");
        Rec.TestField("Trip Status", "Trip Status"::Approved);
        if not Confirm('Do you want to create the Fuel Issue?', true) then
            exit else begin
            UnigroupSetup.Get();
            FuelRec.Init();
            FuelRec."Fuel Issue No." := NoSeriesMgt.GetNextNo(UnigroupSetup."Fuel Issue No.", WorkDate(), true);
            FuelRec.Validate("Trip ID", Rec."Trip ID");
            FuelRec.Validate("Fuel Issue For", FuelRec."Fuel Issue For"::Trip);
            FuelRec.Validate("Issue Date", WorkDate());
            FuelRec.Validate("Driver ID", Rec."Driver ID");
            FuelRec.Validate("Driver Name", Rec."Driver Name");
            FuelRec.Validate("Vehicle No.", Rec."Vehicle No.");
            FuelRec.Validate("Trailer No.", Rec."Allocated Trailer No.");
            FuelRec.Validate("Required Fuel In Litres", Rec."Total Fuel Expected");
            FuelRec.Validate("Balance Fuel in Truck", Rec."Balance Fuel in Truck");
            FuelRec.Validate("Global Dimension 1 Code", Rec."Global Dimension 1 Code");
            FuelRec.Validate("Global Dimension 2 Code", Rec."Global Dimension 2 Code");
            FuelRec.Validate("Shortcut Dimension 3 Code", Rec."Shortcut Dimension 3 Code");
            FuelRec.Validate("Shortcut Dimension 4 Code", Rec."Shortcut Dimension 4 Code");
            FuelRec.Validate("Shortcut Dimension 5 Code", Rec."Shortcut Dimension 5 Code");
            FuelRec.Validate("Shortcut Dimension 6 Code", Rec."Shortcut Dimension 6 Code");
            FuelRec.Validate("Shortcut Dimension 7 Code", Rec."Shortcut Dimension 7 Code");
            FuelRec.Validate("Shortcut Dimension 8 Code", Rec."Shortcut Dimension 8 Code");
            FuelRec.Validate("Sales Person", rec."sales Person");
            FuelRec.Insert();
            Message('Fuel issue successfully Created');
        end;
    end;

    procedure CreateTempGatepass()
    var
        NoSeriesMgt: Codeunit "No. Series";
        UnigroupSetup: Record "Unigroup Setup";
        GPRec: Record Gatepass;
    begin
        GPRec.Reset();
        GPRec.SetRange("Trip ID", Rec."Trip ID");
        if GPRec.FindFirst() then
            Error('Gatepass already created for this Trip with Reference No. %1', GPRec."Gatepass No.");
        CheckInspection();
        Rec.TestField("Trip Status", "Trip Status"::Approved);
        if not Confirm('Do you want to create a temporary gatepass?', true) then
            exit else begin
            UnigroupSetup.Get();
            GPRec.Init();
            GPRec.validate("Gatepass No.", NoSeriesMgt.GetNextNo(UnigroupSetup."Gatepass No.", WorkDate(), true));
            GPRec.Validate("Trip ID", Rec."Trip ID");
            GPRec.Validate("Gatepass Date", WorkDate());
            GPRec.Validate("Gatepass Type", GPRec."Gatepass Type"::Temporary);
            GPRec.Validate("Driver ID", Rec."Driver ID");
            GPRec.Validate("Driver Name", Rec."Driver Name");
            GPRec.Validate("Vehicle No.", Rec."Vehicle No.");
            GPRec.Validate("From(Source)", Rec."From(Source)");
            GPRec.Validate("To (Destination)", Rec."To (Destination)");
            CalcFields("Expected No Of Trips");
            GPRec.Validate("Expected No Of Trips", Rec."Expected No Of Trips");
            GPRec.Validate("Trailer No.", Rec."Allocated Trailer No.");
            GPRec.Validate("Global Dimension 1 Code", Rec."Global Dimension 1 Code");
            GPRec.Validate("Global Dimension 2 Code", Rec."Global Dimension 2 Code");
            GPRec.Validate("Shortcut Dimension 3 Code", Rec."Shortcut Dimension 3 Code");
            GPRec.Validate("Shortcut Dimension 4 Code", Rec."Shortcut Dimension 4 Code");
            GPRec.Validate("Shortcut Dimension 5 Code", Rec."Shortcut Dimension 5 Code");
            GPRec.Validate("Shortcut Dimension 6 Code", Rec."Shortcut Dimension 6 Code");
            GPRec.Validate("Shortcut Dimension 7 Code", Rec."Shortcut Dimension 7 Code");
            GPRec.Validate("Shortcut Dimension 8 Code", Rec."Shortcut Dimension 8 Code");
            GPRec.Insert(true);
            Message('Temporary Gatepass %1 successfully Created', GPRec."Gatepass No.");
            Rec."Gatepass No." := GPRec."Gatepass No.";
            Rec.Modify();
        end;
    end;

    procedure CreatePerGatepass()
    var
        NoSeriesMgt: Codeunit "No. Series";
        UnigroupSetup: Record "Unigroup Setup";
        GPRec: Record Gatepass;
    begin
        GPRec.Reset();
        GPRec.SetRange("Trip ID", Rec."Trip ID");
        if GPRec.FindFirst() then
            Error('Gatepass already created for this Trip with Reference No. %1', GPRec."Gatepass No.");
        Rec.TestField("Trip Status", "Trip Status"::Approved);
        if not Confirm('Do you want to create the Gatepass?', true) then
            exit else begin
            UnigroupSetup.Get();
            GPRec.Init();
            GPRec.validate("Gatepass No.", NoSeriesMgt.GetNextNo(UnigroupSetup."Gatepass No.", WorkDate(), true));
            GPRec.Validate("Trip ID", Rec."Trip ID");
            GPRec.Validate("Gatepass Date", WorkDate());
            GPRec.Validate("Gatepass Type", GPRec."Gatepass Type"::Permanent);
            GPRec.Validate("Driver ID", Rec."Driver ID");
            GPRec.Validate("Driver Name", Rec."Driver Name");
            GPRec.Validate("Vehicle No.", Rec."Vehicle No.");
            GPRec.Validate("From(Source)", Rec."From(Source)");
            GPRec.Validate("To (Destination)", Rec."To (Destination)");
            CalcFields("Expected No Of Trips");
            GPRec.Validate("Expected No Of Trips", Rec."Expected No Of Trips");
            //GPRec.Validate("Location Code", Rec."Location Code");
            GPRec.Validate("Trailer No.", Rec."Allocated Trailer No.");
            GPRec.Validate("Global Dimension 1 Code", Rec."Global Dimension 1 Code");
            GPRec.Validate("Global Dimension 2 Code", Rec."Global Dimension 2 Code");
            GPRec.Validate("Shortcut Dimension 3 Code", Rec."Shortcut Dimension 3 Code");
            GPRec.Validate("Shortcut Dimension 4 Code", Rec."Shortcut Dimension 4 Code");
            GPRec.Validate("Shortcut Dimension 5 Code", Rec."Shortcut Dimension 5 Code");
            GPRec.Validate("Shortcut Dimension 6 Code", Rec."Shortcut Dimension 6 Code");
            GPRec.Validate("Shortcut Dimension 7 Code", Rec."Shortcut Dimension 7 Code");
            GPRec.Validate("Shortcut Dimension 8 Code", Rec."Shortcut Dimension 8 Code");
            GPRec.Insert(true);
            Message('Permanent Gatepass %1 successfully Created', GPRec."Gatepass No.");
            Rec."Gatepass No." := GPRec."Gatepass No.";
            Rec.Modify();
        end;
    end;

    procedure Pettycashexpenses()
    var
        Pettycashexpenses: Record "Petty Cash Expenses Detail";
        NoSeriesMgt: Codeunit "No. Series";
        UnigroupSetup: Record "Unigroup Setup";
    begin
        CheckInspection();
        Rec.TestField("Trip Status", "Trip Status"::Approved);
        Rec.TestField("Actual Drivers Allowance");
        Pettycashexpenses.Reset();
        Pettycashexpenses.SetRange("Trip ID", Rec."Trip ID");
        if Pettycashexpenses.FindFirst() then
            Error('Petty Cash Voucher already created with Reference No. %1', Pettycashexpenses."Voucher No.");
        Rec.TestField("Actual Drivers Allowance");
        if not Confirm('Do you want to create the Petty cash expense Voucher?', true) then
            exit else begin
            UnigroupSetup.Get();
            Pettycashexpenses.Init();
            Pettycashexpenses."Voucher No." := NoSeriesMgt.GetNextNo(UnigroupSetup."Voucher No.", WorkDate(), true);
            Pettycashexpenses.Validate("Petty Cash For", Pettycashexpenses."Petty Cash For"::Trip);
            Pettycashexpenses.Validate("Trip ID", Rec."Trip ID");
            Pettycashexpenses.Validate("Creation date", WorkDate());
            Pettycashexpenses.Validate("Vehicle No.", Rec."Vehicle No.");
            Pettycashexpenses.Validate("Driver ID", Rec."Driver ID");
            Pettycashexpenses.validate("Account Type", Pettycashexpenses."Account Type"::"G/L Account");
            Pettycashexpenses.validate("Bal. Account Type", Pettycashexpenses."Account Type"::"Bank Account");
            Pettycashexpenses.validate("Bal. Account No.", UnigroupSetup."Def. Petty Cash Payment Method");
            Pettycashexpenses.Validate("Driver Name", Rec."Driver Name");
            Pettycashexpenses.Validate("Mobile Phone No.", Rec."Mobile No.");
            Pettycashexpenses.Validate(From, Rec."From(Source)");
            Pettycashexpenses.Validate(Destination, Rec."To (Destination)");
            Pettycashexpenses.Validate("Expense Type", 'Driver Allowance');
            Pettycashexpenses.Validate("Petty Cash Amount", Rec."Actual Drivers Allowance");
            Pettycashexpenses.Validate("Global Dimension 1 Code", Rec."Global Dimension 1 Code");
            Pettycashexpenses.Validate("Global Dimension 2 Code", Rec."Global Dimension 2 Code");
            Pettycashexpenses.Validate("Shortcut Dimension 3 Code", Rec."Shortcut Dimension 3 Code");
            Pettycashexpenses.Validate("Shortcut Dimension 4 Code", Rec."Shortcut Dimension 4 Code");
            Pettycashexpenses.Validate("Shortcut Dimension 5 Code", Rec."Shortcut Dimension 5 Code");
            Pettycashexpenses.Validate("Shortcut Dimension 6 Code", Rec."Shortcut Dimension 6 Code");
            Pettycashexpenses.Validate("Shortcut Dimension 7 Code", Rec."Shortcut Dimension 7 Code");
            Pettycashexpenses.Validate("Shortcut Dimension 8 Code", Rec."Shortcut Dimension 8 Code");
            Pettycashexpenses.Insert();
            Message('Petty cash expenses successfully created');
        end;
    end;

    procedure CreateInspection()
    var
        NoSeriesMgt: Codeunit "No. Series";
        UnigroupSetup: Record "Unigroup Setup";
        Insptn: Record "Inspection Header";
    begin
        Insptn.Reset();
        Insptn.SetRange("Trip ID", Rec."Trip ID");
        if Insptn.FindFirst() then
            Error('Inspection already created for this Trip with Reference No. %1', Insptn."Inspection No.");
        Rec.TestField("Trip Status", "Trip Status"::Approved);
        if not Confirm('Do you want to create the Inspection?', true) then
            exit else begin
            UnigroupSetup.Get();
            Insptn.Init();
            Insptn.validate("Inspection No.", NoSeriesMgt.GetNextNo(UnigroupSetup."Inspection No.", WorkDate(), true));
            Insptn.Validate("Trip ID", Rec."Trip ID");
            Insptn.Validate("Inspection Date", WorkDate());
            Insptn.Validate("Driver ID", Rec."Driver ID");
            Insptn.Validate("Driver Name", Rec."Driver Name");
            Insptn.Validate("Trailer No.", Rec."Allocated Trailer No.");
            Insptn.Validate("Vehicle No.", Rec."Vehicle No.");
            Insptn.Insert(true);
            Message('Inspection %1 successfully Created', Insptn."Inspection No.");
            Rec."Inspection No." := Insptn."Inspection No.";
            Rec.Modify();
        end;
    end;


    procedure TestStatusOpen()
    begin
        TestField("Trip Status", "Trip Status"::Open);
    end;

    procedure CalculateTripRevenue();
    var
        Shunting: Record "Shunting Details";
        Trip: Record Trip;
        PostedSalesInv: Record "Sales Invoice Line";
    begin
        Rec."Trip Revenue" := 0;
        if Rec."Trip Type" = 'SHUNTING' then begin
            Shunting.Reset();
            Shunting.SetRange("Trip Id", Rec."Trip ID");
            if Shunting.FindSet() then
                repeat
                    Rec."Trip Revenue" += Shunting."Container Charge";
                until Shunting.Next() = 0;
        end else begin
            PostedSalesInv.reset;
            PostedSalesInv.SetRange("Shortcut Dimension 4 Code", Rec."Trip ID");
            if PostedSalesInv.FindSet() then
                repeat
                    Rec."Trip Revenue" += PostedSalesInv."Line Amount";
                until PostedSalesInv.Next() = 0;
        end;
    end;


    var
        StyleExprTxt: Text;

}