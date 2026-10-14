table 57058 "Inspection Header"
{
    Caption = 'Inspection';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Inspection No."; Code[20])
        {
            Caption = 'Inspection No.';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Unigroupsetup: Record "Unigroup Setup";
                NoSeriesMgmt: Codeunit "No. Series";
            begin
                if "Inspection No." <> xRec."Inspection No." then begin
                    Unigroupsetup.Get;
                    NoSeriesMgmt.TestManual(Unigroupsetup."Inspection No.");
                    "No. Series" := '';
                    LoadTemplate();
                end;
            end;
        }
        field(2; "Inspection Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; "Vehicle No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fixed Asset";
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
                VehicleRec: Record "Fixed Asset";
            begin
                IF VehicleRec.Get("Vehicle No.") THEN begin
                    "Trailer No." := VehicleRec."Trailer No.";
                    "Driver ID" := VehicleRec."Driver ID";
                    "Driver Name" := VehicleRec."Driver Name";
                end ELSE begin
                    "Trailer No." := '';
                    "Driver ID" := '';
                    "Driver Name" := '';
                end
            end;
        }
        field(4; "Trailer No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            trigger OnLookup()
            var
                FA: Record "Fixed Asset";
            begin
                FA.SetRange("Is trailer", true);
                if PAGE.RunModal(PAGE::"Trailer List", FA) = ACTION::LookupOK then
                    Rec.Validate("Trailer No.", FA."No.");
            end;
        }
        field(5; "Driver ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = Employee where("Job Title" = const('Driver'));
        }
        field(6; "Driver Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; Mileage; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9; Remarks; Text[250])
        {
            DataClassification = ToBeClassified;
        }

        field(10; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
        }
        field(11; "Inspection Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Trip ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Trip where("Trip Status" = const(approved));
            trigger OnValidate()
            var
                TripRec: Record Trip;
            begin
                TripRec.Reset();
                if TripRec.get("Trip ID") then begin
                    Rec."Vehicle No." := TripRec."Vehicle No.";
                    Rec."Trailer No." := TripRec."Allocated Trailer No.";
                    Rec."Driver ID" := TripRec."Driver ID";
                    Rec."Driver Name" := TripRec."Driver Name";
                end else begin
                    Rec."Vehicle No." := '';
                    Rec."Trailer No." := '';
                    Rec."Driver ID" := '';
                    Rec."Driver Name" := '';
                end;

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

    }
    keys
    {
        key(PK; "Inspection No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        if "Inspection No." = '' then begin
            Unigroupsetup.Get;
            Unigroupsetup.TestField("Inspection No.");
            "No. Series" := Unigroupsetup."Inspection No.";
            if NoSeriesMgmt.AreRelated(Unigroupsetup."Inspection No.", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "Inspection No." := NoSeriesMgmt.GetNextNo("No. Series");
        end;
        "Inspection Date" := WorkDate();
        "Inspection Time" := Time;
    end;

    procedure AssistEdit(InspectionNoRec: Record "Inspection Header"): Boolean
    var
        InspectionNo: Record "Inspection Header";
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        InspectionNo := Rec;
        Unigroupsetup.Get;
        Unigroupsetup.TestField(Unigroupsetup."Inspection No.");
        if NoSeriesMgmt.LookupRelatedNoSeries(Unigroupsetup."Inspection No.", InspectionNoRec."No. Series", "No. Series") then begin
            NoSeriesMgmt.GetNextNo(InspectionNo."Inspection No.", WorkDate(), true);
            Rec := InspectionNo;
            exit(true);
        end;
    end;

    procedure LoadTemplate()
    var
        Inspectionchklst: Record "Inspection Check List Template";
        ILine, Inspetionline : Record "Inspection Line";
        LineNo: Integer;
        EntryNo: Integer;
    begin
        if not Confirm('Do you want to Load default Inspection Check list?', true) then
            exit else begin
            ILine.Reset();
            ILine.SetRange("Inspection No.", Rec."Inspection No.");
            if ILine.FindSet() then
                if Confirm('Do you want to delete the existing lines?', true) then
                    ILine.DeleteAll()
                else
                    exit;
            Inspectionchklst.Reset();
            if Inspectionchklst.FindFirst() then begin
                repeat
                    LineNo += 10000;
                    Inspetionline.Init();
                    Inspetionline."Inspection No." := Rec."Inspection No.";
                    Inspetionline."Line No." := LineNo;
                    Inspetionline."Check List" := Inspectionchklst."Check List";
                    Inspetionline."Inspection Category" := Inspectionchklst."Inspection Category";
                    Inspetionline."Ok or Not Ok?" := true;
                    Inspetionline.Insert();
                until Inspectionchklst.Next() = 0;
                Message('Successfully Loaded');
            end;
        end;
    end;
}
