table 57054 "Workshop Jobs"
{
    Caption = 'Workshop Jobs';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Workshop Jobs List";

    fields
    {
        field(1; "Job Card No."; Code[20])
        {
            Caption = 'Job Card No.';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Unigroupsetup: Record "Unigroup Setup";
                NoSeriesMgmt: Codeunit "No. Series";
            begin
                if "Job Card No." <> xRec."Job Card No." then begin
                    Unigroupsetup.Get;
                    NoSeriesMgmt.TestManual(Unigroupsetup."Job Card No.");
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
                VehicleRec: Record "Fixed Asset";
            begin
                if VehicleRec.Get("Vehicle No.") then begin
                    "Make Code" := VehicleRec."Make Code";
                    "Model Code" := VehicleRec."Model Code";
                    "Date Registered" := VehicleRec."Date Registered";
                    "Chassis No." := VehicleRec."Chassis No.";
                    "Driver ID" := VehicleRec."Driver ID";
                    "Driver Name" := VehicleRec."Driver Name";
                end else begin
                    "Make Code" := '';
                    "Model Code" := '';
                    "Date Registered" := 0D;
                    "Chassis No." := '';
                    "Driver ID" := '';
                    "Driver Name" := '';
                end;
            end;


        }
        field(3; "Make Code"; Code[20])
        {
            Caption = 'Make Code';
            DataClassification = ToBeClassified;
            TableRelation = Make;
            Editable = false;
        }
        field(4; "Model Code"; Code[20])
        {
            Caption = 'Model Code';
            DataClassification = ToBeClassified;
            TableRelation = "Model Code";
            Editable = false;
        }
        field(5; "Job Card Type"; Enum "Job Card Type")
        {
            Caption = 'Job Card Type';
            ObsoleteState = Removed;
            ObsoleteReason = 'not required anymore';
        }
        field(6; "Driver ID"; Code[20])
        {
            Caption = 'Driver ID';
            DataClassification = ToBeClassified;
            TableRelation = Employee where("Job Title" = const('Driver'));
            Editable = false;
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
        field(7; "Driver Name"; Text[50])
        {
            Caption = 'Driver Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "Vehicle Type"; Text[50])
        {
            Caption = 'Vehicle Type';
            DataClassification = ToBeClassified;
            TableRelation = "Vehicle Type";
            Editable = false;
        }
        field(9; "Chassis No."; Code[20])
        {
            Caption = 'Chassis No.';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; "Job Date"; Date)
        {
            Caption = 'Job Date';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "Date Registered"; Date)
        {
            Caption = 'Date Registered';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "Job Type"; Code[20])
        {
            Caption = 'Job Type';
            DataClassification = ToBeClassified;
            TableRelation = "Job Type";
            trigger OnValidate()
            var
                JobType: Record "Job Type";
                DueDays: DateFormula;
            begin
                if JobType.Get("Job Type") then
                    "Due Date" := CalcDate(JobType."Due Days", WorkDate())
                else
                    "Due Date" := 0D;
            end;
        }
        field(13; "Location Code"; Code[20])
        {
            Caption = 'Location Code';
            DataClassification = ToBeClassified;
            TableRelation = Location where("Use As In-Transit" = const(false));
        }
        field(15; "Due Date"; Date)
        {
            Caption = 'Due Date';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(17; "Job End Date"; Date)
        {
            Caption = 'Job End Date';
            DataClassification = ToBeClassified;
        }
        field(19; "Job Status"; Enum "Job Status Details")
        {
            Caption = 'Job Status';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
            begin

            end;
        }
        field(20; "Cost parts"; Decimal)
        {
            Caption = 'Cost parts';
            DataClassification = ToBeClassified;
        }
        field(23; "Odometer In"; Decimal)
        {
            Caption = 'Odometer In';
            DataClassification = ToBeClassified;
        }
        field(24; " Days Off Road"; Decimal)
        {
            Caption = ' Days Off Road';
            ObsoleteState = Removed;
            ObsoleteReason = 'Removed';
        }
        field(25; "Odometer Out"; Decimal)
        {
            Caption = 'Odometer Out';
            DataClassification = ToBeClassified;
        }
        field(26; " Service Adviser"; code[20])
        {
            Caption = ' Service Adviser';
            ObsoleteState = Removed;
            ObsoleteReason = 'Removed';
            TableRelation = Employee;
        }

        field(29; "Fitter (Payroll No.) "; Code[20])
        {
            Caption = 'Fitter (Payroll No.) ';
            ObsoleteState = Removed;
            ObsoleteReason = 'Removed';
            TableRelation = Employee;
        }
        field(30; "Appointed Mechanic"; Code[20])
        {
            Caption = 'Appointed Mechanic ID';
            DataClassification = ToBeClassified;
            TableRelation = Employee where("Job Title" = const('Mechanic'));
            trigger OnValidate()
            var
                Mech: Record Employee;
            begin
                if Mech.Get("Appointed Mechanic") then
                    "Appointed Mechanic Name" := Mech.FullName()
                else
                    "Appointed Mechanic Name" := '';
            end;
        }
        field(31; "Appointed Welder"; Code[20])
        {
            Caption = 'Appointed Welder ID';
            DataClassification = ToBeClassified;
            TableRelation = Employee where("Job Title" = const('Welder'));
            trigger OnValidate()
            var
                Mech: Record Employee;
            begin
                if Mech.Get("Appointed Welder") then
                    "Appointed Welder Name" := Mech.FullName()
                else
                    "Appointed Welder Name" := '';
            end;
        }
        field(32; "Appointed Tyreman"; Code[20])
        {
            Caption = 'Appointed Tyreman ID';
            DataClassification = ToBeClassified;
            TableRelation = Employee where("Job Title" = const('Tyreman'));
            trigger OnValidate()
            var
                Mech: Record Employee;
            begin
                if Mech.Get("Appointed Tyreman") then
                    "Appointed Tyreman Name" := Mech.FullName()
                else
                    "Appointed Tyreman Name" := '';
            end;
        }
        field(34; "Appointed Electrician"; Code[20])
        {
            Caption = 'Appointed Electrician ID';
            DataClassification = ToBeClassified;
            TableRelation = Employee where("Job Title" = const('Electrician'));
            trigger OnValidate()
            var
                Mech: Record Employee;
            begin
                if Mech.Get("Appointed Electrician") then
                    "Appointed Electrician Name" := Mech.FullName()
                else
                    "Appointed Electrician Name" := '';
            end;
        }
        field(35; "Appointed Panel Beater"; Code[20])
        {
            Caption = 'Appointed Panel beater ID';
            DataClassification = ToBeClassified;
            TableRelation = Employee where("Job Title" = const('Panel Beater'));
            trigger OnValidate()
            var
                Mech: Record Employee;
            begin
                if Mech.Get("Appointed Panel Beater") then
                    "Appointed Panel Beater Name" := Mech.FullName()
                else
                    "Appointed Panel Beater Name" := '';
            end;
        }
        field(36; Comments; Text[1000])
        {
            Caption = 'Comments';
            DataClassification = ToBeClassified;
        }
        field(37; "Closing Comments"; Text[1000])
        {
            Caption = 'Closing Comments';
            DataClassification = ToBeClassified;
        }
        field(38; "Time In"; Time)
        {
            Caption = 'Time In';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(39; "Time Out"; Time)
        {
            Caption = 'Time Out';
            DataClassification = ToBeClassified;
        }
        field(40; "Engine Number"; Code[20])
        {
            Caption = 'Engine Number';
            DataClassification = ToBeClassified;
        }
        field(41; "Mileage In"; Integer)
        {
            Caption = 'Mileage In';
            DataClassification = ToBeClassified;
        }
        field(42; "Fitter"; Code[20])
        {
            Caption = 'Fitter';
            TableRelation = Employee where("Job Title" = const('Fitter'));
        }
        field(43; "Job Service Adviser"; code[20])
        {
            Caption = 'Job Service Adviser';
            DataClassification = ToBeClassified;
            TableRelation = Employee where("Job Title" = const('Service Adviser'));
        }
        field(45; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
        }
        field(46; "Appointed Mechanic Name"; Text[50])
        {
            Caption = 'Appointed Mechanic Name';
            DataClassification = ToBeClassified;
        }
        field(47; "Appointed Welder Name"; Text[50])
        {
            Caption = 'Appointed Welder Name';
            DataClassification = ToBeClassified;

        }
        field(48; "Appointed Tyreman Name"; Text[50])
        {
            Caption = 'Appointed Tyreman Name';
            DataClassification = ToBeClassified;

        }
        field(49; "Appointed Electrician Name"; Text[50])
        {
            Caption = 'Appointed Electrician Name';
            DataClassification = ToBeClassified;

        }
        field(50; "Appointed Panel Beater Name"; Text[50])
        {
            Caption = 'Appointed Panel Beater Name';
            DataClassification = ToBeClassified;

        }
        field(51; "Closed By"; Code[20])
        {
            Caption = 'Closed By';
            DataClassification = ToBeClassified;
        }
        field(52; "Created By(Code)"; Code[20])
        {
            Caption = 'Created By(Code)';
            DataClassification = ToBeClassified;
            TableRelation = Employee;
            trigger OnValidate()
            var
                Employee: Record Employee;
            begin
                if Employee.get("Created By(Code)") then
                    Rec."Created By Name" := Employee.FullName()
                else
                    Rec."Created By Name" := '';
            end;
        }
        field(53; "Created By(Name)"; Code[20])
        {
            Caption = 'Created By(Name)';
            ObsoleteState = Removed;
            ObsoleteReason = 'Removed';
        }
        field(54; "Created By Name"; Text[100])
        {
            Caption = 'Created By(Name)';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(55; "Next Service Date"; Date)
        {
            Caption = 'Next Service Date';
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
        key(PK; "Job Card No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        if "Job Card No." = '' then begin
            Unigroupsetup.Get;
            Unigroupsetup.TestField("Job Card No.");
            "No. Series" := Unigroupsetup."Job Card No.";
            if NoSeriesMgmt.AreRelated(Unigroupsetup."Job Card No.", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "Job Card No." := NoSeriesMgmt.GetNextNo("No. Series");
        end;
        Rec."Job Status" := Rec."Job Status"::Open;
        "Job Date" := WorkDate();
        "Created By" := UserId;
        "Time In" := Time;
    end;

    trigger OnDelete()
    var
    begin
        if Rec."Job Status" <> Rec."Job Status"::" " then
            Error('You do not have permission to delete The records.');
    end;

    procedure AssistEdit(JobCardNoRec: Record "Workshop Jobs"): Boolean
    var
        JobCardNo: Record "Workshop Jobs";
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        JobCardNo := Rec;
        Unigroupsetup.Get;
        Unigroupsetup.TestField(Unigroupsetup."Job Card No.");
        if NoSeriesMgmt.LookupRelatedNoSeries(Unigroupsetup."Job Card No.", JobCardNoRec."No. Series", "No. Series") then begin
            NoSeriesMgmt.GetNextNo(JobCardNo."Job Card No.", WorkDate(), true);
            Rec := JobCardNo;
            exit(true);
        end;
    end;

    procedure CreateStockRequest()
    var
        StockRequestHeader: Record "Stock request header";
        StockRequestline: Record "Stock request line";
        UnigroupSetup: Record "Unigroup Setup";
        NoSeriesMgt: Codeunit "No. Series";
        RequestPartServiceline: Record "Requested Parts/Service Line";
        LineNo: Integer;
        ItemRec: Record Item;
        Vehicle: Record "Fixed Asset";
    begin
        Rec.TestField("Global Dimension 1 Code");
        Rec.TestField("Shortcut Dimension 6 Code");

        if not Confirm('Do you want to create Stock Request?', true) then
            exit else begin

            begin
                RequestPartServiceline.Reset();
                RequestPartServiceline.SetRange("Job Card No.", Rec."Job Card No.");
                RequestPartServiceline.SetRange(type, RequestPartServiceline.Type::Item);
                RequestPartServiceline.SetRange("Stock Requested", false);
                RequestPartServiceline.SetFilter("Request Quantity", '<>%1', 0);
                if not RequestPartServiceline.FindFirst() then
                    Error('No items to Request..!')
                else begin
                    UnigroupSetup.Get();
                    StockRequestHeader.Init();
                    StockRequestHeader."Stock Request No." := NoSeriesMgt.GetNextNo(UnigroupSetup."Stock Request No.", Today, true);
                    StockRequestHeader.Validate("Stock Request Date", Today);
                    StockRequestHeader.Validate("Job Card No.", Rec."Job Card No.");
                    StockRequestHeader.Validate("Job Type", Rec."Job Type");
                    StockRequestHeader.Validate("Driver ID", Rec."Driver ID");
                    StockRequestHeader.Validate("Vehicle No.", Rec."Vehicle No.");
                    StockRequestHeader.Validate("Requested By", UserId);
                    StockRequestHeader.Validate("Global Dimension 1 Code", Rec."Global Dimension 1 Code");
                    StockRequestHeader.Validate("Global Dimension 2 Code", Rec."Global Dimension 2 Code");
                    StockRequestHeader.Validate("Shortcut Dimension 3 Code", Rec."Shortcut Dimension 3 Code");
                    StockRequestHeader.Validate("Shortcut Dimension 4 Code", Rec."Shortcut Dimension 4 Code");
                    StockRequestHeader.Validate("Shortcut Dimension 5 Code", Rec."Shortcut Dimension 5 Code");
                    StockRequestHeader.Validate("Shortcut Dimension 6 Code", Rec."Shortcut Dimension 6 Code");
                    StockRequestHeader.Validate("Shortcut Dimension 7 Code", Rec."Shortcut Dimension 7 Code");
                    StockRequestHeader.Validate("Shortcut Dimension 8 Code", Rec."Shortcut Dimension 8 Code");
                    StockRequestHeader.Insert();
                    RequestPartServiceline.Reset();
                    RequestPartServiceline.SetRange("Job Card No.", Rec."Job Card No.");
                    RequestPartServiceline.SetRange(type, RequestPartServiceline.Type::Item);
                    RequestPartServiceline.SetRange("Stock Requested", false);
                    RequestPartServiceline.SetFilter("Request Quantity", '<>%1', 0);
                    if RequestPartServiceline.FindFirst() then
                        repeat
                            LineNo += 10000;
                            StockRequestline.Init();
                            StockRequestline."Document No." := StockRequestHeader."Stock Request No.";
                            StockRequestline."Stock Requested Date" := StockRequestHeader."Stock Request Date";
                            StockRequestline."Job Card No." := StockRequestHeader."Job Card No.";
                            StockRequestline."Line No." := LineNo;
                            StockRequestline.Validate("No.", RequestPartServiceline."No.");
                            ItemRec.Reset;
                            ItemRec.SetRange("No.", RequestPartServiceline."No.");
                            ItemRec.SetRange("Can Scrap?", true);
                            if ItemRec.FindFirst() then begin
                                StockRequestline.Validate("Scrap Applicable?", true);
                                StockRequestline.Validate("Scrap Item No.", ItemRec."Scrap Item No.");
                            end;
                            StockRequestline.Validate(Description, RequestPartServiceline.Description);
                            StockRequestline.Validate(Quantity, RequestPartServiceline."Request Quantity");
                            StockRequestline."Job Line No." := RequestPartServiceline."Line No.";
                            StockRequestline.Validate("Global Dimension 1 Code", Rec."Global Dimension 1 Code");
                            StockRequestline.Validate("Global Dimension 2 Code", Rec."Global Dimension 2 Code");
                            StockRequestline.Validate("Shortcut Dimension 3 Code", Rec."Shortcut Dimension 3 Code");
                            StockRequestline.Validate("Shortcut Dimension 4 Code", Rec."Shortcut Dimension 4 Code");
                            StockRequestline.Validate("Shortcut Dimension 5 Code", Rec."Shortcut Dimension 5 Code");
                            StockRequestline.Validate("Shortcut Dimension 6 Code", Rec."Shortcut Dimension 6 Code");
                            StockRequestline.Validate("Shortcut Dimension 7 Code", Rec."Shortcut Dimension 7 Code");
                            StockRequestline.Validate("Shortcut Dimension 8 Code", Rec."Shortcut Dimension 8 Code");
                            StockRequestline.Insert();
                            RequestPartServiceline."Stock Request No." := StockRequestline."Document No.";
                            RequestPartServiceline."Requested Date" := StockRequestHeader."Stock Request Date";
                            RequestPartServiceline."Stock Requested" := true;
                            RequestPartServiceline.Modify();
                        until RequestPartServiceline.Next() = 0;
                    Message('Stock Request successfully created with Reference No. %1', StockRequestHeader."Stock Request No.");
                end;
                Rec."Job Status" := Rec."Job Status"::"Pending Stock Issue";
                Rec.Modify();
                if Vehicle.get(Rec."Vehicle No.") then begin
                    Vehicle."Vehicle Status" := Vehicle."Vehicle Status"::Available;
                    Vehicle.Modify();
                end;
            end;
        end;
    end;

    procedure CreateStockReturn()
    var
        StockReturnHeader: Record "Stock Return Header";
        StockReturnline: Record "Stock Return Line";
        UnigroupSetup: Record "Unigroup Setup";
        NoSeriesMgt: Codeunit "No. Series";
        RequestPartServiceline: Record "Requested Parts/Service Line";
        StockRequestline: Record "Stock request line";
        LineNo: Integer;
    begin
        if not Confirm('Do you want to create Stock Return?', true) then
            exit else begin
            begin
                RequestPartServiceline.Reset();
                RequestPartServiceline.SetRange("Job Card No.", Rec."Job Card No.");
                RequestPartServiceline.SetRange(type, RequestPartServiceline.Type::Item);
                RequestPartServiceline.SetRange("Stock Return", false);
                RequestPartServiceline.SetFilter("Return Quantity", '<>%1', 0);
                if not RequestPartServiceline.FindFirst() then
                    Error('No items to Request..!')
                else begin
                    UnigroupSetup.Get();
                    StockReturnHeader.Init();
                    StockReturnHeader."Stock Return No." := NoSeriesMgt.GetNextNo(UnigroupSetup."Stock Return No.", Today, true);
                    StockReturnHeader.Validate("Stock Return Date", Today);
                    StockReturnHeader.Validate("Job Card No.", Rec."Job Card No.");
                    StockReturnHeader.Validate("Job Type", Rec."Job Type");
                    StockReturnHeader.Validate("Driver ID", Rec."Driver ID");
                    StockReturnHeader.Validate("Vehicle No.", Rec."Vehicle No.");
                    StockReturnHeader.Validate("Return By", UserId);
                    StockReturnHeader.Validate("Global Dimension 1 Code", Rec."Global Dimension 1 Code");
                    StockReturnHeader.Validate("Global Dimension 2 Code", Rec."Global Dimension 2 Code");
                    StockReturnHeader.Validate("Shortcut Dimension 3 Code", Rec."Shortcut Dimension 3 Code");
                    StockReturnHeader.Validate("Shortcut Dimension 4 Code", Rec."Shortcut Dimension 4 Code");
                    StockReturnHeader.Validate("Shortcut Dimension 5 Code", Rec."Shortcut Dimension 5 Code");
                    StockReturnHeader.Validate("Shortcut Dimension 6 Code", Rec."Shortcut Dimension 6 Code");
                    StockReturnHeader.Validate("Shortcut Dimension 7 Code", Rec."Shortcut Dimension 7 Code");
                    StockReturnHeader.Validate("Shortcut Dimension 8 Code", Rec."Shortcut Dimension 8 Code");
                    StockReturnHeader.Insert();
                    RequestPartServiceline.Reset();
                    RequestPartServiceline.SetRange("Job Card No.", Rec."Job Card No.");
                    RequestPartServiceline.SetRange(type, RequestPartServiceline.Type::Item);
                    RequestPartServiceline.SetRange("Stock Return", false);
                    RequestPartServiceline.SetFilter("Return Quantity", '<>%1', 0);
                    if RequestPartServiceline.FindFirst() then
                        repeat
                            LineNo += 10000;
                            StockReturnline.Init();
                            StockReturnline."Document No." := StockReturnHeader."Stock Return No.";
                            StockReturnline."Stock Return Date" := StockReturnHeader."Stock Return Date";
                            StockReturnline."Job Card No." := StockReturnHeader."Job Card No.";
                            StockReturnline."Line No." := LineNo;
                            StockReturnline.Validate("No.", RequestPartServiceline."No.");
                            StockReturnline.Validate(Description, RequestPartServiceline.Description);
                            StockReturnline.Validate(Quantity, RequestPartServiceline."Return Quantity");
                            StockReturnline."Job Line No." := RequestPartServiceline."Line No.";
                            // StockReturnline.Validate("Location Code", Rec."Shortcut Dimension 6 Code");
                            StockReturnline.Validate("Global Dimension 1 Code", Rec."Global Dimension 1 Code");
                            StockReturnline.Validate("Global Dimension 2 Code", Rec."Global Dimension 2 Code");
                            StockReturnline.Validate("Shortcut Dimension 3 Code", Rec."Shortcut Dimension 3 Code");
                            StockReturnline.Validate("Shortcut Dimension 4 Code", Rec."Shortcut Dimension 4 Code");
                            StockReturnline.Validate("Shortcut Dimension 5 Code", Rec."Shortcut Dimension 5 Code");
                            StockReturnline.Validate("Shortcut Dimension 6 Code", Rec."Shortcut Dimension 6 Code");
                            StockReturnline.Validate("Shortcut Dimension 7 Code", Rec."Shortcut Dimension 7 Code");
                            StockReturnline.Validate("Shortcut Dimension 8 Code", Rec."Shortcut Dimension 8 Code");
                            StockReturnline.Insert();
                            RequestPartServiceline."Requested Date" := StockReturnHeader."Stock Return Date";
                            RequestPartServiceline."Stock Return" := true;
                            RequestPartServiceline.Modify();
                        until RequestPartServiceline.Next() = 0;
                    Message('Stock Return successfully created with Reference No. %1', StockReturnHeader."Stock Return No.");
                end;
                Rec."Job Status" := Rec."Job Status"::"Pending Stock Issue";
                Rec.Modify();
            end;
        end;
    end;
}
