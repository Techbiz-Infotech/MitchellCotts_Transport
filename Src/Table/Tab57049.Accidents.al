table 57049 Accidents
{
    Caption = 'Accidents';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Accident No."; Code[20])
        {
            Caption = 'Accident No.';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Unigroupsetup: Record "Unigroup Setup";
                NoSeriesMgmt: Codeunit "No. Series";
            begin
                if "Accident No." <> xRec."Accident No." then begin
                    Unigroupsetup.Get;
                    NoSeriesMgmt.TestManual(Unigroupsetup."Accident No.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Accident ref."; Code[20])
        {
            Caption = 'Accident ref.';
            DataClassification = ToBeClassified;
        }
        field(3; "Accident Status"; Enum "Accident Status")
        {
            Caption = 'Accident Status';
            DataClassification = ToBeClassified;
        }
        field(4; "Third Party Involved"; Boolean)
        {
            Caption = 'Third Party Involved';
            DataClassification = ToBeClassified;
        }
        field(5; "Accident Date"; Date)
        {
            Caption = 'Accident Date';
            DataClassification = ToBeClassified;
        }
        field(6; "Driver Id"; Code[20])
        {
            Caption = 'Driver Id';
            DataClassification = ToBeClassified;
            TableRelation = Employee where("Job Title" = const('Driver'));
            trigger OnValidate()
            var
                DriverIDRec: Record Employee;
            begin
                IF DriverIDRec.Get("Driver ID") THEN begin
                    "Driver Name" := DriverIDRec.FullName();
                    "Driver Date of Birth" := DriverIDRec."Birth Date";
                    "Phone No." := DriverIDRec."Phone No.";
                    "Home Address" := DriverIDRec.Address;
                end ELSE begin
                    "Driver Name" := '';
                    "Driver Date of Birth" := 0D;
                    "Phone No." := '';
                    "Home Address" := '';
                end;
            end;

        }
        field(7; "Driver Name"; Text[50])
        {
            Caption = 'Driver Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "Incident Type"; Text[50])
        {
            Caption = 'Incident Type';
            DataClassification = ToBeClassified;
            TableRelation = "Incident Type";
        }

        field(9; "Make Code"; Code[20])
        {
            Caption = 'Make Code';
            DataClassification = ToBeClassified;
            TableRelation = Make;
        }
        field(10; "Model Code"; Code[20])
        {
            Caption = 'Model Code';
            DataClassification = ToBeClassified;
            TableRelation = "Model Code";
        }
        field(11; "Est Total Cost"; Decimal)
        {
            Caption = 'Est Total Cost';
            DataClassification = ToBeClassified;

        }
        field(12; "Total Cost"; Decimal)
        {
            Caption = 'Total Cost';
            DataClassification = ToBeClassified;
        }
        field(13; Comment; Text[150])
        {
            Caption = 'Comment';
            DataClassification = ToBeClassified;
        }
        field(14; "Liability Flag"; Enum "Liability Flag")
        {
            Caption = 'Liability Flag';
            DataClassification = ToBeClassified;
        }
        field(15; "Party To Blame"; Enum "Part to Blame")
        {
            Caption = 'Party To Blame';
            DataClassification = ToBeClassified;
        }
        field(16; Date; Date)
        {
            Caption = 'Date';
            DataClassification = ToBeClassified;
        }
        field(17; "Date Accident Report For Rec"; Date)
        {
            Caption = 'Date Accident Report For Received';
            DataClassification = ToBeClassified;
        }
        field(18; "Insurance Company No."; Code[20])
        {
            Caption = 'Insurance Company No.';
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
            trigger OnValidate()
            var
                InsuranceCompanyNoRec: Record Vendor;
            begin
                IF InsuranceCompanyNoRec.Get("Insurance Company No.") THEN
                    "Insurance Company" := InsuranceCompanyNoRec.Name
                ELSE
                    "Insurance Company" := '';
            end;
        }
        field(19; "Insurance Company"; Text[50])
        {
            Caption = 'Insurance Company';
            DataClassification = ToBeClassified;

        }
        field(20; "Date Insurers Notified"; Date)
        {
            Caption = 'Date Insurers Notified';
            DataClassification = ToBeClassified;
        }
        field(21; "Insurers Reference"; Text[50])
        {
            Caption = 'Insurers Reference';
            DataClassification = ToBeClassified;
        }
        field(22; "Brokers Name"; Text[1000])
        {
            Caption = 'Brokers Name';
            DataClassification = ToBeClassified;
        }
        field(23; "Brokers Reference"; Text[1000])
        {
            Caption = 'Brokers Reference';
            DataClassification = ToBeClassified;
        }
        field(24; "Claim Handler"; Text[250])
        {
            Caption = 'Claim Handler';
            DataClassification = ToBeClassified;
        }
        field(25; "Date Claim Completed"; Date)
        {
            Caption = 'Date Claim Completed';
            DataClassification = ToBeClassified;
        }
        field(26; "Solicitors Name"; Text[250])
        {
            Caption = 'Solicitors Name';
            DataClassification = ToBeClassified;
        }
        field(27; "Solicitors Reference"; Text[250])
        {
            Caption = 'Solicitors Reference';
            DataClassification = ToBeClassified;
        }
        field(28; Driver; Boolean)
        {
            Caption = 'Driver';
            DataClassification = ToBeClassified;
        }
        field(29; "Driver Date of Birth"; Date)
        {
            Caption = 'Driver Date of Birth';
            DataClassification = ToBeClassified;
        }
        field(31; "Licence No."; Code[20])
        {
            Caption = 'Licence No.';
            DataClassification = ToBeClassified;
        }

        field(32; "Phone No."; Text[20])
        {
            Caption = 'Phone No.';
            DataClassification = ToBeClassified;
        }
        field(33; "Home Address"; Text[250])
        {
            Caption = 'Home Address';
            DataClassification = ToBeClassified;
        }
        field(34; "Other Vehicle Involved"; Boolean)
        {
            Caption = 'Other Vehicle Involved';
            DataClassification = ToBeClassified;
        }

        field(36; "Vehicle No."; Code[20])
        {
            Caption = 'Vehicle No.';
            DataClassification = ToBeClassified;
            trigger OnLookup()
            var
                FA: Record "Fixed Asset";
            begin
                FA.SetRange("Is trailer", false);
                if PAGE.RunModal(PAGE::"Vehicle List", FA) = ACTION::LookupOK then
                    Rec.Validate("Vehicle No.", FA."No.");
            end;
        }
        field(37; "Car/Commercial"; Text[50])
        {
            Caption = 'Car/Commercial';
            DataClassification = ToBeClassified;
        }
        field(38; "Engine Cc"; Integer)
        {
            Caption = 'Engine Cc';
            DataClassification = ToBeClassified;
        }
        field(39; "Fuel Type"; Enum "Fuel Type")
        {
            Caption = 'Fuel Type';
            DataClassification = ToBeClassified;
        }
        field(40; "Current Mileage"; Decimal)
        {
            Caption = 'Current Mileage';
            DataClassification = ToBeClassified;
        }
        field(41; "Type"; Text[50])
        {
            Caption = 'Type';
            DataClassification = ToBeClassified;
            TableRelation = "Vehicle Type";
        }
        field(42; "Hire Vehicle Make"; Text[50])
        {
            Caption = 'Hire Vehicle Make';
            DataClassification = ToBeClassified;
        }
        field(43; "Hire vehicle model"; Text[50])
        {
            Caption = 'Hire vehicle model';
            DataClassification = ToBeClassified;
        }
        field(44; Cc; Integer)
        {
            Caption = 'Cc';
            DataClassification = ToBeClassified;
        }
        field(45; "Public Liability Claim rec by"; Enum "Public Liability")
        {
            Caption = 'Public Liability Claim received by';
            DataClassification = ToBeClassified;
        }
        field(46; "Exact Location"; Text[50])
        {
            Caption = 'Exact Location';
            DataClassification = ToBeClassified;
        }
        field(47; Weather; Enum Weather)
        {
            Caption = 'Weather';
            DataClassification = ToBeClassified;
        }
        field(48; "Speed at Time of Incident"; Text[50])
        {
            Caption = 'Speed at Time of Incident';
            DataClassification = ToBeClassified;
        }
        field(49; "Full Incident Description"; Text[1000])
        {
            Caption = 'Full Incident Description';
            DataClassification = ToBeClassified;
        }
        field(50; "Speed Limit"; Integer)
        {
            Caption = 'Speed Limit';
            DataClassification = ToBeClassified;
        }
        field(51; "Street Lights"; Enum "Street Lights")
        {
            Caption = 'Street Lights';
            DataClassification = ToBeClassified;
        }
        field(52; "Road Type"; Enum "Road Type")
        {
            Caption = 'Road Type';
            DataClassification = ToBeClassified;
        }
        field(53; "Road Conditions"; Enum "Road Conditions")
        {
            Caption = 'Road Conditions';
            DataClassification = ToBeClassified;
        }
        field(54; "Use of Vehicle at time of Inc"; Text[50])
        {
            Caption = 'Use of Vehicle at time of Incident';
            DataClassification = ToBeClassified;
        }
        field(55; "Current location"; Text[50])
        {
            Caption = 'Current location';
            DataClassification = ToBeClassified;
        }
        field(56; "Damage to our vehicle"; Boolean)
        {
            Caption = 'Damage to our vehicle';
            DataClassification = ToBeClassified;
        }
        field(57; Damage; Text[1000])
        {
            Caption = 'Damage';
            DataClassification = ToBeClassified;
        }
        field(58; "Time of incident"; Time)
        {
            Caption = 'Time of incident';
            DataClassification = ToBeClassified;
        }
        field(59; "Incident time range"; Text[50])
        {
            Caption = 'Incident time range';
            DataClassification = ToBeClassified;
        }
        field(60; Lights; Text[50])
        {
            Caption = 'Lights';
            DataClassification = ToBeClassified;
        }
        field(61; Signalling; Text[50])
        {
            Caption = 'Signalling';
            DataClassification = ToBeClassified;
        }
        field(62; "Corrective Action"; Text[1000])
        {
            Caption = 'Corrective Action';
            DataClassification = ToBeClassified;
        }
        field(63; "Hsse Review"; Text[1000])
        {
            Caption = 'Hsse Review';
            DataClassification = ToBeClassified;
        }
        field(64; "Vehicle Broken Into"; Boolean)
        {
            Caption = 'Vehicle Broken Into';
            DataClassification = ToBeClassified;
        }
        field(65; "Were all Doors Locked?"; Boolean)
        {
            Caption = 'Were all Doors Locked?';
            DataClassification = ToBeClassified;
        }
        field(66; "How was Entry Gained?"; Enum "How was Entry Gained")
        {
            Caption = 'How was Entry Gained?';
            DataClassification = ToBeClassified;
        }
        field(67; "Where was Entry Gained?"; Enum "Where was Entry Gained")
        {
            Caption = 'Where was Entry Gained?';
            DataClassification = ToBeClassified;
        }
        field(68; "Has the vehicle been Rec"; Text[100])
        {
            Caption = 'Has the vehicle been Recovered?';
            DataClassification = ToBeClassified;
        }
        field(69; "Garage Name"; Text[50])
        {
            Caption = 'Garage Name';
            DataClassification = ToBeClassified;
        }
        field(70; "Garage Telephone No."; Text[20])
        {
            Caption = 'Garage Telephone No.';
            DataClassification = ToBeClassified;
        }
        field(71; "Vehicle Booking Date"; Date)
        {
            Caption = 'Vehicle Booking Date';
            DataClassification = ToBeClassified;
        }
        field(72; "Date Repair Authorised "; Date)
        {
            Caption = 'Date Repair Authorised';
            ObsoleteState = Removed;
            ObsoleteReason = 'Removed';
        }
        field(73; "Date Engineer Notified"; Text[50])
        {
            Caption = 'Date Engineer Notified';
            DataClassification = ToBeClassified;
        }
        field(74; "Completion Date"; Date)
        {
            Caption = 'Completion Date';
            DataClassification = ToBeClassified;
        }
        field(75; "Write Off"; Boolean)
        {
            Caption = 'Write Off';
            DataClassification = ToBeClassified;
        }
        field(76; "Write Off Category"; Text[50])
        {
            Caption = 'Write Off Category';
            DataClassification = ToBeClassified;
        }
        field(77; "Total Loss Confirmed"; Text[50])
        {
            Caption = 'Total Loss Confirmed';
            DataClassification = ToBeClassified;
        }
        field(78; "Settlement Figure Requested"; Text[50])
        {
            Caption = 'Settlement Figure Requested';
            DataClassification = ToBeClassified;
        }
        field(79; "Settlement Invoice Received"; Text[50])
        {
            Caption = 'Settlement Invoice Received';
            DataClassification = ToBeClassified;
        }
        field(80; "Salvage Offer Received"; Text[50])
        {
            Caption = 'Salvage Offer Received';
            DataClassification = ToBeClassified;
        }
        field(81; "Salvage Cheque Received"; Text[50])
        {
            Caption = 'Salvage Cheque Received';
            DataClassification = ToBeClassified;
        }
        field(82; " Vehicle Hired?"; Text[50])
        {
            Caption = 'Vehicle Hired?';
            ObsoleteState = Removed;
            ObsoleteReason = 'Removed';
        }
        field(83; "Vehicle Hired From"; Text[50])
        {
            Caption = 'Vehicle Hired From';
            DataClassification = ToBeClassified;
        }
        field(84; "Vehicle Hired To"; Text[50])
        {
            Caption = 'Vehicle Hired To';
            DataClassification = ToBeClassified;
        }
        field(85; "Repair Review Date"; Date)
        {
            Caption = 'Repair Review Date';
            DataClassification = ToBeClassified;
        }
        field(86; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
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
        key(PK; "Accident No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        if "Accident No." = '' then begin
            Unigroupsetup.Get;
            Unigroupsetup.TestField("Accident No.");
            "No. Series" := Unigroupsetup."Accident No.";
            if NoSeriesMgmt.AreRelated(Unigroupsetup."Accident No.", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "Accident No." := NoSeriesMgmt.GetNextNo("No. Series");
        end;
    end;

    procedure AssistEdit(AccidentNoRec: Record Accidents): Boolean
    var
        AccidentNo: Record Accidents;
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        AccidentNo := Rec;
        Unigroupsetup.Get;
        Unigroupsetup.TestField(Unigroupsetup."Accident No.");
        if NoSeriesMgmt.LookupRelatedNoSeries(Unigroupsetup."Accident No.", AccidentNoRec."No. Series", "No. Series") then begin
            NoSeriesMgmt.GetNextNo(AccidentNo."Accident No.", WorkDate(), true);
            Rec := AccidentNo;
            exit(true);
        end;
    end;
}
