table 50159 "Shunting Details"
{
    Caption = 'Shunting Details';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Shunting Trip ID"; Code[20])
        {
            Caption = 'Shunting Trip ID';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Unigroupsetup: Record "Unigroup Setup";
                NoSeriesMgmt: Codeunit "No. Series";
            begin
                if "Shunting Trip ID" <> xRec."Shunting Trip ID" then begin
                    Unigroupsetup.Get;
                    NoSeriesMgmt.TestManual(Unigroupsetup."Shunting Trip No.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Litres Per Trip"; Decimal)
        {
            Caption = 'Litres Per Trip';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                UpdateFuel();
            end;
        }
        field(3; "Trip Completed"; Boolean)
        {
            Caption = 'Trip Completed';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                UpdateFuel();
                UpdateShunting();
            end;
        }
        field(4; "Billing Status"; Enum "Billing Status")
        {
            Caption = 'Billing Status';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Trip Id"; Code[20])
        {
            Caption = 'Trip Id';
            DataClassification = ToBeClassified;
            TableRelation = Trip;
        }
        field(6; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
        }
        field(7; "Container No."; Code[30])
        {
            Caption = 'Container No.';
            DataClassification = ToBeClassified;
        }
        field(8; "Container Size"; Enum "Container Size")
        {
            Caption = 'Container Size';
            DataClassification = ToBeClassified;
        }
        field(9; "Container Charge"; Decimal)
        {
            Caption = 'Container Charge';
            DataClassification = ToBeClassified;
        }
        field(10; "Cargo type"; Enum "cargo Type")
        {
            Caption = 'Cargo Type';
            DataClassification = ToBeClassified;
        }
        field(11; "Delivery Note No"; Code[20])
        {
            Caption = 'Delivery Note No.';
            DataClassification = ToBeClassified;
        }
        field(12; "Interchange No"; Code[20])
        {
            Caption = 'Interchange No.';
            DataClassification = ToBeClassified;
        }
        field(13; "Booking No"; Code[20])
        {
            Caption = 'Booking No.';
            DataClassification = ToBeClassified;
        }

        field(14; "FRO No"; Code[20])
        {
            Caption = 'FRO No.';
            ObsoleteState = Removed;
            ObsoleteReason = 'Not required anymore';
        }
        field(15; "Additional Remarks"; Text[500])
        {
            Caption = 'Additional Remarks';
            DataClassification = ToBeClassified;
        }
        field(16; "Posted Invoice No."; Code[20])
        {
            Caption = 'Posted Invoice No.';
            DataClassification = ToBeClassified;
            TableRelation = "Sales Invoice Header";
        }
        field(17; "Shunting Trip Date"; Date)
        {
            Caption = 'Shunting Trip Date';
            DataClassification = ToBeClassified;
        }
        field(18; "Trip Date"; Date)
        {
            Caption = 'Trip Date';
            //DataClassification = ToBeClassified;
            FieldClass = FlowField;
            CalcFormula = lookup(Trip."Trip Date" where("Trip ID" = field("Trip ID")));
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
        key(PK; "Trip Id", "Shunting Trip ID")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        if "Shunting Trip ID" = '' then begin
            Unigroupsetup.Get;
            Unigroupsetup.TestField("Shunting Trip No.");
            "No. Series" := Unigroupsetup."Shunting Trip No.";
            if NoSeriesMgmt.AreRelated(Unigroupsetup."Shunting Trip No.", xRec."No. Series")then
            "No. Series" := xRec."No. Series";
            "Shunting Trip ID" := NoSeriesMgmt.GetNextNo("No. Series");


        end;
        Rec."Billing Status" := Rec."Billing Status"::Open;
        Rec."Created Date" := Today;
        Rec."Created By" := UserId;
    end;

    trigger OnModify()
    var
        myInt: Integer;
    begin
        Rec."Last Modified by" := UserId;
        Rec."Last Modified Date" := Today;
    end;

    procedure AssistEdit(ShuntingTripNoRec: Record "Shunting Details"): Boolean
    var
        ShuntingTripNo: Record "Shunting Details";
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        ShuntingTripNo := Rec;
        Unigroupsetup.Get;
        Unigroupsetup.TestField(Unigroupsetup."Shunting Trip No.");
        if NoSeriesMgmt.LookupRelatedNoSeries(Unigroupsetup."Shunting Trip No.", ShuntingTripNoRec."No. Series", "No. Series") then begin
            NoSeriesMgmt.GetNextNo(ShuntingTripNo."Shunting Trip ID", WorkDate(), true);
            Rec := ShuntingTripNo;
            exit(true);
        end;
    end;

    procedure UpdateFuel()
    var
        Trip: Record Trip;
        Shunting: Record "Shunting Details";
        BalanceFuel, TotalLitres : Decimal;
    begin
        Shunting.Reset();
        Shunting.SetRange("Trip Id", Rec."Trip Id");
        if Shunting.FindFirst() then begin
            TotalLitres := 0;
            repeat
                TotalLitres += Shunting."Litres Per Trip";
            until Shunting.Next() = 0;
        end;
        if trip.Get(Rec."Trip Id") then begin
            trip.Validate("Total Fuel Expected", TotalLitres);
            trip.Modify();
        end;
        Shunting.Reset();
        Shunting.SetRange("Trip Id", Rec."Trip Id");
        Shunting.SetRange("Trip Completed", false);
        if Shunting.FindFirst() then begin
            BalanceFuel := 0;
            repeat
                BalanceFuel += Shunting."Litres Per Trip";
            until Shunting.Next() = 0;
        end;
        if trip.Get(Rec."Trip Id") then begin
            trip.Validate("Shunting Fuel Balance", BalanceFuel);
            trip.Modify();
        end;
    end;

    procedure UpdateShunting()
    var
        myInt: Integer;
    begin
        If Rec."Billing Status" = Rec."Billing Status"::Invoiced then
            Error('You can not change the value when the Billing Status is invoiced');


        If Rec."Trip Completed" = true then begin
            Rec.TestField("Container Charge");
            Rec.TestField("Container No.");
            if Rec."Cargo type" = Rec."Cargo type"::Container then
                Rec.TestField("Container Size");
            Rec.TestField("Shunting Trip Date");
            Rec.TestField("Cargo type");
            Rec.TestField("Delivery Note No");
            Rec."Billing Status" := Rec."Billing Status"::"Pending for invoice"
        end else
            Rec."Billing Status" := Rec."Billing Status"::Open;
    end;
}