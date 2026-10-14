table 57016 Models
{
    Caption = 'Models';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; "Make Code"; Text[50])
        {
            Caption = 'Make Code';
            DataClassification = ToBeClassified;
            TableRelation = Make;
        }
        field(3; "Model Code"; Text[50])
        {
            Caption = 'Model Code';
            DataClassification = ToBeClassified;
            TableRelation = "Model Code";
        }
        field(4; Derivative; Code[20])
        {
            Caption = 'Derivative';
            DataClassification = ToBeClassified;
        }
        field(5; "Vehicle Type"; Text[50])
        {
            Caption = 'Vehicle Type';
            DataClassification = ToBeClassified;
        }
        field(6; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(7; "Tax Class"; Enum "Tax Class")
        {
            Caption = 'Tax Class';
            DataClassification = ToBeClassified;
        }
        field(8; "Fuel Type"; Enum "Fuel Type")
        {
            Caption = 'Fuel Type';
            DataClassification = ToBeClassified;
        }
        field(9; Co2gKm; Decimal)
        {
            Caption = 'Co2gKm';
            DataClassification = ToBeClassified;
        }
        field(10; BHP; Text[50])
        {
            Caption = 'BHP';
            DataClassification = ToBeClassified;
        }
        field(11; "Fiscal hp"; Text[50])
        {
            Caption = 'Fiscal hp';
            DataClassification = ToBeClassified;
        }
        field(12; "Gearbox Type"; Enum "Gearbox Type")
        {
            Caption = 'Gearbox Type';
            DataClassification = ToBeClassified;
        }
        field(13; "Target Fuel"; Integer)
        {
            Caption = 'Target Fuel';
            DataClassification = ToBeClassified;
        }
        field(14; "Target Fuel (Urban)"; Integer)
        {
            Caption = 'Target Fuel (Urban)';
            DataClassification = ToBeClassified;
        }
        field(15; "Target Cost"; Integer)
        {
            Caption = 'Target Cost';
            DataClassification = ToBeClassified;
        }
        field(16; "Service interval(Weeks)"; Integer)
        {
            Caption = 'Service interval(Weeks)';
            DataClassification = ToBeClassified;
        }
        field(17; "Service Schedule"; Text[250])
        {
            Caption = 'Service Schedule';
            DataClassification = ToBeClassified;
        }
        field(18; "Warranty Days"; Integer)
        {
            Caption = 'Warranty Days';
            DataClassification = ToBeClassified;
        }
        field(19; "Employee Grade"; Enum "Employee Grade")
        {
            Caption = 'Employee Grade';
            DataClassification = ToBeClassified;
        }
        field(20; "Tank Size"; Integer)
        {
            Caption = 'Tank Size';
            DataClassification = ToBeClassified;
        }
        field(21; "P11D Class"; Enum "P11D Class")
        {
            Caption = 'P11D Class';
            DataClassification = ToBeClassified;
        }
        field(22; "Engine Cc"; Text[50])
        {
            Caption = 'Engine Cc';
            DataClassification = ToBeClassified;
        }
        field(23; "Gearbox Speed"; Enum "Gearbox Speed")
        {
            Caption = 'Gearbox Speed';
            DataClassification = ToBeClassified;
        }
        field(24; "Variance fuel"; Integer)
        {
            Caption = 'Variance fuel';
            DataClassification = ToBeClassified;
        }
        field(25; "Target fuel (Extra urban)"; Integer)
        {
            Caption = 'Target fuel (Extra urban)';
            DataClassification = ToBeClassified;
        }
        field(26; "Variance Cost"; Integer)
        {
            Caption = 'Variance Cost';
            DataClassification = ToBeClassified;
        }
        field(27; "Service Int(KMS)"; Integer)
        {
            Caption = 'Service Int(KMS)';
            DataClassification = ToBeClassified;
        }
        field(28; Country; Text[50])
        {
            Caption = 'Country';
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region";
        }
        field(29; "CAP Code"; Code[20])
        {
            Caption = 'CAP Code';
            DataClassification = ToBeClassified;
        }
        field(30; "Glass/ICME Code"; Code[20])
        {
            Caption = 'Glass/ICME Code';
            DataClassification = ToBeClassified;
        }
        field(31; "CAP No."; Integer)
        {
            Caption = 'CAP No.';
            DataClassification = ToBeClassified;
        }
        field(32; "Glass/ICME ID"; Code[20])
        {
            Caption = 'Glass/ICME ID';
            DataClassification = ToBeClassified;
        }

        field(33; "Date Registered"; Date)
        {
            Caption = 'Date Registered';
            DataClassification = ToBeClassified;
        }
        field(34; "Date Purchased"; Date)
        {
            Caption = 'Date Purchased';
            DataClassification = ToBeClassified;
        }
        field(35; "In Service date"; Date)
        {
            Caption = 'In Service Date';
            DataClassification = ToBeClassified;
        }
        field(36; "Odometer on fleet"; Decimal)
        {
            Caption = 'Odometer on fleet';
            DataClassification = ToBeClassified;
        }
        field(37; "Manf.List Price"; Decimal)
        {
            Caption = 'Manf.List Price';
            DataClassification = ToBeClassified;
        }
        field(38; "Total Options"; Integer)
        {
            Caption = 'Total Options';
            DataClassification = ToBeClassified;
        }
        field(39; Delivery; Text[50])
        {
            Caption = 'Delivery';
            DataClassification = ToBeClassified;
        }
        field(40; "Total Cost"; Integer)
        {
            Caption = 'Total Cost';
            DataClassification = ToBeClassified;
        }
        field(41; "Car Tax"; Integer)
        {
            Caption = 'Car Tax';
            DataClassification = ToBeClassified;
        }
        field(42; "Initial registration fee"; Integer)
        {
            Caption = 'Initial registration fee(BIV/TMC)';
            DataClassification = ToBeClassified;
        }
        field(43; "Initial licence fee"; Integer)
        {
            Caption = 'Initial licence fee';
            DataClassification = ToBeClassified;
        }
        field(44; "Registration Received"; Boolean)
        {
            Caption = 'Registration Received';
            DataClassification = ToBeClassified;
        }
        field(45; "Order No."; Integer)
        {
            Caption = 'Order No.';
            DataClassification = ToBeClassified;
        }
        field(46; "Order Reference"; Integer)
        {
            Caption = 'Order Reference';
            DataClassification = ToBeClassified;
        }
        field(47; "Supplier"; Text[50])
        {
            Caption = 'Supplier';
            DataClassification = ToBeClassified;
        }
        field(48; "List price tax"; Integer)
        {
            Caption = 'List price tax';
            DataClassification = ToBeClassified;
        }
        field(49; "Total extras"; Integer)
        {
            Caption = 'Total extras';
            DataClassification = ToBeClassified;
        }
        field(50; "Extras tax"; Integer)
        {
            Caption = 'Extras tax';
            DataClassification = ToBeClassified;
        }
        field(51; "Manufacture Discount"; Date)
        {
            Caption = 'Manufacture Discount/Rebate Date';
            DataClassification = ToBeClassified;
        }
        field(52; "Delivery VAT"; Decimal)
        {
            Caption = 'Delivery VAT';
            DataClassification = ToBeClassified;
        }
        field(53; "Other tax"; Decimal)
        {
            Caption = 'Other tax';
            DataClassification = ToBeClassified;
        }
        field(54; "Total tax"; Decimal)
        {
            Caption = 'Total tax';
            DataClassification = ToBeClassified;
        }
        field(55; "Vehicle Owner"; Text[50])
        {
            Caption = 'Vehicle Owner';
            DataClassification = ToBeClassified;
        }
        field(56; "Supplied Invoice"; Text[50])
        {
            Caption = 'Supplied Invoice';
            DataClassification = ToBeClassified;
        }
        field(57; "Replaces Vehicle"; Text[50])
        {
            Caption = 'Replaces Vehicle';
            DataClassification = ToBeClassified;
        }
        field(58; "Supplier invoice received"; Boolean)
        {
            Caption = 'Supplier invoice received';
            DataClassification = ToBeClassified;
        }
        field(59; Discount; Decimal)
        {
            Caption = 'Discount';
            DataClassification = ToBeClassified;
        }
        field(60; "Discount options(Factory)"; Decimal)
        {
            Caption = 'Discount options(Factory)';
            DataClassification = ToBeClassified;
        }
        field(61; "Manufacturer Discount/Rebate"; Decimal)
        {
            Caption = 'Manufacturer Discount/Rebate';
            DataClassification = ToBeClassified;
        }
        field(62; "Discount rate"; Decimal)
        {
            Caption = 'Discount rate';
            DataClassification = ToBeClassified;
        }
        field(63; "Discount tax"; Decimal)
        {
            Caption = 'Discount tax';
            DataClassification = ToBeClassified;
        }
        field(64; "Total discount"; Decimal)
        {
            Caption = 'Total discount';
            DataClassification = ToBeClassified;
        }
        field(65; "Vehicle Purchase Price"; Integer)
        {
            Caption = 'Vehicle Purchase Price';
            DataClassification = ToBeClassified;
        }
        field(66; "Supply Method"; Enum "Supply Method")
        {
            Caption = 'Supply Method';
            DataClassification = ToBeClassified;
        }
        field(67; "Contract Duration"; Duration)
        {
            Caption = 'Contract Duration';
            DataClassification = ToBeClassified;
        }
        field(68; "Excess Charge"; Integer)
        {
            Caption = 'Excess Charge';
            DataClassification = ToBeClassified;
        }
        field(69; "Non driver reimbursement"; Text[100])
        {
            Caption = 'Non driver reimbursement';
            DataClassification = ToBeClassified;
        }
        field(70; "Contrat Maintenance"; Text[50])
        {
            Caption = 'Contrat Maintenance';
            DataClassification = ToBeClassified;
        }
        field(71; "Replacement Vehicle Charge"; Integer)
        {
            Caption = 'Replacement Vehicle Charge';
            DataClassification = ToBeClassified;
        }
        field(72; "Road Tax Charge"; Integer)
        {
            Caption = 'Road Tax Charge';
            DataClassification = ToBeClassified;
        }
        field(73; "Insurance (TP) Charge"; Integer)
        {
            Caption = 'Insurance (TP) Charge';
            DataClassification = ToBeClassified;
        }
        field(74; "Interest Charge"; Integer)
        {
            Caption = 'Interest Charge';
            DataClassification = ToBeClassified;
        }
        field(75; "Contract CPK"; Text[50])
        {
            Caption = 'Contract CPK';
            DataClassification = ToBeClassified;
        }
        field(76; "Other replacement vehicle"; Text[50])
        {
            Caption = 'Other replacement vehicle';
            DataClassification = ToBeClassified;
        }
        field(77; "Other road tax"; Integer)
        {
            Caption = 'Other road tax';
            DataClassification = ToBeClassified;
        }
        field(78; "Other Insurance(TP)"; Text[250])
        {
            Caption = 'Other Insurance(TP)';
            DataClassification = ToBeClassified;
        }
        field(79; "Drive private use payment"; Integer)
        {
            Caption = 'Drive private use payment';
            DataClassification = ToBeClassified;
        }
        field(80; "Finance Co"; Text[50])
        {
            Caption = 'Finance Co';
            DataClassification = ToBeClassified;
        }
        field(81; "Contract distance"; Integer)
        {
            Caption = 'Contract distance';
            DataClassification = ToBeClassified;
        }
        field(82; "Target distance"; Integer)
        {
            Caption = 'Target distance';
            DataClassification = ToBeClassified;
        }
        field(83; Penality; Integer)
        {
            Caption = 'Penality';
            DataClassification = ToBeClassified;
        }
        field(84; "Management Charge"; Decimal)
        {
            Caption = 'Management Charge';
            DataClassification = ToBeClassified;
        }
        field(85; "Type Charge"; Decimal)
        {
            Caption = 'Type Charge';
            DataClassification = ToBeClassified;
        }
        field(86; "Recovery service charge"; Decimal)
        {
            Caption = 'Recovery service charge';
            DataClassification = ToBeClassified;
        }
        field(87; "Insurance (Other) Chage"; Decimal)
        {
            Caption = 'Insurance (Other) Chage';
            DataClassification = ToBeClassified;
        }
        field(88; "Monthly instalment"; Integer)
        {
            Caption = 'Monthly instalment';
            DataClassification = ToBeClassified;
        }
        field(89; "Contract net charge"; Decimal)
        {
            Caption = 'Contract net charge';
            DataClassification = ToBeClassified;
        }
        field(90; "Winter Tyres"; Text[50])
        {
            Caption = 'Winter Tyres';
            DataClassification = ToBeClassified;
        }
        field(91; "Other recovery"; Text[50])
        {
            Caption = 'Other recovery';
            DataClassification = ToBeClassified;
        }
        field(92; "Other Insurance"; Text[50])
        {
            Caption = 'Other Insurance';
            DataClassification = ToBeClassified;
        }
        field(93; "Finance adjustment"; Text[50])
        {
            Caption = 'Finance adjustment';
            DataClassification = ToBeClassified;
        }
        field(94; "Total monthly charge"; Decimal)
        {
            Caption = 'Total monthly charge';
            DataClassification = ToBeClassified;
        }
        field(95; "Electronically Invoiced"; Boolean)
        {
            Caption = 'Electronically Invoiced';
            DataClassification = ToBeClassified;
        }
        field(96; "Interest base rate"; Decimal)
        {
            Caption = 'Interest base rate';
            DataClassification = ToBeClassified;
        }
        field(97; "Interest margin rate"; Decimal)
        {
            Caption = 'Interest margin rate';
            DataClassification = ToBeClassified;
        }
        field(98; "Interest total rate"; Decimal)
        {
            Caption = 'Interest total rate';
            DataClassification = ToBeClassified;
        }
        field(99; "Non recoverable tax charge"; Decimal)
        {
            Caption = 'Non recoverable tax charge';
            DataClassification = ToBeClassified;
        }
        field(100; "Recoverable tax charge"; Decimal)
        {
            Caption = 'Recoverable tax charge';
            DataClassification = ToBeClassified;
        }
        field(101; "Total service charge"; Decimal)
        {
            Caption = 'Total service charge';
            DataClassification = ToBeClassified;
        }
        field(102; "Contract Finance"; Text[50])
        {
            Caption = 'Contract Finance';
            DataClassification = ToBeClassified;
        }
        field(103; "Total lease charge"; Decimal)
        {
            Caption = 'Total lease charge';
            DataClassification = ToBeClassified;
        }
        field(104; "Other maintenance"; Integer)
        {
            Caption = 'Other maintenance';
            DataClassification = ToBeClassified;
        }
        field(105; "Other employer costs"; Integer)
        {
            Caption = 'Other employer costs';
            DataClassification = ToBeClassified;
        }
        field(106; "Other management"; Text[100])
        {
            Caption = 'Other management';
            DataClassification = ToBeClassified;
        }
        field(107; "Total other services"; Text[50])
        {
            Caption = 'Total other services';
            DataClassification = ToBeClassified;
        }
        field(108; "Other services"; Text[50])
        {
            Caption = 'Other services';
            DataClassification = ToBeClassified;
        }
        field(109; Weightax1; Decimal)
        {
            Caption = 'Weightax1';
            DataClassification = ToBeClassified;
        }
        field(110; Weightax2; Decimal)
        {
            Caption = 'Weightax2';
            DataClassification = ToBeClassified;
        }
        field(111; Weightax3; Decimal)
        {
            Caption = 'Weightax3';
            DataClassification = ToBeClassified;
        }
        field(112; Weightax4; Decimal)
        {
            Caption = 'Weightax4';
            DataClassification = ToBeClassified;
        }
        field(113; "Weightax gvw"; Decimal)
        {
            Caption = 'Service interval(Weeks)';
            DataClassification = ToBeClassified;
        }
        field(114; "Weightax ulw"; Decimal)
        {
            Caption = 'Weightax ulw';
            DataClassification = ToBeClassified;
        }
        field(115; Train; Text[50])
        {
            Caption = 'Train';
            DataClassification = ToBeClassified;
        }
        field(116; "Cab to Rear"; Text[50])
        {
            Caption = 'Cab to Rear';
            DataClassification = ToBeClassified;
        }
        field(117; "Wheel span"; Integer)
        {
            Caption = 'Wheel span';
            DataClassification = ToBeClassified;
        }
        field(118; "Between centres"; Integer)
        {
            Caption = 'Between centres';
            DataClassification = ToBeClassified;
        }
        field(119; Overall; Integer)
        {
            Caption = 'Overall';
            DataClassification = ToBeClassified;
        }
        field(120; "Cab to Axle"; Text[50])
        {
            Caption = 'Cab to Axle';
            DataClassification = ToBeClassified;
        }

        field(150; "Created By"; Text[50])
        {
            Caption = 'Created By';
            DataClassification = ToBeClassified;
        }
        field(151; "Created Date"; Date)
        {
            Caption = 'Created Date';
            DataClassification = ToBeClassified;
        }
        field(152; "Last Modified by"; Date)
        {
            Caption = 'Last Modified by';
            DataClassification = ToBeClassified;
        }
        field(153; "Last Modified Date"; Date)
        {
            Caption = 'Last Modified Date';
            DataClassification = ToBeClassified;
        }




    }
    keys
    {
        key(PK; "Make Code")
        {
            Clustered = true;
        }
    }
}
