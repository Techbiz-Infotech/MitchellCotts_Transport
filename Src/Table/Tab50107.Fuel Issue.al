table 50107 "Fuel Issue"
{
    Caption = 'Fuel Issue';
    DataClassification = ToBeClassified;
    //DrillDownPageId = "Fuel Issue List";
    LookupPageId = "Fuel Issue List";

    fields
    {
        field(1; "Fuel Issue No."; Code[20])
        {
            Caption = 'Fuel Issue No.';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Unigroupsetup: Record "Unigroup Setup";
                NoSeriesMgmt: Codeunit "No. Series";
            begin
                if "Fuel Issue No." <> xRec."Fuel Issue No." then begin
                    Unigroupsetup.Get;
                    NoSeriesMgmt.TestManual(Unigroupsetup."Fuel Issue No.");
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
            trigger OnValidate()
            var
                RecPump: Record Pump;
            begin
                if Recpump.get(Pump) then begin
                    "Fueling Station Name" := RecPump.Description;
                    "External Fuel Location" := RecPump."Fuel Location";
                end else begin
                    "Fueling Station Name" := '';
                    "External Fuel Location" := '';
                end;
            end;
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
            trigger OnValidate()
            begin
                FuelCalculation();
            end;
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
            trigger OnValidate()
            begin
                FuelCalculation();
            end;

        }
        field(14; "Issue Date"; Date)
        {
            Caption = 'Issue Date';
            DataClassification = ToBeClassified;
        }
        field(15; "Balance Fuel in Truck"; Integer)
        {
            Caption = 'Balance Fuel in Vehicle';
            DataClassification = ToBeClassified;
            Editable = false;
            trigger OnValidate()
            begin
                FuelCalculation();
            end;

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
            trigger OnValidate()
            begin
                FuelCalculation();
            end;
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
            trigger OnValidate();
            begin
                if "Fuel Issue For" = "Fuel Issue For"::"Non-Trip" then begin
                    if Rec."Trip ID" <> '' then
                        Error('Trip ID value should not be there');
                end;
            end;
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
            trigger OnLookup()
            var
                LTrip: Record Trip;
            begin
                if Rec."For Closed Trip?" then
                    LTrip.Setfilter(LTrip."Trip Status", '=%1|%2|%3', LTrip."Trip Status"::Completed, LTrip."Trip Status"::Terminated, LTrip."Trip Status"::Invoiced);
                if not Rec."For Closed Trip?" then
                    LTrip.SetFilter(LTrip."Trip Status", '=%1|%2', LTrip."Trip Status"::Approved, LTrip."Trip Status"::Live);
                if PAGE.RunModal(PAGE::"Trip list", LTrip) = ACTION::LookupOK then
                    Rec.Validate("Trip ID", LTrip."Trip ID");
            end;

            trigger OnValidate()
            var
                DriverIDRec: Record Employee;
                LTrip, TripIdrec : Record Trip;
            begin
                LTrip.Reset();
                if "For Closed Trip?" then
                    LTrip.Setfilter("Trip Status", '=%1|%2', LTrip."Trip Status"::Completed, LTrip."Trip Status"::Invoiced)
                else
                    LTrip.Setfilter("Trip Status", '=%1|%2', LTrip."Trip Status"::Approved, LTrip."Trip Status"::Live);
                LTrip.SetRange("Trip ID", Rec."Trip ID");
                if not LTrip.FindFirst() then
                    Error('You have selected a wrong trip. Please try again');

                IF TripIdrec.Get("Trip ID") THEN begin
                    Rec.validate("Vehicle No.", TripIdrec."Vehicle No.");
                    Rec.validate("Driver ID", TripIdrec."Driver ID");
                    Rec.validate("Driver Name", TripIdrec."Driver Name");
                    Rec.validate("Trailer No.", TripIdrec."Allocated Trailer No.");
                    Rec.Validate("Required Fuel In Litres", TripIdrec."Total Fuel Expected");
                    Rec.Validate("Net Requirement in litres", ("Required Fuel In Litres" - "Balance Fuel in Truck"));
                    Rec.Validate("Global Dimension 1 Code", TripIdrec."Global Dimension 1 Code");
                    Rec.Validate("Global Dimension 2 Code", TripIdrec."Global Dimension 2 Code");
                    Rec.Validate("Shortcut Dimension 3 Code", TripIdrec."Shortcut Dimension 3 Code");
                    Rec.Validate("Shortcut Dimension 4 Code", TripIdrec."Shortcut Dimension 4 Code");
                    Rec.Validate("Shortcut Dimension 5 Code", TripIdrec."Shortcut Dimension 5 Code");
                    Rec.Validate("Shortcut Dimension 6 Code", TripIdrec."Shortcut Dimension 6 Code");
                    Rec.Validate("Shortcut Dimension 7 Code", TripIdrec."Shortcut Dimension 7 Code");
                    Rec.Validate("Shortcut Dimension 8 Code", TripIdrec."Shortcut Dimension 8 Code");
                end ELSE begin
                    "Vehicle No." := '';
                    "Driver ID" := '';
                    "Driver Name" := '';
                    "Trailer No." := '';
                    Rec."Shortcut Dimension 3 Code" := '';
                    Rec."Shortcut Dimension 4 Code" := '';
                    Rec."Shortcut Dimension 5 Code" := '';
                    Rec."Shortcut Dimension 6 Code" := '';
                    Rec."Shortcut Dimension 7 Code" := '';
                    Rec."Shortcut Dimension 8 Code" := '';
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
        field(33; "Fuel Return No."; Code[20])
        {
            Caption = 'Fuel Return No.';
            DataClassification = ToBeClassified;
        }
        field(34; "Fuel Reversed"; Boolean)
        {
            Caption = 'Fuel Reversed';
            DataClassification = ToBeClassified;
        }
        field(35; "For Closed Trip?"; Boolean)
        {
            Caption = 'For Closed Trip?';
            DataClassification = ToBeClassified;
        }
        field(36; Remarks; Text[1000])
        {
            Caption = 'Remarks';
            DataClassification = ToBeClassified;
        }
        field(37; "Fuel Source"; Enum "Fuel Source")
        {
            Caption = 'Fuel Source';
            DataClassification = ToBeClassified;
        }
        field(38; "Unit Cost"; Decimal)
        {
            Caption = 'Unit Cost';
            DataClassification = ToBeClassified;
        }
        field(40; "External Fuel Location"; Code[20])
        {
            Caption = 'External Fuel Location';
            DataClassification = ToBeClassified;
            TableRelation = Location where("Use As In-Transit" = const(false));
            Editable = false;
        }
        field(41; "Purchase Order No."; Code[20])
        {
            Caption = 'Purchase Order No.';
            DataClassification = ToBeClassified;
        }
        field(42; "PO No."; Code[20])
        {
            Caption = 'Purchase Order No.';
            FieldClass = FlowField;
            CalcFormula = lookup("Purchase Header"."No." where("Fuel Issue No." = field("Fuel Issue No.")));
            Editable = false;
        }
        field(43; "Purchase Receipt No."; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Purch. Rcpt. Header"."No." where("Fuel Issue No." = field("Fuel Issue No.")));
            Editable = false;
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
        key(PK; "Fuel Issue No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        if "Fuel Issue No." = '' then begin
            Unigroupsetup.Get;
            Unigroupsetup.TestField("Fuel Issue No.");
            "No. Series" := Unigroupsetup."Fuel Issue No.";
            if NoSeriesMgmt.AreRelated(Unigroupsetup."Fuel Issue No.", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "Fuel Issue No." := NoSeriesMgmt.GetNextNo("No. Series");
        end;
        "Issue Date" := WorkDate();
    end;

    procedure AssistEdit(IssueNumberRec: Record "Fuel Issue"): Boolean
    var
        IssueNumber: Record "Fuel Issue";
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        IssueNumber := Rec;
        Unigroupsetup.Get;
        Unigroupsetup.TestField(Unigroupsetup."Fuel Issue No.");
        if NoSeriesMgmt.LookupRelatedNoSeries(Unigroupsetup."Fuel Issue No.", IssueNumberRec."No. Series", "No. Series") then begin
            NoSeriesMgmt.GetNextNo(IssueNumber."Fuel Issue No.", WorkDate(), true);
            Rec := IssueNumber;
            exit(true);
        end;
    end;

    procedure CreatePO()
    var
        PurchHead2, PurchHead : Record "Purchase Header";
        PurchLine: Record "Purchase Line";
        PPSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit "No. Series";
        UnigroupSetup: Record "Unigroup Setup";
        PurchPost: Codeunit "Purch.-Post";
        RecPump: record Pump;
        VendNo: Code[20];
        FuelLoc: code[20];
        DimSetID: Integer;
    begin
        CalcFields(Rec."PO No.", Rec."Purchase Receipt No.");
        if (Rec."PO No." <> '') or (Rec."Purchase Receipt No." <> '') then
            Error('Purchase already posted. Please check and try again');

        PurchHead2.Reset();
        PurchHead2.SetRange("Fuel Issue No.", Rec."Fuel Issue No.");
        if not PurchHead2.FindFirst() then begin
            if Rec."Fuel Source" = Rec."Fuel Source"::External then begin
                If RecPump.Get(Rec.Pump) then begin
                    VendNo := RecPump."Fuel Vendor No.";
                    FuelLoc := RecPump."Fuel Location";
                end;
                if VendNo = '' then
                    Error('There no vendor assigned for this Pump %1', Rec.Pump);
                PPSetup.Get;
                UnigroupSetup.Get;
                PurchHead.Init;
                PurchHead.Validate("Document Type", PurchHead."Document Type"::Order);
                PurchHead.Validate("No.", NoSeriesMgt.GetNextNo(PPSetup."Order Nos.", Today, true));
                PurchHead.Validate("Posting Date", today);
                PurchHead.Validate("Buy-from Vendor No.", VendNo);
                PurchHead."Fuel Issue No." := Rec."Fuel Issue No.";
                PurchHead.Insert;
                PurchLine.Init;
                PurchLine.Validate("Document Type", PurchLine."Document Type"::Order);
                PurchLine.Validate("Document No.", PurchHead."No.");
                PurchLine.Validate("Line No.", 10000);
                PurchLine.Validate(Type, PurchLine.Type::Item);
                PurchLine.Validate("No.", UnigroupSetup."Default Item for Diesel");
                PurchLine.Validate("Location Code", UnigroupSetup."Default Ext. Fuel Location");
                PurchLine.Validate(Quantity, Rec."Net Requirement In Litres");
                PurchLine.validate("Direct Unit Cost", Rec."Unit Cost");
                if Rec."Fuel Issue For" = Rec."Fuel Issue For"::"Non-Trip" then
                    PurchLine.validate("Gen. Prod. Posting Group", UnigroupSetup."Prod Group for Non Trip Fuel")
                else begin
                    if Rec."For Closed Trip?" then
                        PurchLine.validate("Gen. Prod. Posting Group", UnigroupSetup."Prod Group Closed Trip Fuel")
                    else
                        PurchLine.validate("Gen. Prod. Posting Group", UnigroupSetup."Prod Group for Trip Fuel");
                end;
                DimSetID := GetDimSetID(Rec."Global Dimension 1 Code", Rec."Global Dimension 2 Code",
                Rec."Shortcut Dimension 3 Code", Rec."Shortcut Dimension 4 Code", Rec."Shortcut Dimension 5 Code",
                Rec."Shortcut Dimension 6 Code", Rec."Shortcut Dimension 7 Code", Rec."Shortcut Dimension 8 Code");
                PurchLine.validate("Dimension Set ID", DimSetID);
                PurchLine.Insert;
                PurchHead.validate("Dimension Set ID", DimSetID);
                PurchHead.Receive := True;
                PurchHead.Invoice := False;
                PurchHead.Status := PurchHead.Status::Released;
                PurchHead.Modify();
                Commit;
                PurchPost.Run(PurchHead);

            end;
        end else
            error('PO already created - %1', PurchHead2."No.");
    end;

    procedure TransferOrderForFuelissue(FuelIssue: Record "Fuel Issue")
    var
        TransferorderHeader: Record "Transfer Header";
        Transferorderline: Record "Transfer Line";
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgt: Codeunit "No. Series";
        LineNo: Integer;
        Trip: Record Trip;
        TransferOrderPostTransfer: Codeunit "TransferOrder-Post Transfer";
        TransferPostShipment: Codeunit "TransferOrder-Post Shipment";
        TransferPostReceipt: Codeunit "TransferOrder-Post Receipt";
        DimSetID2, DimSetID : Integer;
    begin

        if Rec."Fuel Source" = Rec."Fuel Source"::External then begin
            CalcFields("Purchase Receipt No.", "PO No.");
            TestField(Rec."External Fuel Location");
            If Rec."Purchase Receipt No." = '' then
                error('Purchase must be posted before posting Fuel issue');
        end;
        FuelIssue.TestField("Trip ID");
        TransferorderHeader.Init();
        Unigroupsetup.get;
        TransferorderHeader.VALIDATE(TransferorderHeader."No.", FuelIssue."Fuel Issue No.");
        if FuelIssue."Fuel Source" = FuelIssue."Fuel Source"::Internal then
            TransferorderHeader.Validate("Transfer-from Code", FuelIssue."Shortcut Dimension 6 Code")
        else
            TransferorderHeader.Validate("Transfer-from Code", FuelIssue."External Fuel Location");
        TransferorderHeader.Validate("Transfer-to Code", Unigroupsetup."Vehicle Temp Fuel Location");
        TransferorderHeader."Posting Date" := FuelIssue."Issue Date";
        TransferorderHeader."Direct Transfer" := true;
        TransferorderHeader.Validate("Shipment Date", FuelIssue."Issue Date");
        TransferorderHeader.Validate("Receipt Date", FuelIssue."Issue Date");
        DimSetID := GetDimSetID(Rec."Global Dimension 1 Code", Rec."Global Dimension 2 Code",
        Rec."Shortcut Dimension 3 Code", Rec."Shortcut Dimension 4 Code", Rec."Shortcut Dimension 5 Code",
        Rec."Shortcut Dimension 6 Code", Rec."Shortcut Dimension 7 Code", Rec."Shortcut Dimension 8 Code");
        TransferorderHeader.Validate("Dimension Set ID", DimSetID);
        TransferorderHeader.Status := TransferorderHeader.Status::Released;
        TransferorderHeader.Insert();
        LineNo += 10000;
        Transferorderline.Init();
        Transferorderline."Document No." := TransferorderHeader."No.";
        Transferorderline."Line No." := 10000;
        Transferorderline.Validate("Item No.", Unigroupsetup."Default Item for Diesel");
        Transferorderline.Validate(Description, Rec."Fuel Issue No.");
        if Rec."Fuel Issue For" = Rec."Fuel Issue For"::Trip then
            if rec."For Closed Trip?" then
                Transferorderline.Validate("Gen. Prod. Posting Group", Unigroupsetup."Prod Group Closed Trip Fuel")
            else
                Transferorderline.Validate("Gen. Prod. Posting Group", Unigroupsetup."Prod Group for Trip Fuel");
        if Rec."Fuel Issue For" = Rec."Fuel Issue For"::"Non-Trip" then
            Transferorderline.Validate("Gen. Prod. Posting Group", Unigroupsetup."Prod Group for Non Trip Fuel");
        Transferorderline.Validate(Quantity, FuelIssue."Net Requirement In Litres");
        DimSetID2 := GetDimSetID(Rec."Global Dimension 1 Code", Rec."Global Dimension 2 Code",
        Rec."Shortcut Dimension 3 Code", Rec."Shortcut Dimension 4 Code", Rec."Shortcut Dimension 5 Code",
        Rec."Shortcut Dimension 6 Code", Rec."Shortcut Dimension 7 Code", Rec."Shortcut Dimension 8 Code");
        TransferorderLine.Validate("Dimension Set ID", DimSetID2);
        Transferorderline.Insert();
        if Trip.Get(Rec."Trip ID") then begin
            if trip."Trip Status" = trip."Trip Status"::Approved then begin
                Trip.Modify();
            end;
            Trip.Validate("Trip Stage", Trip."Trip Stage"::"Fuel & Allowances");
        end;
        TransferOrderPostTransfer.Run(TransferorderHeader);

        Rec.UpdateFuelLog(1, "Net Requirement In Litres", Rec."Issue Date", Rec."Fuel Issue No.");
    end;

    procedure PostDirectFuelExpenseJournal()
    var
        TempItemJnlLine: Record "Item Journal Line" temporary;
        TmpDimSetEntry: Record "Dimension Set Entry" temporary;
        DimValue: Record "Dimension Value";
        DimMgmt: Codeunit DimensionManagement;
        GLSetup: Record "General Ledger Setup";
        NoSeriesMgt: Codeunit "No. Series";
        JournalBatch: Record "Item Journal Batch";
        ItemJnlPostline: Codeunit "Item Jnl.-Post Line";
        Unigroupsetup: Record "Unigroup Setup";
        EventHandler: Codeunit "Event Handler";
        DimSetID: Integer;

    begin
        if Rec."Fuel Source" = Rec."Fuel Source"::External then begin
            CalcFields("Purchase Receipt No.", "PO No.");
            If Rec."Purchase Receipt No." = '' then
                error('Purchase must be posted before posting Fuel issue');
        end;

        Rec.TestField("Shortcut Dimension 6 Code");
        TempItemJnlLine.Init();
        Unigroupsetup.Get();
        TempItemJnlLine."Journal Template Name" := Unigroupsetup."Fuel Consumption Template Name";
        TempItemJnlLine."Journal Batch Name" := Unigroupsetup."Fuel Consumption Batch Name";
        TempItemJnlLine."Line No." := 10000;
        TempItemJnlLine."Entry Type" := TempItemJnlLine."Entry Type"::"Negative Adjmt.";
        TempItemJnlLine."Posting Date" := Rec."Issue Date";
        TempItemJnlLine."Document No." := Rec."Fuel Issue No.";
        TempItemJnlLine."Trip ID" := Rec."Trip ID";
        if Rec."Fuel Type" = Rec."Fuel Type"::Diesel then
            TempItemJnlLine.Validate("Item No.", EventHandler.GetFuelItem(1));
        if Rec."For Closed Trip?" then
            TempItemJnlLine.Validate("Gen. Prod. Posting Group", Unigroupsetup."Prod Group Closed Trip Fuel")
        else
            TempItemJnlLine.Validate("Gen. Prod. Posting Group", Unigroupsetup."Prod Group for Non Trip Fuel");
        TempItemJnlLine.Validate(Quantity, Rec."Net Requirement In Litres");
        if Rec."Fuel Source" = Rec."Fuel Source"::Internal then
            TempItemJnlLine.Validate("Location Code", Rec."Shortcut Dimension 6 Code")
        else
            TempItemJnlLine.Validate("Location Code", Rec."External Fuel Location");
        DimSetID := GetDimSetID(Rec."Global Dimension 1 Code", Rec."Global Dimension 2 Code",
        Rec."Shortcut Dimension 3 Code", Rec."Shortcut Dimension 4 Code", Rec."Shortcut Dimension 5 Code",
        Rec."Shortcut Dimension 6 Code", Rec."Shortcut Dimension 7 Code", Rec."Shortcut Dimension 8 Code");
        TempItemJnlLine.Validate("Dimension Set ID", DimSetID);
        TempItemJnlLine.Insert(true);
        ItemJnlPostline.RunWithCheck(TempItemJnlLine);
        // if Rec."For Closed Trip?" then
        //     Rec.UpdateFuelLog(1, "Net Requirement In Litres", Rec."Issue Date");
    end;

    procedure FuelCalculation()
    begin
        if "Required Fuel In Litres" <> 0 then
            "Net Requirement in litres" := "Required Fuel In Litres" - "Balance Fuel in Truck" + "Shortage in liters(If Any)"
        else
            "Net Requirement in litres" := 0;

    end;

    procedure TransferOrderForFuelReturn(FuelReturn: Record "Fuel Return")
    var
        TransferorderHeader: Record "Transfer Header";
        Transferorderline: Record "Transfer Line";
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgt: Codeunit "No. Series";
        LineNo: Integer;
        Trip: Record Trip;
        DimSetID, DimSetID2 : Integer;
        TransferOrderPostTransfer: Codeunit "TransferOrder-Post Transfer";
    begin
        TransferorderHeader.Init();
        Unigroupsetup.get;
        TransferorderHeader.VALIDATE(TransferorderHeader."No.", Rec."Fuel Issue No." + '-R');
        TransferorderHeader.Validate("Transfer-from Code", Unigroupsetup."Vehicle Temp Fuel Location");
        if Rec."Fuel Source" = Rec."Fuel Source"::Internal then
            TransferorderHeader.Validate("Transfer-to Code", Rec."Shortcut Dimension 6 Code")
        else
            TransferorderHeader.Validate("Transfer-to Code", Rec."External Fuel Location");
        TransferorderHeader."Posting Date" := WorkDate();
        TransferorderHeader."Direct Transfer" := true;
        TransferorderHeader.Validate("Shipment Date", WorkDate());
        TransferorderHeader.Validate("Receipt Date", WorkDate());
        DimSetID := GetDimSetID(Rec."Global Dimension 1 Code", Rec."Global Dimension 2 Code",
               Rec."Shortcut Dimension 3 Code", Rec."Shortcut Dimension 4 Code", Rec."Shortcut Dimension 5 Code",
               Rec."Shortcut Dimension 6 Code", Rec."Shortcut Dimension 7 Code", Rec."Shortcut Dimension 8 Code");
        TransferorderHeader.Validate("Dimension Set ID", DimSetID);
        TransferorderHeader.Status := TransferorderHeader.Status::Released;
        TransferorderHeader.Insert();
        LineNo += 10000;
        Transferorderline.Init();
        Transferorderline."Document No." := TransferorderHeader."No.";
        Transferorderline."Line No." := 10000;
        Transferorderline.Validate("Item No.", Unigroupsetup."Default Item for Diesel");
        Transferorderline.Validate(Quantity, Rec."Net Requirement In Litres");
        Transferorderline.validate(Description, Rec."Fuel Issue No." + '-R');
        DimSetID2 := GetDimSetID(Rec."Global Dimension 1 Code", Rec."Global Dimension 2 Code",
               Rec."Shortcut Dimension 3 Code", Rec."Shortcut Dimension 4 Code", Rec."Shortcut Dimension 5 Code",
               Rec."Shortcut Dimension 6 Code", Rec."Shortcut Dimension 7 Code", Rec."Shortcut Dimension 8 Code");
        TransferorderHeader.Validate("Dimension Set ID", DimSetID2);
        Transferorderline.Insert();
        TransferOrderPostTransfer.Run(TransferorderHeader);
        Rec.UpdateFuelLog(2, "Net Requirement In Litres", WorkDate(), TransferorderHeader."No.");
    end;

    procedure PostDirectFuelReturnJournal()
    var
        TempItemJnlLine: Record "Item Journal Line" temporary;
        TmpDimSetEntry: Record "Dimension Set Entry" temporary;
        DimValue: Record "Dimension Value";
        DimMgmt: Codeunit DimensionManagement;
        GLSetup: Record "General Ledger Setup";
        NoSeriesMgt: Codeunit "No. Series";
        JournalBatch: Record "Item Journal Batch";
        ItemJnlPostline: Codeunit "Item Jnl.-Post Line";
        Unigroupsetup: Record "Unigroup Setup";
        EventHandler: Codeunit "Event Handler";
        FuelReturn: Record "Fuel Return";
        DimSetID: Integer;
    begin
        Rec.TestField("Shortcut Dimension 6 Code");
        TempItemJnlLine.Init();
        Unigroupsetup.Get();
        TempItemJnlLine."Journal Template Name" := Unigroupsetup."Fuel Consumption Template Name";
        TempItemJnlLine."Journal Batch Name" := Unigroupsetup."Fuel Consumption Batch Name";
        TempItemJnlLine."Line No." := 10000;
        TempItemJnlLine."Entry Type" := TempItemJnlLine."Entry Type"::"Positive Adjmt.";
        TempItemJnlLine."Posting Date" := WorkDate();
        TempItemJnlLine."Document No." := Rec."Fuel Issue No." + '-R';
        TempItemJnlLine."Trip ID" := Rec."Trip ID";
        if Rec."Fuel Type" = Rec."Fuel Type"::Diesel then
            TempItemJnlLine.Validate("Item No.", EventHandler.GetFuelItem(1));
        TempItemJnlLine.Validate("Gen. Prod. Posting Group", Unigroupsetup."Prod Group for Non Trip Fuel");
        TempItemJnlLine.Validate(Quantity, Rec."Net Requirement In Litres");
        if Rec."Fuel Source" = Rec."Fuel Source"::Internal then
            TempItemJnlLine.Validate("Location Code", Rec."Shortcut Dimension 6 Code")
        else
            TempItemJnlLine.Validate("Location Code", Rec."External Fuel Location");
        DimSetID := GetDimSetID(Rec."Global Dimension 1 Code", Rec."Global Dimension 2 Code",
        Rec."Shortcut Dimension 3 Code", Rec."Shortcut Dimension 4 Code", Rec."Shortcut Dimension 5 Code",
        Rec."Shortcut Dimension 6 Code", Rec."Shortcut Dimension 7 Code", Rec."Shortcut Dimension 8 Code");
        TempItemJnlLine.Validate("Dimension Set ID", DimSetID);
        TempItemJnlLine.Insert(true);
        ItemJnlPostline.RunWithCheck(TempItemJnlLine);
    end;

    procedure UpdateFuelLog(lEntryType: Integer; Qty: Decimal; PostingDate: Date; DocNo: code[20])
    var
        EntryNo: Integer;
        VehicleFuel: Record "Vehicle Fuel Log";
    begin
        VehicleFuel.Init();
        VehicleFuel."Entry No." := EntryNo;
        VehicleFuel.Date := PostingDate;
        if lEntryType = 1 then
            VehicleFuel."Entry Type" := VehicleFuel."Entry Type"::"Fuel Issue";
        if lEntryType = 2 then
            VehicleFuel."Entry Type" := VehicleFuel."Entry Type"::"Fuel Return";
        VehicleFuel."Document No." := DocNo;
        VehicleFuel."Vehicle No." := Rec."Vehicle No.";
        VehicleFuel."Driver ID." := Rec."Driver ID";
        if Rec."Fuel Source" = Rec."Fuel Source"::Internal then
            VehicleFuel."Fuel Location" := Rec."Shortcut Dimension 6 Code"
        else
            VehicleFuel."Fuel Location" := Rec."External Fuel Location";
        VehicleFuel."Trip Id" := Rec."Trip ID";
        if lEntryType = 1 then
            VehicleFuel.Quantity := qty;
        if lEntryType = 2 then
            VehicleFuel.Quantity := -qty;
        VehicleFuel."Global Dimension 1 Code" := Rec."Global Dimension 1 Code";
        VehicleFuel."Global Dimension 2 Code" := Rec."Global Dimension 2 Code";
        VehicleFuel."Shortcut Dimension 3 Code" := Rec."Shortcut Dimension 3 Code";
        VehicleFuel."Shortcut Dimension 4 Code" := Rec."Shortcut Dimension 4 Code";
        VehicleFuel."Shortcut Dimension 5 Code" := Rec."Shortcut Dimension 5 Code";
        VehicleFuel."Shortcut Dimension 6 Code" := Rec."Shortcut Dimension 6 Code";
        VehicleFuel."Shortcut Dimension 7 Code" := Rec."Shortcut Dimension 7 Code";
        VehicleFuel."Shortcut Dimension 8 Code" := Rec."Shortcut Dimension 8 Code";
        VehicleFuel."System Created" := true;
        VehicleFuel.Insert();
    end;

    procedure GetDimSetID(Dim1: Code[20]; Dim2: Code[20]; Dim3: Code[20]; Dim4: Code[20]; Dim5: Code[20]; Dim6: Code[20]; Dim7: Code[20]; Dim8: Code[20]) DimSetID: Integer
    var
        TmpDimSetEntry: Record "Dimension Set Entry" temporary;
        DimValue: Record "Dimension Value";
        DimMgmt: Codeunit DimensionManagement;
        GLSetup: Record "General Ledger Setup";
    begin
        GLSetup.Get();
        TmpDimSetEntry.DeleteAll();
        if DimValue.Get(GLSetup."Global Dimension 1 Code", Dim1) then begin
            TmpDimSetEntry.Init;
            TmpDimSetEntry.Validate("Dimension Code", GLSetup."Global Dimension 1 Code");
            TmpDimSetEntry.Validate("Dimension Value Code", Dim1);
            TmpDimSetEntry.Insert;
        end;
        if DimValue.Get(GLSetup."Global Dimension 2 Code", Dim2) then begin
            TmpDimSetEntry.Init;
            TmpDimSetEntry.Validate("Dimension Code", GLSetup."Global Dimension 2 Code");
            TmpDimSetEntry.Validate("Dimension Value Code", Dim2);
            TmpDimSetEntry.Insert;
        end;
        if DimValue.Get(GLSetup."Shortcut Dimension 3 Code", Dim3) then begin
            TmpDimSetEntry.Init;
            TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 3 Code");
            TmpDimSetEntry.Validate("Dimension Value Code", Dim3);
            TmpDimSetEntry.Insert;
        end;
        if DimValue.Get(GLSetup."Shortcut Dimension 4 Code", Dim4) then begin
            TmpDimSetEntry.Init;
            TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 4 Code");
            TmpDimSetEntry.Validate("Dimension Value Code", Dim4);
            TmpDimSetEntry.Insert;
        end;
        if DimValue.Get(GLSetup."Shortcut Dimension 5 Code", Dim5) then begin
            TmpDimSetEntry.Init;
            TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 5 Code");
            TmpDimSetEntry.Validate("Dimension Value Code", Dim5);
            TmpDimSetEntry.Insert;
        end;
        if DimValue.Get(GLSetup."Shortcut Dimension 6 Code", Dim6) then begin
            TmpDimSetEntry.Init;
            TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 6 Code");
            TmpDimSetEntry.Validate("Dimension Value Code", Dim6);
            TmpDimSetEntry.Insert;
        end;
        if DimValue.Get(GLSetup."Shortcut Dimension 7 Code", Dim7) then begin
            TmpDimSetEntry.Init;
            TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 7 Code");
            TmpDimSetEntry.Validate("Dimension Value Code", Dim7);
            TmpDimSetEntry.Insert;
        end;
        if DimValue.Get(GLSetup."Shortcut Dimension 8 Code", Dim8) then begin
            TmpDimSetEntry.Init;
            TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 8 Code");
            TmpDimSetEntry.Validate("Dimension Value Code", Dim8);
            TmpDimSetEntry.Insert;
        end;
        DimSetID := DimMgmt.GetDimensionSetID(TmpDimSetEntry);
        exit(DimSetID);
    end;
}
