table 57056 "Stock Issue header"
{
    Caption = 'Stock Issue header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Stock Issue No."; Code[20])
        {
            Caption = 'Stock Issue No.';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Unigroupsetup: Record "Unigroup Setup";
                NoSeriesMgmt: Codeunit "No. Series";
            begin
                if "Stock Issue No." <> xRec."Stock Issue No." then begin
                    Unigroupsetup.Get;
                    NoSeriesMgmt.TestManual(Unigroupsetup."Stock Issue No.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Stock Issue Date"; Date)
        {
            Caption = 'Stock Issue Date';
            DataClassification = ToBeClassified;
        }
        // field(3; "Stock Issue status"; Enum "Stock request status")
        // {
        //     Caption = 'Stock Issue status';
        //     DataClassification = ToBeClassified;
        // }
        field(4; "Requested By"; Text[50])
        {
            Caption = 'Requested By';
            DataClassification = ToBeClassified;

        }
        field(5; "Job Card No."; Code[20])
        {
            Caption = 'Job Card No.';
            DataClassification = ToBeClassified;

        }
        field(6; "Job Card Type"; Enum "Job Card Type")
        {
            Caption = 'Job Card Type';
            ObsoleteState = Removed;
            ObsoleteReason = 'Removed';
        }
        field(7; "Vehicle No."; Code[20])
        {
            Caption = 'Vehicle No.';
            DataClassification = ToBeClassified;
            Editable = false;
            trigger OnLookup()
            var
                FA: Record "Fixed Asset";
            begin
                FA.SetRange("Is trailer", false);
                if PAGE.RunModal(PAGE::"Vehicle List", FA) = ACTION::LookupOK then
                    Rec.Validate("Vehicle No.", FA."No.");
            end;


        }
        field(8; "Driver ID"; Code[20])
        {
            Caption = 'Driver ID';
            DataClassification = ToBeClassified;
            TableRelation = Employee where("Job Title" = const('Driver'));
            Editable = false;

        }
        field(9; "Issued To"; Code[20])
        {
            Caption = 'Issued To';
            DataClassification = ToBeClassified;

        }
        field(10; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
        }
        field(11; "Mechanic No."; Code[20])
        {
            Caption = 'Mechanic No.';
            DataClassification = ToBeClassified;
        }
        field(12; "Mechanic Name"; Text[50])
        {
            Caption = 'Mechanic Name';
            DataClassification = ToBeClassified;
        }
        field(13; "Job Type"; Code[20])
        {
            Caption = 'Job Type';
            DataClassification = ToBeClassified;
            TableRelation = "Job Type";
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
        key(PK; "Stock Issue No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        if "Stock Issue No." = '' then begin
            Unigroupsetup.Get;
            Unigroupsetup.TestField("Stock Issue No.");
            "No. Series" := Unigroupsetup."Stock Issue No.";
            if NoSeriesMgmt.AreRelated(Unigroupsetup."Stock Issue No.", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "Stock Issue No." := NoSeriesMgmt.GetNextNo("No. Series");

        end;
    end;

    procedure AssistEdit(StockIssueNoRec: Record "Stock Issue header"): Boolean
    var
        StockIssueNo: Record "Stock Issue header";
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        StockIssueNo := Rec;
        Unigroupsetup.Get;
        Unigroupsetup.TestField(Unigroupsetup."Stock Issue No.");
        if NoSeriesMgmt.LookupRelatedNoSeries(Unigroupsetup."Stock Issue No.", StockIssueNoRec."No. Series", "No. Series") then begin
            NoSeriesMgmt.GetNextNo(StockIssueNo."Stock Issue No.", WorkDate(), true);
            Rec := StockIssueNo;
            exit(true);
        end;
    end;
}



