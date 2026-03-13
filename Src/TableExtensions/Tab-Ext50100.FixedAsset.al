tableextension 50100 FixedAssetExt extends "Fixed Asset"
{

    fields
    {
        field(50100; "Balance Fuel"; Integer)
        {
            Caption = 'Balance Fuel';
            FieldClass = FlowField;
            //CalcFormula = sum("Vehicle Fuel Log".Quantity where("Vehicle No." = field("No.")));
            CalcFormula = sum("Vehicle Fuel Log".Quantity where("Vehicle No." = field("No."),Date= field("Date Filter")));
        }
        field(50102; "Make Code"; code[20])
        {
            Caption = 'Make Code';
            DataClassification = ToBeClassified;
            TableRelation = Make;
        }
        field(50103; "Model Code"; Code[20])
        {
            Caption = 'Model Code';
            DataClassification = ToBeClassified;
            TableRelation = "Model Code";
        }
        field(50105; "Is Trailer"; Boolean)
        {
            Caption = 'Is Trailer';
            DataClassification = ToBeClassified;
        }
        field(50106; "Trailer No."; Code[20])
        {
            Caption = 'Trailer No.';
            DataClassification = ToBeClassified;
            trigger OnLookup()
            var
                FA: Record "Fixed Asset";
            begin
                FA.SetRange("Is trailer", true);
                if PAGE.RunModal(PAGE::"Trailer List", FA) = ACTION::LookupOK then
                    Rec.Validate("Trailer No.", FA."No.");
            end;
        }
        field(50107; "Vehicle Status"; Enum "Vehicle Status")
        {
            Caption = 'Vehicle Status';
            DataClassification = ToBeClassified;
        }
        field(50109; "Country"; Text[150])
        {
            Caption = 'Country';
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region";
        }
        field(50111; "Station"; Enum Station)
        {
            Caption = 'Station';
            DataClassification = ToBeClassified;
        }
        field(50112; "Vehicle Used For"; Enum "Vehicle Used For")
        {
            Caption = 'Vehicle Used For';
            DataClassification = ToBeClassified;
        }
        field(50113; "Vehicle Type"; Text[50])
        {
            Caption = 'Vehicle Type';
            DataClassification = ToBeClassified;
            TableRelation = "Vehicle Type";
        }
        field(50114; "Body Type"; Text[50])
        {
            Caption = 'Body Type';
            DataClassification = ToBeClassified;
            TableRelation = "Body Types";
        }
        field(50115; "Fuel Type"; Enum "Fuel Type")
        {
            Caption = 'Fuel Type';
            DataClassification = ToBeClassified;
        }
        field(50116; "Date Registered"; Date)
        {
            Caption = 'Date Registered';
            DataClassification = ToBeClassified;
        }
        field(50117; "Manf.Year"; Integer)
        {
            Caption = 'Manf.Year';
            DataClassification = ToBeClassified;
        }
        field(50118; "Booking Location Code"; Code[20])
        {
            Caption = 'Booking Location Code';
            DataClassification = ToBeClassified;
            TableRelation = Location where("Use As In-Transit" = const(false));
        }
        field(50119; "Created By"; Text[50])
        {
            Caption = 'Created By';
            DataClassification = ToBeClassified;
        }
        field(50120; "Created Date"; Date)
        {
            Caption = 'Created Date';
            DataClassification = ToBeClassified;
        }
        field(50121; "Last Modified by"; Date)
        {
            Caption = 'Last Modified by';
            DataClassification = ToBeClassified;
        }
        field(50122; "Last Modified Date"; Date)
        {
            Caption = 'Last Modified Date';
            DataClassification = ToBeClassified;
        }
        field(50126; "Next Inspection Date"; Date)
        {
            Caption = 'Next Inspection Date';
            DataClassification = ToBeClassified;
        }
        field(50127; "Next Service By Distance"; Decimal)
        {
            Caption = 'Next Service By Distance';
            DataClassification = ToBeClassified;
        }
        field(50128; "Inspection Odometer"; Decimal)
        {
            Caption = 'Inspection Odometer';
            DataClassification = ToBeClassified;
        }
        field(50129; "Next Inspection By Distance"; Decimal)
        {
            Caption = 'Next Inspection By Distance';
            DataClassification = ToBeClassified;
        }
        field(50130; "Next Alignment By Distance"; Decimal)
        {
            Caption = 'Next Alignment By Distance';
            DataClassification = ToBeClassified;
        }
        field(50131; "Next Alignment Date"; Date)
        {
            Caption = 'Next Alignment Date';
            DataClassification = ToBeClassified;
        }
        field(50137; "Mobile Phone No."; Text[20])
        {
            Caption = 'Mobile Phone No.';
            DataClassification = ToBeClassified;
        }
        field(50139; "Exterior Colour"; Text[50])
        {
            Caption = 'Exterior Colour';
            DataClassification = ToBeClassified;
        }
        field(50140; "Interior Colour"; Text[50])
        {
            Caption = 'Interior Colour';
            DataClassification = ToBeClassified;
        }
        field(50141; "Key No."; Text[250])
        {
            Caption = 'Key No.';
            DataClassification = ToBeClassified;
        }
        field(50142; "Vehicle Phone No."; Text[250])
        {
            Caption = 'Vehicle Phone No.';
            DataClassification = ToBeClassified;
        }
        field(50143; "Gross Vehicle Weight"; Decimal)
        {
            Caption = 'Gross Vehicle Weight';
            DataClassification = ToBeClassified;
        }
        field(50144; "Gearbox Type"; Code[20])
        {
            Caption = 'Gearbox Type';
            DataClassification = ToBeClassified;
            TableRelation = "Gearbox Type";
        }
        field(50145; "No Of Doors"; Integer)
        {
            Caption = 'No Of Doors';
            DataClassification = ToBeClassified;
        }
        field(50146; "Chassis No."; Code[50])
        {
            Caption = 'Chassis No.';
            DataClassification = ToBeClassified;
        }
        field(50147; "Engine No."; code[50])
        {
            Caption = 'Engine No.';
            DataClassification = ToBeClassified;
        }
        field(50148; "Engine CC"; Integer)
        {
            Caption = 'Engine CC';
            DataClassification = ToBeClassified;
        }
        field(50149; "Tank Size"; Decimal)
        {
            Caption = 'Tank Size';
            DataClassification = ToBeClassified;
        }
        field(50150; "Next Service Type"; Text[50])
        {
            Caption = 'Next Service Type';
            DataClassification = ToBeClassified;
        }
        field(50151; "Distance home to work"; Text[50])
        {
            Caption = 'Distance Home To Work';
            DataClassification = ToBeClassified;
        }
        field(50152; "Service Odometer"; Decimal)
        {
            Caption = 'Service Odometer';
            DataClassification = ToBeClassified;
        }
        field(50153; "Warranty distance"; Integer)
        {
            Caption = 'Warranty Distance';
            DataClassification = ToBeClassified;
        }
        field(50154; "Transit goods License Expiry"; Date)
        {
            Caption = 'Transit Goods License Expiry';
            DataClassification = ToBeClassified;
        }
        field(50155; "Insurance Company"; Code[20])
        {
            Caption = 'Insurance Company';
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
        field(50156; "Insurance Expiry Date"; Date)
        {
            Caption = 'Insurance Expiry Date';
            DataClassification = ToBeClassified;
        }
        field(50157; "Service Date"; Date)
        {
            Caption = 'Service Date';
            DataClassification = ToBeClassified;
        }
        field(50158; "Last Service Type"; Text[50])
        {
            Caption = 'Last Service Type';
            DataClassification = ToBeClassified;
        }
        field(50159; "Service interval(KMS)"; Integer)
        {
            Caption = 'Service interval(KMS)';
            DataClassification = ToBeClassified;
        }
        field(50160; "Inspection Date"; Date)
        {
            Caption = 'Inspection Date';
            DataClassification = ToBeClassified;
        }
        field(50161; "Inspection Interval(KMs)"; Decimal)
        {
            Caption = 'Inspection Interval(KMs)';
            DataClassification = ToBeClassified;
        }
        field(50162; "Inspection Certificate No."; Integer)
        {
            Caption = 'Inspection Certificate No.';
            DataClassification = ToBeClassified;
        }
        field(50163; "Inspected by"; Text[50])
        {
            Caption = 'Inspected By';
            DataClassification = ToBeClassified;
        }
        field(50164; "Wheel Alignent date"; Date)
        {
            Caption = 'Wheel Alignent Date';
            DataClassification = ToBeClassified;
        }
        field(50165; "Alignment Odometer"; Decimal)
        {
            Caption = 'Alignment Odometer';
            DataClassification = ToBeClassified;
        }
        field(50166; "Alignment type"; Text[50])
        {
            Caption = 'Alignment Type';
            DataClassification = ToBeClassified;
        }
        field(50167; "Alignent Interval(Distance)"; Integer)
        {
            Caption = 'Alignent Interval(Distance)';
            DataClassification = ToBeClassified;
        }
        field(50168; "Speed Governor installation"; Date)
        {
            Caption = 'Speed Governor Installation Date';
            DataClassification = ToBeClassified;
        }
        field(50169; "Speed Governor Certification"; Code[20])
        {
            Caption = 'Speed Governor Certification No.';
            DataClassification = ToBeClassified;
        }
        field(50170; "Speed Governor expiry date"; Date)
        {
            Caption = 'Speed Governor Expiry Date';
            DataClassification = ToBeClassified;
        }
        field(50171; "Tracking System installation"; Date)
        {
            Caption = 'Tracking System Installation Date';
            DataClassification = ToBeClassified;
        }
        field(50172; "Tracking Certificate No."; Code[20])
        {
            Caption = 'Tracking Certificate No.';
            DataClassification = ToBeClassified;
        }
        field(50173; "Tracking System expiry date"; Date)
        {
            Caption = 'Tracking System Expiry Date';
            DataClassification = ToBeClassified;
        }

        field(50182; "Front Tyre Make"; Text[50])
        {
            Caption = 'Front Tyre Make';
            DataClassification = ToBeClassified;
        }
        field(50183; "Rear Tyre Make"; Text[50])
        {
            Caption = 'Rear Tyre Make';
            DataClassification = ToBeClassified;
        }
        field(50184; "Battery Make"; Text[50])
        {
            Caption = 'Battery Make';
            DataClassification = ToBeClassified;
        }
        field(50185; "Body Make"; Text[50])
        {
            Caption = 'Body Make';
            DataClassification = ToBeClassified;
        }
        field(50186; "Gearbox Make"; Text[50])
        {
            Caption = 'Gearbox Make';
            DataClassification = ToBeClassified;
        }
        field(50187; "Speed Govenor Make"; Text[50])
        {
            Caption = 'Speed Govenor Make';
            DataClassification = ToBeClassified;
        }
        field(50188; "Tail Lift"; Text[50])
        {
            Caption = 'Tail Lift';
            DataClassification = ToBeClassified;
        }
        field(50189; "Axle Type"; Text[50])
        {
            Caption = 'Axle Type';
            DataClassification = ToBeClassified;
        }
        field(50190; "No. Of wheels"; Integer)
        {
            Caption = 'No. Of Wheels';
            DataClassification = ToBeClassified;
        }
        field(50191; "Front Tyre Size"; Decimal)
        {
            Caption = 'Front Tyre Size';
            DataClassification = ToBeClassified;
        }
        field(50192; "Rear Tyre Size"; Decimal)
        {
            Caption = 'Rear Tyre Size';
            DataClassification = ToBeClassified;
        }
        field(50193; "Battery Size"; Code[20])
        {
            Caption = 'Battery Size';
            DataClassification = ToBeClassified;
        }
        field(50194; "Body Serial"; Integer)
        {
            Caption = 'Body Serial';
            DataClassification = ToBeClassified;
        }
        field(50195; "Gear Box Serial"; Integer)
        {
            Caption = 'Gear Box Serial';
            DataClassification = ToBeClassified;
        }
        field(50196; "Speed Limited No."; Integer)
        {
            Caption = 'Speed Limited No.';
            DataClassification = ToBeClassified;
        }
        field(50197; "Tail No."; Integer)
        {
            Caption = 'Tail No.';
            DataClassification = ToBeClassified;
        }
        field(50198; "Axle No."; Integer)
        {
            Caption = 'Axle No.';
            DataClassification = ToBeClassified;
        }
        field(50199; "Fork Lift Height"; Decimal)
        {
            Caption = 'Fork Lift Height';
            DataClassification = ToBeClassified;
        }
        field(50200; "Front Tyre PSI"; Integer)
        {
            Caption = 'Front Tyre PSI';
            DataClassification = ToBeClassified;
        }
        field(50201; "Rear Tyre PSI"; Integer)
        {
            Caption = 'Rear Tyre PSI';
            DataClassification = ToBeClassified;
        }
        field(50202; "Battery Type"; Text[50])
        {
            Caption = 'Battery Type';
            DataClassification = ToBeClassified;
        }
        field(50203; "Speed Limiter Expiry Date"; Date)
        {
            Caption = 'Speed Limiter Expiry Date';
            DataClassification = ToBeClassified;
        }
        field(50204; "Tail SWL"; Integer)
        {
            Caption = 'Tail SWL';
            DataClassification = ToBeClassified;
        }
        field(50205; "Axle Ratio"; Integer)
        {
            Caption = 'Axle Ratio';
            DataClassification = ToBeClassified;
        }

        field(50209; "Warranty End Date"; Date)
        {
            Caption = 'Warranty End Date';
            DataClassification = ToBeClassified;
        }

        field(50229; "Vehicle Owner"; Enum "Vehicle Owner")
        {
            Caption = 'Vehicle Owner';
            DataClassification = ToBeClassified;
        }



        field(50239; "Initial Licence Fee"; Decimal)
        {
            Caption = 'Initial Licence Fee';
            DataClassification = ToBeClassified;
        }

        field(50252; "Supply method"; Enum "Supply Method")
        {
            Caption = 'Supply Method';
            DataClassification = ToBeClassified;
        }
        field(50253; "Contract start date"; Date)
        {
            Caption = 'Contract Start Date';
            DataClassification = ToBeClassified;
        }
        field(50254; "Contract RV payment"; Integer)
        {
            Caption = 'Contract RV Payment';
            DataClassification = ToBeClassified;
        }
        field(50255; "Contract No."; Integer)
        {
            Caption = 'Contract No.';
            DataClassification = ToBeClassified;
        }
        field(50256; "Contract duration"; Integer)
        {
            Caption = 'Contract Duration';
            DataClassification = ToBeClassified;
        }
        field(50257; "Contract distance"; Integer)
        {
            Caption = 'Contract Distance';
            DataClassification = ToBeClassified;
        }
        field(50258; "Excess Charge"; Decimal)
        {
            Caption = 'Excess Charge';
            DataClassification = ToBeClassified;
        }
        field(50259; "Non driver reimbursement"; Text[50])
        {
            Caption = 'Non Driver Reimbursement';
            DataClassification = ToBeClassified;
        }
        field(50260; "Contract Maintenance"; Text[50])
        {
            Caption = 'Contract Maintenance';
            DataClassification = ToBeClassified;
        }
        field(50261; "Replaceent Vehicle Charge"; Decimal)
        {
            Caption = 'Replaceent Vehicle Charge';
            DataClassification = ToBeClassified;
        }
        field(50262; "Road Tax Charge"; Decimal)
        {
            Caption = 'Road Tax Charge';
            DataClassification = ToBeClassified;
        }
        field(50263; "Insurance(TP) charge"; Decimal)
        {
            Caption = 'Insurance(TP) Charge';
            DataClassification = ToBeClassified;
        }
        field(50264; "Interest charge"; Decimal)
        {
            Caption = 'Interest Charge';
            DataClassification = ToBeClassified;
        }
        field(50265; "Contract option code"; Integer)
        {
            Caption = 'Contract Option Code';
            DataClassification = ToBeClassified;
            TableRelation = "Contract option code";
        }
        field(50266; "Finance Co."; Text[50])
        {
            Caption = 'Finance Co.';
            DataClassification = ToBeClassified;
        }
        field(50267; "Lease end date"; Date)
        {
            Caption = 'Lease End Date';
            DataClassification = ToBeClassified;
        }
        field(50268; "Contract RV payment date"; Date)
        {
            Caption = 'Contract RV Payment Date';
            DataClassification = ToBeClassified;
        }
        field(50269; "Sale preparation date"; Enum "Sale preparation date")
        {
            Caption = 'Sale Preparation Date';
            DataClassification = ToBeClassified;
        }
        field(50270; "Contract Annual Distance"; Integer)
        {
            Caption = 'Contract Annual Distance';
            DataClassification = ToBeClassified;
        }
        field(50271; "Management charge"; Decimal)
        {
            Caption = 'Management Charge';
            DataClassification = ToBeClassified;
        }
        field(50272; "Tyres charge"; Decimal)
        {
            Caption = 'Tyres Charge';
            DataClassification = ToBeClassified;
        }
        field(50273; "Recovery service charge"; Decimal)
        {
            Caption = 'Recovery Service Charge';
            DataClassification = ToBeClassified;
        }
        field(50274; "Insurance(other) charge"; Decimal)
        {
            Caption = 'Insurance(other) Charge';
            DataClassification = ToBeClassified;
        }
        field(50275; "Monthly instalment"; Integer)
        {
            Caption = 'Monthly Instalment';
            DataClassification = ToBeClassified;
        }
        field(50276; "Contract net charge"; Decimal)
        {
            Caption = 'Contract Net Charge';
            DataClassification = ToBeClassified;
        }
        field(50277; "Electronically invoiced"; Boolean)
        {
            Caption = 'Electronically Invoiced';
            DataClassification = ToBeClassified;
        }
        field(50278; "Toyota contract no"; Text[50])
        {
            Caption = 'Toyota Contract No.';
            DataClassification = ToBeClassified;
        }
        field(50279; "Vehicle release date"; Date)
        {
            Caption = 'Vehicle Release Date';
            DataClassification = ToBeClassified;
        }
        field(50280; "Lease contract no"; Integer)
        {
            Caption = 'Lease Contract No.';
            DataClassification = ToBeClassified;
        }
        field(50281; "Interest base rate"; Decimal)
        {
            Caption = 'Interest Base Rate';
            DataClassification = ToBeClassified;
        }
        field(50282; "Interest margin rate"; Decimal)
        {
            Caption = 'Interest Margin Rate';
            DataClassification = ToBeClassified;
        }
        field(50283; "Interest total rate"; Decimal)
        {
            Caption = 'Interest Total Rate';
            DataClassification = ToBeClassified;
        }
        field(50284; "Non recoverable tax charge"; Decimal)
        {
            Caption = 'Non Recoverable Tax Charge';
            DataClassification = ToBeClassified;
        }
        field(50285; "Monthly charge"; Decimal)
        {
            Caption = 'Monthly Charge';
            DataClassification = ToBeClassified;
        }
        field(50286; "Total service charge"; Decimal)
        {
            Caption = 'Total Service Charge';
            DataClassification = ToBeClassified;
        }
        field(50287; "Contract finance"; Text[50])
        {
            Caption = 'Contract Finance';
            DataClassification = ToBeClassified;
        }
        field(50288; "Total lease charge"; Decimal)
        {
            Caption = 'Total Lease Charge';
            DataClassification = ToBeClassified;
        }

        field(50290; "Winter tyres"; Text[50])
        {
            Caption = 'Winter Tyres';
            DataClassification = ToBeClassified;
        }
        field(50291; "Finance adjustment"; Text[50])
        {
            Caption = 'Finance Adjustment';
            DataClassification = ToBeClassified;
        }
        field(50292; "Total monthly charge"; Decimal)
        {
            Caption = 'Total Monthly Charge';
            DataClassification = ToBeClassified;
        }
        field(50293; "Sales condition"; Enum "Sales condition")
        {
            Caption = 'Sales Condition';
            DataClassification = ToBeClassified;
        }
        field(50294; "Date sale agreed"; Date)
        {
            Caption = 'Date Sale Agreed';
            DataClassification = ToBeClassified;
        }
        field(50295; "Auction date"; Date)
        {
            Caption = 'Auction Date';
            DataClassification = ToBeClassified;
        }
        field(50296; "Sold odometer"; Decimal)
        {
            Caption = 'Sold Odometer';
            DataClassification = ToBeClassified;
        }
        field(50297; "Sales comments"; Text[250])
        {
            Caption = 'Sales Comments';
            DataClassification = ToBeClassified;
        }
        field(50298; "Payment date"; Date)
        {
            Caption = 'Payment Date';
            DataClassification = ToBeClassified;
        }
        field(50299; "Sold reference"; Text[50])
        {
            Caption = 'Sold reference';
            DataClassification = ToBeClassified;
        }
        field(50300; "Sale reason"; Enum "Sale reason")
        {
            Caption = 'Sale Reason';
            DataClassification = ToBeClassified;
        }
        field(50301; "Vehicle sale price"; Decimal)
        {
            Caption = 'Vehicle Sale Price';
            DataClassification = ToBeClassified;
        }
        field(50302; "Sold Recipient"; Text[50])
        {
            Caption = 'Sold Recipient';
            DataClassification = ToBeClassified;
        }
        field(50303; "Recipient ID No."; Integer)
        {
            Caption = 'Recipient ID No.';
            DataClassification = ToBeClassified;
        }
        field(50304; "Note 1"; Text[1000])
        {
            Caption = 'Note 1';
            DataClassification = ToBeClassified;
        }
        field(50305; "Note 2"; Text[1000])
        {
            Caption = 'Note 2';
            DataClassification = ToBeClassified;
        }
        field(50306; "Note 3"; Text[1000])
        {
            Caption = 'Note 3';
            DataClassification = ToBeClassified;
        }
        field(50309; "Driver ID"; Code[20])
        {
            Caption = 'Driver ID';
            DataClassification = ToBeClassified;
            TableRelation = Employee where("Job Title" = const('Driver'));
            trigger OnValidate()
            var
                Driver: Record Employee;
            begin
                if Driver.get("Driver ID") then
                    "Driver Name" := Driver.FullName()
                else
                    "Driver Name" := '';
            end;
        }
        field(50310; "Driver Name"; Text[100])
        {
            Caption = 'Driver Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50311;"Date Filter";Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(50312; "Last Trip Date"; Date)
        {
            Caption = 'Last Trip Date';
            FieldClass = FlowField;
            CalcFormula = max(Trip."Trip Date" where("Vehicle No." = field("No.")));
            Editable = false;
 
        }
    }
    trigger OnAfterInsert()
    var
        DimensionValue: Record "Dimension Value";
        Dim: Record Dimension;
        GLSetup: Record "General Ledger Setup";
        DimCode: Code[20];
        DimValue: Code[20];
    begin
        GLSetup.Get();
        DimCode := GLSetup."Global Dimension 1 Code";
        DimValue := Rec."No.";
        if not DimensionValue.Get(DimCode, DimValue) then begin
            DimensionValue.Init();
            DimensionValue.Validate("Dimension Code", DimCode);
            DimensionValue.Validate(Code, DimValue);
            DimensionValue.Validate(Name, DimValue);
            DimensionValue.Insert(true);
        end;
        Rec.Validate("Global Dimension 1 Code", Rec."No.");
    end;
}