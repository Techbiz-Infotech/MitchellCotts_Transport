table 57015 Fines
{
    Caption = 'Fines';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Fine No."; Code[20])
        {
            Caption = 'Fine No.';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Unigroupsetup: Record "Unigroup Setup";
                NoSeriesMgmt: Codeunit "No. Series";
            begin
                if "Fine No." <> xRec."Fine No." then begin
                    Unigroupsetup.Get;
                    NoSeriesMgmt.TestManual(Unigroupsetup."Fine No.");
                    "No. Series" := '';
                end;
            end;

        }

        field(2; "Driver ID"; Code[20])
        {
            Caption = 'Driver ID';
            DataClassification = ToBeClassified;
            TableRelation = Employee where("Job Title" = const('Driver'));
            trigger OnValidate()
            var
                DriverIDRec: Record Employee;
            begin
                IF DriverIDRec.Get("Driver ID") THEN
                    "Driver Name" := DriverIDRec.FullName()
                ELSE
                    "Driver Name" := '';
            end;
        }
        field(3; "Driver Name"; Text[50])
        {
            Caption = 'Driver Name';
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(4; "Vehicle No."; Code[20])
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
        field(5; "Offence Date"; Date)
        {
            Caption = 'Offence Date';
            DataClassification = ToBeClassified;
        }
        field(6; "Fine Amount Kshs"; Decimal)
        {
            Caption = 'Fine Amount Kshs';
            DataClassification = ToBeClassified;
        }
        field(7; "Fine Paid Date"; Date)
        {
            Caption = 'Fine Paid Date';
            DataClassification = ToBeClassified;
        }
        field(8; "Driver or Company"; Text[50])
        {
            Caption = 'Driver or Company';
            DataClassification = ToBeClassified;
        }
        field(9; "Driver Paid Date"; Date)
        {
            Caption = 'Driver Paid Date';
            DataClassification = ToBeClassified;
        }
        field(10; "Offence Description"; Text[250])
        {
            Caption = 'Offence Description';
            DataClassification = ToBeClassified;
        }
        field(11; "No. Series"; Code[20])
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
    }
    keys
    {
        key(PK; "Fine No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        if "Fine No." = '' then begin
            Unigroupsetup.Get;
            Unigroupsetup.TestField("Fine No.");
            "No. Series" := Unigroupsetup."Fine No.";
            if NoSeriesMgmt.AreRelated(Unigroupsetup."Fine No.", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "Fine No." := NoSeriesMgmt.GetNextNo("No. Series");
        end;
    end;

    procedure AssistEdit(FineNoRec: Record Fines): Boolean
    var
        FineNo: Record Fines;
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        FineNo := Rec;
        Unigroupsetup.Get;
        Unigroupsetup.TestField(Unigroupsetup."Fine No.");
        if NoSeriesMgmt.LookupRelatedNoSeries(Unigroupsetup."Fine No.", FineNoRec."No. Series", "No. Series") then begin
            NoSeriesMgmt.GetNextNo(FineNo."Fine No.", WorkDate(), true);
            Rec := FineNo;
            exit(true);
        end;
    end;
}
