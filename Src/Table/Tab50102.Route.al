table 50102 Route
{
    Caption = 'Route';
    DataClassification = ToBeClassified;
    LookupPageId = "Route List";
    DrillDownPageId = "Route List";
    fields
    {
        field(1; "Route Code"; Code[20])
        {
            Caption = 'Route Code';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Unigroupsetup: Record "Unigroup Setup";
                NoSeriesMgmt: Codeunit "No. Series";
            begin
                if "Route Code" <> xRec."Route Code" then begin
                    Unigroupsetup.Get;
                    NoSeriesMgmt.TestManual(Unigroupsetup."Route Code");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Route From"; Code[50])
        {
            Caption = 'Route From';
            DataClassification = ToBeClassified;
            TableRelation = "Route Location";
            trigger OnValidate()
            begin
                Rec.TestStatusOpen();
            end;
        }
        field(3; "Route To"; Code[50])
        {
            Caption = 'Route To';
            DataClassification = ToBeClassified;
            trigger OnLookup()
            var
                RouteSetUp: Record "Route Location";
            begin
                if "Route From" = '' then
                    Error('Route From can not be empty');
                RouteSetUp.SetFilter(code, '<>%1', "Route From");
                if PAGE.RunModal(PAGE::"Route Location List", RouteSetUp) = ACTION::LookupOK then
                    Validate("Route To", RouteSetUp.Code);
            end;

            trigger OnValidate()
            var
                Route: Record Route;
            begin
                Rec.TestStatusOpen();
                if "Route To" = "Route From" then
                    FieldError("Route To");
                Route.Reset();
                Route.SetRange("Route From", Rec."Route From");
                Route.SetRange("Route To", Rec."Route To");
                Route.SetRange("Route Type", Rec."Route Type");
                If Route.FindFirst() then
                    Error('This Route is already exist');
            end;
        }
        field(4; "Route KM"; Decimal)
        {
            Caption = 'Route KM';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Rec.TestStatusOpen();
            end;
        }
        field(5; "Standard Route Price"; Decimal)
        {
            Caption = 'Standard Route Price';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Rec.TestStatusOpen();
            end;
        }
        field(6; "Fuel Allocation"; Decimal)
        {
            Caption = 'Fuel Allocation';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Rec.TestStatusOpen();
            end;
        }
        field(7; "Allowance Per Day"; Decimal)
        {
            Caption = 'Allowance Per Day';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Rec.TestStatusOpen();
            end;
        }
        field(8; "TAT In Days"; Integer)
        {
            Caption = 'TAT In Days';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Rec.TestStatusOpen();
            end;
        }
        field(9; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
        }
        field(10; "Route Approval Status"; Enum "UTL Approval Status")
        {
            Caption = 'Route Approval Status';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "Route Type"; Enum "Route Type")
        {
            Caption = 'Route Type';
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
        key(PK; "Route Code")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Route Code", "Route From", "Route To")
        {

        }

    }
    trigger OnInsert()
    var
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        if "Route Code" = '' then begin
            Unigroupsetup.Get;
            Unigroupsetup.TestField("Route Code");
            "No. Series" := Unigroupsetup."Route Code";
            if NoSeriesMgmt.AreRelated(Unigroupsetup."Route Code", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "Route Code" := NoSeriesMgmt.GetNextNo("No. Series");

        end;
    end;

    trigger OnDelete()
    var
        myInt: Integer;
    begin
        Rec.TestStatusOpen();
    end;

    procedure AssistEdit(RouteNoRec: Record Route): Boolean
    var
        RouteNo: Record Route;
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        RouteNo := Rec;
        Unigroupsetup.Get;
        Unigroupsetup.TestField(Unigroupsetup."Route Code");
        if NoSeriesMgmt.LookupRelatedNoSeries(Unigroupsetup."Route Code", RouteNoRec."No. Series", "No. Series") then begin
            NoSeriesMgmt.GetNextNo(RouteNo."Route Code", WorkDate(), true);
            Rec := RouteNo;
            exit(true);
        end;
    end;

    procedure TestStatusOpen()
    begin
        TestField("Route Approval Status", "Route Approval Status"::Open);
    end;
}
