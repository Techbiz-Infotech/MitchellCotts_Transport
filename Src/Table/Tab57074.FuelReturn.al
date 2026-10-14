table 57074 "Fuel Return"
{
    Caption = 'Fuel Return';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Fuel Returns";
    LookupPageId = "Fuel Returns";
    fields
    {
        field(1; "Fuel Return No."; Code[20])
        {
            Caption = 'Fuel Return No.';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Unigroupsetup: Record "Unigroup Setup";
                NoSeriesMgmt: Codeunit "No. Series";
            begin
                if "Fuel Return No." <> xRec."Fuel Return No." then begin
                    Unigroupsetup.Get;
                    NoSeriesMgmt.TestManual(Unigroupsetup."Fuel Return No.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Vehicle No."; Code[20])
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
                    if Rec."Fuel Issue For" = Rec."Fuel Issue For"::Trip then begin
                        Vehicle.CalcFields("Balance Fuel");
                        rec."Balance Fuel in Truck" := Vehicle."Balance Fuel";
                    end;
                    if Vehicle."Fuel Type" <> Vehicle."Fuel Type"::" " then
                        Rec."Fuel Type" := Vehicle."Fuel Type"
                    else
                        error('Fuel Type(Diesel or Petrol) must have a value in Vehicle card');
                    if Rec."Trip ID" = '' then begin
                        Rec.validate("Driver ID", Vehicle."Driver ID");
                        Rec.validate("Driver Name", Vehicle."Driver Name");
                        Rec.validate("Trailer No.", Vehicle."Trailer No.");
                    end;
                end;
            end;
        }
        field(3; Pump; Text[250])
        {
            Caption = 'Pump';
            DataClassification = ToBeClassified;
            TableRelation = Pump;
        }
        field(4; "Fueling Station Name"; Text[250])
        {
            Caption = 'Fueling Station Name';
            DataClassification = ToBeClassified;
        }
        field(5; "Driver ID"; Code[20])
        {
            Caption = 'Driver ID';
            DataClassification = ToBeClassified;
            TableRelation = Employee where("Job Title" = const('Driver'));

        }
        field(6; "Driver Name"; Text[50])
        {
            Caption = 'Driver Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; Odometer; Integer)
        {
            Caption = 'Odometer';
            DataClassification = ToBeClassified;
        }
        field(11; "Required Fuel In Litres"; Decimal)
        {
            Caption = 'Required Fuel In Litres';
            DataClassification = ToBeClassified;
        }
        // field(12; "Location Code"; Code[20])
        // {
        //     Caption = 'Location Code';
        //     DataClassification = ToBeClassified;
        //     TableRelation = Location where("Use As In-Transit" = const(false));
        // }
        field(13; "Balance Fuel in Vehicle"; Decimal)
        {
            Caption = 'Balance Fuel in Vehicle';
            ObsoleteState = Removed;
            ObsoleteReason = 'removed';
            Editable = false;
        }
        field(14; "Return Date"; Date)
        {
            Caption = 'Return Date';
            DataClassification = ToBeClassified;
        }
        field(15; "Balance Fuel in Truck"; Integer)
        {
            Caption = 'Balance Fuel in Vehicle';
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(17; "Fuel Type"; Enum "Fuel Type")
        {
            Caption = 'Fuel Type';
            DataClassification = ToBeClassified;
        }
        field(18; "Unit of measure"; code[20])
        {
            Caption = 'Unit Of Measure';
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(20; "Tank Size"; Decimal)
        {
            Caption = 'Tank Size';
            DataClassification = ToBeClassified;
        }
        field(21; "Fuel Approval Status"; Enum "UTL Approval Status")
        {
            Caption = 'Fuel Approval Status';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(22; "Trailer No."; Code[20])
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
        field(23; "Shortage in Liters(If Any)"; Decimal)
        {
            Caption = 'Shortage In liters(If Any)';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Rec.Validate("Net Requirement in litres", ("Shortage in liters(If Any)" + "Net Requirement in litres"));
            end;
        }
        field(24; "Net Requirement In Litres"; Decimal)
        {
            Caption = 'Net Requirement In Litres';
            DataClassification = ToBeClassified;
        }
        field(25; "Shortage Reason"; Enum "Shortage Reason")
        {
            Caption = 'Shortage Reason';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin

            end;
        }
        field(26; "Fuel Issue For"; Enum "Petty Cash For")
        {
            Caption = 'Fuel Issue For';
            DataClassification = ToBeClassified;
        }
        field(27; "Transaction Time"; Time)
        {
            Caption = 'Transaction Time';
            DataClassification = ToBeClassified;
        }
        field(28; "Transaction No."; Code[20])
        {
            Caption = 'Transaction No.';
            DataClassification = ToBeClassified;
        }
        field(29; Posted; Boolean)
        {
            Caption = 'Posted';
            DataClassification = ToBeClassified;
            //Editable = false;
        }
        field(30; "Trip ID"; Code[20])
        {
            Caption = 'Trip ID';
            DataClassification = ToBeClassified;
            TableRelation = Trip;
            trigger OnValidate()
            var
                DriverIDRec: Record Employee;
                TripIdrec: Record Trip;
            begin
                IF TripIdrec.Get("Trip ID") THEN begin
                    Rec.validate("Vehicle No.", TripIdrec."Vehicle No.");
                    Rec.validate("Driver ID", TripIdrec."Driver ID");
                    Rec.validate("Driver Name", TripIdrec."Driver Name");
                    Rec.validate("Trailer No.", TripIdrec."Allocated Trailer No.");
                    Rec.Validate("Required Fuel In Litres", TripIdrec."Total Fuel Expected");
                    Rec.Validate("Net Requirement in litres", ("Required Fuel In Litres" - "Balance Fuel in Truck"));
                end ELSE begin
                    "Vehicle No." := '';
                    "Driver ID" := '';
                    "Driver Name" := '';
                    "Trailer No." := '';
                end;
            end;
        }
        field(31; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
        }
        field(32; "Gen. Product Posting Group"; Code[20])
        {
            Caption = 'General Product Posting Group';
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Product Posting Group";
        }
        field(33; Return; Boolean)
        {
            Caption = 'Return';
            DataClassification = ToBeClassified;
        }
        field(34; "Fuel Issue No."; Code[20])
        {
            Caption = 'Fuel Issue No.';
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
        key(PK; "Fuel Return No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        if "Fuel Return No." = '' then begin
            Unigroupsetup.Get;
            Unigroupsetup.TestField("Fuel Return No.");
            "No. Series" := xRec."No. Series";
            if NoSeriesMgmt.AreRelated(Unigroupsetup."Fuel Return No.", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "Fuel Return No." := NoSeriesMgmt.GetNextNo("No. Series");

        end;
        "Return Date" := WorkDate();
    end;

    procedure AssistEdit(ReturnNumberRec: Record "Fuel Return"): Boolean
    var
        ReturnNumber: Record "Fuel Return";
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        ReturnNumber := Rec;
        Unigroupsetup.Get;
        Unigroupsetup.TestField(Unigroupsetup."Fuel Return No.");
        if NoSeriesMgmt.LookupRelatedNoSeries(Unigroupsetup."Fuel Return No.", ReturnNumberRec."No. Series", "No. Series") then begin
            NoSeriesMgmt.GetNextNo(ReturnNumber."Fuel Return No.", WorkDate(), true);
            Rec := ReturnNumber;
            exit(true);
        end;
    end;
}
