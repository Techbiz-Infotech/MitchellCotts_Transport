table 50106 "Petty Cash Expenses Detail"
{
    Caption = 'Petty Cash Expenses Detail';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Petty Cash Expenses List";
    LookupPageId = "Petty Cash Expenses List";
    fields
    {
        field(1; "Voucher No."; Code[20])
        {
            Caption = 'Voucher No.';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Unigroupsetup: Record "Unigroup Setup";
                NoSeriesMgmt: Codeunit "No. Series";
            begin
                if "Voucher No." <> xRec."Voucher No." then begin
                    Unigroupsetup.Get;
                    NoSeriesMgmt.TestManual(Unigroupsetup."Voucher No.");
                    "No. Series" := '';
                end;
            end;

        }
        field(2; "Petty Cash For"; Enum "Petty Cash For")
        {
            Caption = 'Petty Cash For';
            DataClassification = ToBeClassified;
        }
        field(3; "Creation date"; Date)
        {
            Caption = 'Creation Date';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Transaction Reference No."; Code[20])
        {
            Caption = 'Transaction Reference No.';
            DataClassification = ToBeClassified;

        }
        field(7; "Petty Cash Amount"; Decimal)
        {
            Caption = 'Petty Cash Amount';
            DataClassification = ToBeClassified;
        }
        field(10; "Trip ID"; Code[20])
        {
            Caption = 'Trip ID';
            DataClassification = ToBeClassified;
            trigger OnLookup()
            var
                LTrip: Record Trip;
            begin
                if Rec."For Closed Trip?" then
                    LTrip.SetRange(LTrip."Trip Status", LTrip."Trip Status"::Completed);
                if not Rec."For Closed Trip?" then
                    LTrip.SetFilter(LTrip."Trip Status", '<>%1', LTrip."Trip Status"::"Completed");
                if PAGE.RunModal(PAGE::"Trip list", LTrip) = ACTION::LookupOK then
                    Rec.Validate("Trip ID", LTrip."Trip ID");
            end;

            trigger OnValidate()
            var
                DriverIDRec: Record Employee;
                TripIdrec: Record Trip;
            begin
                IF TripIdrec.Get("Trip ID") THEN begin
                    Rec.Validate("Vehicle No.", TripIdrec."Vehicle No.");
                    Rec.Validate("Driver ID", TripIdrec."Driver ID");
                    Rec.Validate("Driver Name", TripIdrec."Driver Name");
                    Rec."Mobile Phone No." := TripIdrec."Mobile No.";
                    Rec.Validate(From, TripIdrec."From(Source)");
                    Rec.Validate(Destination, TripIdrec."To (Destination)");
                    Rec.Validate("Petty Cash Amount", TripIdrec."Actual Drivers Allowance");
                    Rec.Validate("Global Dimension 1 Code", TripIdrec."Global Dimension 1 Code");
                    Rec.Validate("Global Dimension 2 Code", TripIdrec."Global Dimension 2 Code");
                    Rec.Validate("Shortcut Dimension 3 Code", TripIdrec."Shortcut Dimension 3 Code");
                    Rec.Validate("Shortcut Dimension 4 Code", TripIdrec."Shortcut Dimension 4 Code");
                    Rec.Validate("Shortcut Dimension 5 Code", TripIdrec."Shortcut Dimension 5 Code");
                    Rec.Validate("Shortcut Dimension 6 Code", TripIdrec."Shortcut Dimension 6 Code");
                    Rec.Validate("Shortcut Dimension 7 Code", TripIdrec."Shortcut Dimension 7 Code");
                    Rec.Validate("Shortcut Dimension 8 Code", TripIdrec."Shortcut Dimension 8 Code");
                end ELSE begin
                    Rec."Vehicle No." := '';
                    Rec."Driver ID" := '';
                    Rec."Driver Name" := '';
                    Rec."Mobile Phone No." := '';
                    Rec.From := '';
                    Rec.Destination := '';
                    Rec."Petty Cash Amount" := 0;
                    Rec."Global Dimension 1 Code" := '';
                    Rec."Global Dimension 2 Code" := '';
                    Rec."Shortcut Dimension 3 Code" := '';
                    Rec."Shortcut Dimension 4 Code" := '';
                    Rec."Shortcut Dimension 5 Code" := '';
                    Rec."Shortcut Dimension 6 Code" := '';
                    Rec."Shortcut Dimension 7 Code" := '';
                    Rec."Shortcut Dimension 8 Code" := '';
                end;
            end;
        }
        field(11; "Vehicle No."; Code[20])
        {
            Caption = 'Vehicle No.';
            DataClassification = ToBeClassified;

        }
        field(12; "Driver ID"; Code[20])
        {
            Caption = 'Driver ID';
            DataClassification = ToBeClassified;
            TableRelation = Employee where("Job Title" = const('Driver'));

        }
        field(13; "Driver Name"; Text[50])
        {
            Caption = 'Driver Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "Mobile Phone No."; Text[13])
        {
            Caption = 'Mobile Phone No.';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Len, MobileLen : Integer;
                SpecialCharsErr: Label 'You can not enter special characters';
                SpecialChars: Label ' |!|@|#|$|%|&|*|(|)|_|-|+|=|?';
            begin
                if StrLen("Mobile Phone No.") < 10 then
                    Error('No.of digits should not be less than 10');
                if StrLen("Mobile Phone No.") > 10 then
                    Error('No.of digits should not be greater than 10');
                CLEAR(Len);
                Len := STRLEN(DELCHR(Rec."Mobile Phone No.", '=', DELCHR(Rec."Mobile Phone No.", '=', SpecialChars)));
                IF Len > 0 THEN
                    ERROR(SpecialCharsErr);
            end;
        }
        field(15; "Expense Type"; Code[20])
        {
            Caption = 'Expense Type';
            DataClassification = ToBeClassified;
            TableRelation = "Petty Cash Expense Type";
            trigger OnValidate()
            var
                ExpenseTypeRec: Record "Petty Cash Expense Type";
            begin
                if ExpenseTypeRec.Get("Expense Type") then begin
                    if "For Closed Trip?" then
                        "Account No." := ExpenseTypeRec."Petty Cash Expense Account"
                    else
                        "Account No." := ExpenseTypeRec."Petty Cash Prepayment Account";
                end else
                    "Account No." := '';
            end;
        }
        field(16; "Trip Direction"; Enum "Trip Direction")
        {
            Caption = 'Trip Direction';
            DataClassification = ToBeClassified;
        }
        field(17; From; Code[50])
        {
            Caption = 'From';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Route Location";
        }
        field(18; Destination; Code[50])
        {
            Caption = 'Destination';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Route Location";
        }
        field(19; "Departure Time"; Time)
        {
            Caption = 'Departure Time';
            DataClassification = ToBeClassified;
        }
        field(20; "Remarks/Comments"; Text[1000])
        {
            Caption = 'Remarks/Comments';
            DataClassification = ToBeClassified;
        }
        field(21; "Reason For Rejection"; Text[250])
        {
            Caption = 'Reason For Rejection';
            DataClassification = ToBeClassified;
        }
        field(22; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
        }
        field(23; Posted; Boolean)
        {
            Caption = 'Posted';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(24; "Petty Cash Approval Status"; Enum "UTL Approval Status")
        {
            Caption = 'Petty Cash Approval Status';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(25; "Account Type"; Enum "Gen. Journal Account Type")
        {
            Caption = 'Account Type';

            trigger OnValidate()
            var
                Text000: Label '%1 or %2 must be a G/L Account or Bank Account.', Comment = '%1=Account Type,%2=Balance Account Type';
            begin
                if ("Account Type" in ["Account Type"::Customer, "Account Type"::Vendor, "Account Type"::"Fixed Asset",
                                       "Account Type"::"IC Partner", "Account Type"::Employee]) and
                   ("Bal. Account Type" in ["Bal. Account Type"::Customer, "Bal. Account Type"::Vendor, "Bal. Account Type"::"Fixed Asset",
                                            "Bal. Account Type"::"IC Partner", "Bal. Account Type"::Employee])
                then
                    Error(
                      Text000,
                      FieldCaption("Account Type"), FieldCaption("Bal. Account Type"));
            end;
        }
        field(26; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            TableRelation = IF ("Account Type" = CONST("G/L Account")) "G/L Account" WHERE("Account Type" = CONST(Posting),
                                                                                          Blocked = CONST(false))
            ELSE
            IF ("Account Type" = CONST(Customer)) Customer
            ELSE
            IF ("Account Type" = CONST(Vendor)) Vendor
            ELSE
            IF ("Account Type" = CONST("Bank Account")) "Bank Account"
            ELSE
            IF ("Account Type" = CONST("Fixed Asset")) "Fixed Asset"
            ELSE
            IF ("Account Type" = CONST("IC Partner")) "IC Partner"
            ELSE
            IF ("Account Type" = CONST(Employee)) Employee;
        }
        field(27; "Bal. Account Type"; Enum "Gen. Journal Account Type")
        {
            Caption = 'Bal. Account Type';
            Editable = false;
            trigger OnValidate()
            var
                Text000: Label '%1 or %2 must be a G/L Account or Bank Account.', Comment = '%1=Account Type,%2=Balance Account Type';
            begin
                if ("Account Type" in ["Account Type"::Customer, "Account Type"::Vendor, "Account Type"::"Fixed Asset",
                                       "Account Type"::"IC Partner", "Account Type"::Employee]) and
                   ("Bal. Account Type" in ["Bal. Account Type"::Customer, "Bal. Account Type"::Vendor, "Bal. Account Type"::"Fixed Asset",
                                            "Bal. Account Type"::"IC Partner", "Bal. Account Type"::Employee])
                then
                    Error(
                      Text000,
                      FieldCaption("Account Type"), FieldCaption("Bal. Account Type"));
            end;
        }
        field(28; "Bal. Account No."; Code[20])
        {
            Caption = 'Bal. Account No.';
            Editable = false;
            TableRelation = IF ("Bal. Account Type" = CONST("G/L Account")) "G/L Account" WHERE("Account Type" = CONST(Posting),
                                                                                               Blocked = CONST(false))
            ELSE
            IF ("Bal. Account Type" = CONST(Customer)) Customer
            ELSE
            IF ("Bal. Account Type" = CONST(Vendor)) Vendor
            ELSE
            IF ("Bal. Account Type" = CONST("Bank Account")) "Bank Account"
            ELSE
            IF ("Bal. Account Type" = CONST("Fixed Asset")) "Fixed Asset"
            ELSE
            IF ("Bal. Account Type" = CONST("IC Partner")) "IC Partner"
            ELSE
            IF ("Bal. Account Type" = CONST(Employee)) Employee;
        }
        field(29; "For Closed Trip?"; Boolean)
        {
            Caption = 'For Closed Trip?';
            DataClassification = ToBeClassified;
        }
        field(30; "Account Name"; Text[100])
        {
            Caption = 'Account Name';
            FieldClass = FlowField;
            CalcFormula = lookup("G/L Account".Name where("No." = field("Account No.")));
        }
        field(31; "Expired Date"; date)
        {
            Caption = 'Expired Date';
            DataClassification = ToBeClassified;
        }
        field(32; "Expired Time"; Time)
        {
            Caption = 'Expired Time';
            DataClassification = ToBeClassified;
        }
        field(33; "Petty Cash Status"; Enum "Active/In-Active Enum")
        {
            Caption = 'Petty Cash Status';
            DataClassification = ToBeClassified;
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
        field(112; "Petty Cash Reversed"; Boolean)
        {
            Caption = 'Last Modified Date';
            DataClassification = ToBeClassified;

        }
        field(113; "Petty Cash Return No."; Code[20])
        {
            Caption = 'Fuel Return No.';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK1; "Voucher No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        if "Voucher No." = '' then begin
            Unigroupsetup.Get;
            Unigroupsetup.TestField("Voucher No.");
            "No. Series" := Unigroupsetup."Voucher No.";
            if NoSeriesMgmt.AreRelated(Unigroupsetup."Voucher No.", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "Voucher No." := NoSeriesMgmt.GetNextNo("No. Series");
        end;
        Rec."Creation date" := WorkDate();
        Rec.Validate("Bal. Account Type", "Bal. Account Type"::"Bank Account");
        Rec.Validate("Bal. Account No.", Unigroupsetup."Def. Petty Cash Payment Method");
    end;

    procedure AssistEdit(VoucherNoRec: Record "Petty Cash Expenses Detail"): Boolean
    var
        VoucherNo: Record "Petty Cash Expenses Detail";
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        VoucherNo := Rec;
        Unigroupsetup.Get;
        Unigroupsetup.TestField(Unigroupsetup."Voucher No.");
        if NoSeriesMgmt.LookupRelatedNoSeries(Unigroupsetup."Voucher No.", VoucherNoRec."No. Series", "No. Series") then begin
            NoSeriesMgmt.GetNextNo(VoucherNo."Voucher No.", WorkDate(), true);
            Rec := VoucherNo;
            exit(true);
        end;
    end;
    //post prepaid petty cash
    procedure PostPrepaidPettyCashReturn()
    var
        GLSetup: Record "General Ledger Setup";
        Trip2, Trip : Record Trip;
        InvShuntingTrip: Record "Invoicing Shunting Trips";
        ShuntingTrip: Record "Shunting Details";
        GLEntry: Record "G/L Entry";
        DimValue: Record "Dimension Value";
        UnigroupSetup: record "Unigroup Setup";
        GLAccount: Record "G/L Account";
        SalesHead: Record "Sales Header";
        TempJnlLine: Record "Gen. Journal Line" temporary;
        TmpDimSetEntry: Record "Dimension Set Entry" temporary;
        DimMgmt: Codeunit DimensionManagement;
        TempTripID: Code[20];
        GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";

    begin
        Rec.TestField("Trip ID");

        GLSetup.Get();
        UnigroupSetup.Get();
        GLEntry.Reset();
        GLEntry.SetRange("G/L Account No.", UnigroupSetup."Trip Prepayment From", UnigroupSetup."Trip Prepayment To");
        GLEntry.SetRange("Shortcut Dimension 3 Code", Rec."Trip ID");
        GLEntry.SetRange("Document No.", Rec."Voucher No.");
        GLEntry.SetRange("Expense Prepayment Reversed", False);
        if GLEntry.FindSet() then begin
            repeat
                TempJnlLine.Reset();
                TempJnlLine.Init();
                TempJnlLine.Validate("Journal Template Name", Unigroupsetup."Petty Cash Template Name");
                TempJnlLine.Validate("Journal Batch Name", Unigroupsetup."Petty Cash Batch Name");
                TempJnlLine.Validate("Line No.", 10000 * (TempJnlLine.Count + 1));
                TempJnlLine.Validate("Posting Date", Today);
                TempJnlLine.Validate("Document Type", 0);
                TempJnlLine.Validate("Document No.", Rec."Voucher No." + '-R');
                TempJnlLine.Validate("Account Type", TempJnlLine."Account Type"::"G/L Account");
                GLAccount.Get(GLEntry."G/L Account No.");
                TempJnlLine.Validate("Account No.", GLAccount."Prepayment Reversal Account");
                GLEntry.CalcFields("G/L Account Name", "Shortcut Dimension 3 Code");
                TempJnlLine.Validate(Description, Rec."Petty Cash Return No." + '-Prepaid Return for -' + GLEntry."Shortcut Dimension 3 Code" + ' ' + GLEntry."G/L Account Name");
                TempJnlLine.Validate(Amount, Rec."Petty Cash Amount");
                TempJnlLine.Validate("Bal. Account Type", Rec."Account Type");
                TempJnlLine.Validate("Bal. Account No.", Rec."Account No.");

                TmpDimSetEntry.DeleteAll();
                if DimValue.get(GLSetup."Global Dimension 1 Code", Rec."Global Dimension 1 Code") then begin
                    TmpDimSetEntry.init;
                    TmpDimSetEntry.Validate("Dimension Code", GLSetup."Global Dimension 1 Code");
                    TmpDimSetEntry.Validate("Dimension Value Code", Rec."Global Dimension 1 Code");
                    TmpDimSetEntry.insert;
                end;
                if DimValue.get(GLSetup."Global Dimension 2 Code", Rec."Global Dimension 2 Code") then begin
                    TmpDimSetEntry.Init;
                    TmpDimSetEntry.Validate("Dimension Code", GLSetup."Global Dimension 2 Code");
                    TmpDimSetEntry.Validate("Dimension Value Code", "Global Dimension 2 Code");
                    TmpDimSetEntry.Insert;
                end;
                // if DimValue.Get(GLSetup."Shortcut Dimension 3 Code", GLEntry."Shortcut Dimension 3 Code") then begin
                //     TmpDimSetEntry.Init;
                //     TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 3 Code");
                //     TmpDimSetEntry.Validate("Dimension Value Code", GLEntry."Shortcut Dimension 3 Code");
                //     TmpDimSetEntry.Insert;
                // end;
                // if DimValue.Get(GLSetup."Shortcut Dimension 4 Code", Rec."Shortcut Dimension 4 Code") then begin
                //     TmpDimSetEntry.Init();
                //     TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 4 Code");
                //     TmpDimSetEntry.Validate("Dimension Value Code", Rec."Shortcut Dimension 4 Code");
                //     TmpDimSetEntry.Insert;
                // end;
                // if DimValue.Get(GLSetup."Shortcut Dimension 5 Code", Rec."Shortcut Dimension 5 Code") then begin
                //     TmpDimSetEntry.Init;
                //     TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 5 Code");
                //     TmpDimSetEntry.Validate("Dimension Value Code", Rec."Shortcut Dimension 5 Code");
                //     TmpDimSetEntry.Insert;
                // end;
                // if DimValue.Get(GLSetup."Shortcut Dimension 6 Code", Rec."Shortcut Dimension 6 Code") then begin
                //     TmpDimSetEntry.Init;
                //     TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 6 Code");
                //     TmpDimSetEntry.Validate("Dimension Value Code", Rec."Shortcut Dimension 6 Code");
                //     TmpDimSetEntry.Insert();
                // end;
                // if DimValue.Get(GLSetup."Shortcut Dimension 7 Code", Rec."Shortcut Dimension 7 Code") then begin
                //     TmpDimSetEntry.Init;
                //     TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 7 Code");
                //     TmpDimSetEntry.Validate("Dimension Value Code", Rec."Shortcut Dimension 7 Code");
                //     TmpDimSetEntry.Insert();
                // end;
                // if DimValue.Get(GLSetup."Shortcut Dimension 8 Code", Rec."Shortcut Dimension 8 Code") then begin
                //     TmpDimSetEntry.Init;
                //     TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 8 Code");
                //     TmpDimSetEntry.Validate("Dimension Value Code", Rec."Shortcut Dimension 8 Code");
                //     TmpDimSetEntry.Insert();
                // end;
                TempJnlLine.validate("Dimension Set ID", DimMgmt.GetDimensionSetID(TmpDimSetEntry));
                TempJnlLine.insert(true);
                GenJnlPostLine.RunWithCheck(TempJnlLine);
                GLEntry."Expense Prepayment Reversed" := true;
                GLEntry.Modify(true);
            until GLEntry.Next() = 0;
        end;

    end;
    //post petty cash return
    procedure PostDirectPettyCashReturnJournal()
    var

        GLSetup: Record "General Ledger Setup";
        GLEntry: Record "G/L Entry";
        TempJnlLine: Record "Gen. Journal Line" temporary;
        TmpDimSetEntry: Record "Dimension Set Entry" temporary;
        DimValue: Record "Dimension Value";
        DimMgmt: Codeunit DimensionManagement;
        GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
        GLAccount: Record "G/L Account";
        Unigroupsetup: Record "Unigroup Setup";
        Trip: Record Trip;
    begin


        if Rec."Petty Cash For" = Rec."Petty Cash For"::Trip then
            TestField("Trip ID");
        Rec.TestField("Petty Cash Approval Status", Rec."Petty Cash Approval Status"::Approved);
        Rec.testfield("Transaction Reference No.");
        TempJnlLine.Reset();
        TempJnlLine.Init();
        Unigroupsetup.Get();
        TempJnlLine."Journal Template Name" := Unigroupsetup."Petty Cash Template Name";
        TempJnlLine."Journal Batch Name" := Unigroupsetup."Petty Cash Batch Name";
        TempJnlLine."Line No." += 10000;
        TempJnlLine.Validate("Posting Date", Today);
        //TempJnlLine."Document Type" := TempJnlLine."Document Type"::Payment;
        TempJnlLine.Validate("Document No.", Rec."Voucher No." + '-R');
        TempJnlLine.Validate("Account Type", Rec."Bal. Account Type");
        TempJnlLine.Validate("Account No.", Rec."Bal. Account No.");
        TempJnlLine.Validate("Bal. Account Type", Rec."Account Type");
        TempJnlLine.Validate("Bal. Account No.", Rec."Account No.");
        TempJnlLine.Validate(Amount, Rec."Petty Cash Amount");
        TempJnlLine.Validate(Description, Rec."Petty Cash Return No." + '-Reversal for voucher no:' + Rec."Voucher No.");
        GLSetup.get();
        TmpDimSetEntry.DeleteAll();
        if DimValue.Get(GLSetup."Global Dimension 1 Code", Rec."Global Dimension 1 Code") then begin
            TmpDimSetEntry.Init();
            TmpDimSetEntry.Validate("Dimension Code", GLSetup."Global Dimension 1 Code");
            TmpDimSetEntry.Validate("Dimension Value Code", Rec."Global Dimension 1 Code");
            TmpDimSetEntry.Insert();
        end;
        if DimValue.get(GLSetup."Global Dimension 2 Code", Rec."Global Dimension 2 Code") then begin
            TmpDimSetEntry.Init();
            TmpDimSetEntry.Validate("Dimension Code", GLSetup."Global Dimension 2 Code");
            TmpDimSetEntry.Validate("Dimension Value Code", Rec."Global Dimension 2 Code");
            TmpDimSetEntry.Insert();
        end;
        // if DimValue.Get(GLSetup."Shortcut Dimension 3 Code", Rec."Shortcut Dimension 3 Code") then begin
        //     TmpDimSetEntry.Init;
        //     TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 3 Code");
        //     TmpDimSetEntry.Validate("Dimension Value Code", Rec."Shortcut Dimension 3 Code");
        //     TmpDimSetEntry.Insert();
        // end;
        // if DimValue.Get(GLSetup."Shortcut Dimension 4 Code", Rec."Shortcut Dimension 4 Code") then begin
        //     TmpDimSetEntry.Init;
        //     TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 4 Code");
        //     TmpDimSetEntry.Validate("Dimension Value Code", Rec."Shortcut Dimension 4 Code");
        //     TmpDimSetEntry.insert;
        // end;
        // if DimValue.Get(GLSetup."Shortcut Dimension 5 Code", Rec."Shortcut Dimension 5 Code") then begin
        //     TmpDimSetEntry.Init;
        //     TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 5 Code");
        //     TmpDimSetEntry.Validate("Dimension Value Code", Rec."Shortcut Dimension 5 Code");
        //     TmpDimSetEntry.Insert();
        // end;
        // if DimValue.Get(GLSetup."Shortcut Dimension 6 Code", Rec."Shortcut Dimension 6 Code") then begin
        //     TmpDimSetEntry.Init;
        //     TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 6 Code");
        //     TmpDimSetEntry.Validate("Dimension Value Code", Rec."Shortcut Dimension 6 Code");
        //     TmpDimSetEntry.Insert();
        // end;
        TempJnlLine.Validate("Dimension Set ID", DimMgmt.GetDimensionSetID(TmpDimSetEntry));
        TempJnlLine.insert(true);
        GenJnlPostLine.RunWithCheck(TempJnlLine);



    end;


    //end

    procedure PostPettycashJournals()
    var
        GLSetup: Record "General Ledger Setup";
        GLEntry: Record "G/L Entry";
        TempJnlLine: Record "Gen. Journal Line" temporary;
        TmpDimSetEntry: Record "Dimension Set Entry" temporary;
        DimValue: Record "Dimension Value";
        DimMgmt: Codeunit DimensionManagement;
        GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
        GLAccount: Record "G/L Account";
        Unigroupsetup: Record "Unigroup Setup";
        Trip: Record Trip;
    begin
        if Rec."Petty Cash For" = Rec."Petty Cash For"::Trip then
            TestField("Trip ID");
        Rec.TestField("Petty Cash Approval Status", Rec."Petty Cash Approval Status"::Approved);
        Rec.testfield("Transaction Reference No.");
        if not Confirm('Do you want to post the Petty Cash Expense?', true) then
            exit else begin
            TempJnlLine.Reset();
            TempJnlLine.Init();
            Unigroupsetup.Get();
            TempJnlLine."Journal Template Name" := Unigroupsetup."Petty Cash Template Name";
            TempJnlLine."Journal Batch Name" := Unigroupsetup."Petty Cash Batch Name";
            TempJnlLine."Line No." += 10000;
            TempJnlLine.Validate("Posting Date", "Creation date");
            TempJnlLine."Document Type" := TempJnlLine."Document Type"::Payment;
            TempJnlLine.Validate("Document No.", Rec."Voucher No.");
            TempJnlLine.Validate("Account Type", Rec."Account Type");
            TempJnlLine.Validate("Account No.", Rec."Account No.");
            TempJnlLine.Validate("Bal. Account Type", Rec."Bal. Account Type");
            TempJnlLine.Validate("Bal. Account No.", Rec."Bal. Account No.");
            TempJnlLine.Validate(Amount, Rec."Petty Cash Amount");
            TempJnlLine.Validate(Description, Rec."Voucher No.");
            GLSetup.get();
            TmpDimSetEntry.DeleteAll();

            if DimValue.Get(GLSetup."Global Dimension 1 Code", Rec."Global Dimension 1 Code") then begin
                TmpDimSetEntry.Init();
                TmpDimSetEntry.Validate("Dimension Code", GLSetup."Global Dimension 1 Code");
                TmpDimSetEntry.Validate("Dimension Value Code", Rec."Global Dimension 1 Code");
                TmpDimSetEntry.Insert();
            end;
            if DimValue.get(GLSetup."Global Dimension 2 Code", Rec."Global Dimension 2 Code") then begin
                TmpDimSetEntry.Init();
                TmpDimSetEntry.Validate("Dimension Code", GLSetup."Global Dimension 2 Code");
                TmpDimSetEntry.Validate("Dimension Value Code", Rec."Global Dimension 2 Code");
                TmpDimSetEntry.Insert();
            end;
            if DimValue.Get(GLSetup."Shortcut Dimension 3 Code", Rec."Shortcut Dimension 3 Code") then begin
                TmpDimSetEntry.Init;
                TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 3 Code");
                TmpDimSetEntry.Validate("Dimension Value Code", Rec."Shortcut Dimension 3 Code");
                TmpDimSetEntry.Insert();
            end;
            if DimValue.Get(GLSetup."Shortcut Dimension 4 Code", Rec."Shortcut Dimension 4 Code") then begin
                TmpDimSetEntry.Init;
                TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 4 Code");
                TmpDimSetEntry.Validate("Dimension Value Code", Rec."Shortcut Dimension 4 Code");
                TmpDimSetEntry.insert;
            end;
            if DimValue.Get(GLSetup."Shortcut Dimension 5 Code", Rec."Shortcut Dimension 5 Code") then begin
                TmpDimSetEntry.Init;
                TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 5 Code");
                TmpDimSetEntry.Validate("Dimension Value Code", Rec."Shortcut Dimension 5 Code");
                TmpDimSetEntry.Insert();
            end;
            if DimValue.Get(GLSetup."Shortcut Dimension 6 Code", Rec."Shortcut Dimension 6 Code") then begin
                TmpDimSetEntry.Init;
                TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 6 Code");
                TmpDimSetEntry.Validate("Dimension Value Code", Rec."Shortcut Dimension 6 Code");
                TmpDimSetEntry.Insert();
            end;
            TempJnlLine.Validate("Dimension Set ID", DimMgmt.GetDimensionSetID(TmpDimSetEntry));
            TempJnlLine.insert(true);
            GenJnlPostLine.RunWithCheck(TempJnlLine);
            Rec.Posted := true;
            if Trip.Get(Rec."Trip ID") then begin
                if trip."Trip Status" = trip."Trip Status"::Approved then begin
                    Trip.Validate("Trip Stage", Trip."Trip Stage"::"Fuel & Allowances");
                    Trip.Modify();
                end;
            end;
        end;
    end;
}