table 57053 "Gatepass"
{
    Caption = 'Gatepass';
    DataClassification = ToBeClassified;
    LookupPageId = "Gatepass List";
    DrillDownPageId = "Gatepass List";

    fields
    {
        field(1; "Gatepass No."; Code[20])
        {
            Caption = 'Gatepass No.';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Unigroupsetup: Record "Unigroup Setup";
                NoSeriesMgmt: Codeunit "No. Series";
            begin
                if "Gatepass No." <> xRec."Gatepass No." then begin
                    Unigroupsetup.Get;
                    NoSeriesMgmt.TestManual(Unigroupsetup."Gatepass No.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Gatepass Date"; Date)
        {
            Caption = 'Gatepass Date';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; "Created time"; Time)
        {
            Caption = 'Created time';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; "Created By"; Code[20])
        {
            Caption = 'Created By';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Gatepass Type"; Enum "Gatepass Type")
        {
            Caption = 'Gatepass Type';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Requested By"; Text[100])
        {
            Caption = 'Requested By';
            DataClassification = ToBeClassified;
        }
        field(7; "Trip ID"; Code[20])
        {
            Caption = 'Trip ID';
            DataClassification = ToBeClassified;
            TableRelation = Trip;
            trigger OnValidate()
            var
                DriverIDRec: Record Employee;
                TripRec: Record Trip;
                GPRec: Record Gatepass;
            begin
                // GPRec.Reset();
                // GPRec.SetRange("Gatepass Type", GPRec."Gatepass Type"::Permanent);
                // GPRec.SetRange("Trip ID", Rec."Trip ID");
                // if GPRec.FindFirst() then
                //     Error('Gatepass already created with Reference No. %1', GPRec."Gatepass No.");
                IF TripRec.Get("Trip ID") THEN begin
                    Rec.validate("Vehicle No.", TripRec."Vehicle No.");
                    Rec.validate("Driver ID", TripRec."Driver ID");
                    Rec.validate("Driver Name", TripRec."Driver Name");
                    Rec.validate("Trailer No.", TripRec."Allocated Trailer No.");
                    Rec.Validate("From(Source)", TripRec."From(Source)");
                    rec.Validate("To (Destination)", TripRec."To (Destination)");
                end ELSE begin
                    "Vehicle No." := '';
                    "Driver ID" := '';
                    "Driver Name" := '';
                    "Trailer No." := '';
                    "From(Source)" := '';
                    "To (Destination)" := '';
                end;
            end;
        }
        field(8; "Driver Name"; Text[50])
        {
            Caption = 'Driver Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Driver ID"; Code[20])
        {
            Caption = 'Driver ID';
            DataClassification = ToBeClassified;
            TableRelation = Driver;
            trigger OnValidate()
            var
                DriverIDRec: Record Driver;
            begin
                IF DriverIDRec.Get("Driver ID") THEN
                    "Driver Name" := DriverIDRec.Description
                ELSE
                    "Driver Name" := '';
            end;
        }
        field(10; "From(Source)"; code[20])
        {
            Caption = 'From(Source)';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Route Location";
        }
        field(11; "To (Destination)"; Code[20])
        {
            Caption = 'To (Destination)';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Route Location";
        }
        field(12; "Purpose/Description"; Text[1000])
        {
            Caption = 'Purpose /Description';
            DataClassification = ToBeClassified;
        }
        field(13; Remarks; Text[1000])
        {
            Caption = 'Remarks';
            DataClassification = ToBeClassified;
        }
        field(14; "Expected No Of Trips"; Integer)
        {
            Caption = 'Expected No Of Trips';
            DataClassification = ToBeClassified;
        }
        field(15; "Approval Status"; Enum "UTL Approval Status")
        {
            Caption = 'Approval Status';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16; "Vehicle No."; Code[20])
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

            trigger OnValidate()
            var
                Vehicle: Record "Fixed Asset";
            begin
                Vehicle.Reset();
                Vehicle.SetRange("No.", Rec."Vehicle No.");
                if Vehicle.FindFirst() then begin
                    if Rec."Trip ID" = '' then begin
                        Rec.validate("Driver ID", Vehicle."Driver ID");
                        Rec.validate("Driver Name", Vehicle."Driver Name");
                        Rec.validate("Trailer No.", Vehicle."Trailer No.");
                    end;
                end;
            end;
        }
        field(17; "Trailer No."; Code[20])
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
        field(18; "Expired Date"; date)
        {
            Caption = 'Expired Date';
            DataClassification = ToBeClassified;
        }
        field(19; "Expired Time"; Time)
        {
            Caption = 'Expired Time';
            DataClassification = ToBeClassified;
        }
        field(20; "Gate Pass Status"; Enum "Active/In-Active Enum")
        {
            Caption = 'Gate Pass Status';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(21; Posted; Boolean)
        {
            Caption = 'Posted';
            DataClassification = ToBeClassified;
        }
        field(22; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
        }
        field(23; "Location Code"; Code[20])
        {
            Caption = 'Location Code';
            DataClassification = ToBeClassified;
            TableRelation = Location where("Use As In-Transit" = const(false));
        }
        field(24; "Temp Gatepass Expiry Date"; date)
        {
            Caption = 'Temp Gatepass Expiry Date';
            DataClassification = ToBeClassified;
        }
        field(25; "Temp Gatepass Expiry Time"; Time)
        {
            Caption = 'Temp Gatepass Expiry Time';
            DataClassification = ToBeClassified;
        }

        field(27; "Departure Odometer(Km)"; Integer)
        {
            Caption = 'Departure Odometer(Km)';
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
        key(PK; "Gatepass No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        if "Gatepass No." = '' then begin
            Unigroupsetup.Get;
            Unigroupsetup.TestField("Gatepass No.");
            "No. Series" := Unigroupsetup."Gatepass No.";
            if NoSeriesMgmt.AreRelated(Unigroupsetup."Gatepass No.", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "Gatepass No." := NoSeriesMgmt.GetNextNo("No. Series");
        end;
        "Gatepass Date" := WorkDate();
        "Created time" := Time;
        "Created By" := UserId;
        "Gatepass Type" := "Gatepass Type"::Permanent;
    end;

    procedure AssistEdit(GatePassNoRec: Record "Gatepass"): Boolean
    var
        GatePassNo: Record "Gatepass";
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        GatePassNo := Rec;
        Unigroupsetup.Get;
        Unigroupsetup.TestField(Unigroupsetup."Gatepass No.");
        if NoSeriesMgmt.LookupRelatedNoSeries(Unigroupsetup."Gatepass No.", GatePassNoRec."No. Series", "No. Series") then begin
            NoSeriesMgmt.GetNextNo(GatePassNo."Gatepass No.", WorkDate(), true);
            Rec := GatePassNo;
            exit(true);
        end;
    end;

    procedure Post()
    var
        Trip: Record Trip;
        GPRec: Record Gatepass;
        Vehicle: Record "Fixed Asset";
    begin
        Rec.TestField("Approval Status", Rec."Approval Status"::Approved);
        if "Gatepass Type" = "Gatepass Type"::Permanent then begin
            if not Confirm('Do you want to post the Gatepass?', true) then
                exit else begin
                Rec.Posted := true;
                Rec.Modify();
            end;
            if Trip.Get(Rec."Trip ID") then begin
                Trip.validate("Trip Status", Trip."Trip Status"::Live);
                Trip.Validate("Trip Stage", Trip."Trip Stage"::"Gatepass Completed");
                Trip.Validate("Gatepass No.", Rec."Gatepass No.");
                Trip.Validate("Departure Date", Rec."Gatepass Date");
                Trip.Modify();
            end;
            if Vehicle.Get(Rec."Vehicle No.") then begin
                if Rec."Gatepass Type" = rec."Gatepass Type"::Permanent then begin
                    Vehicle.Validate("Vehicle Status", Vehicle."Vehicle Status"::Allocated);
                    Vehicle.Modify();
                end;
            end;
        end else
            Error('You can not post a temporary gatepass. Please convert to Permanent and Post.');


    end;
}
