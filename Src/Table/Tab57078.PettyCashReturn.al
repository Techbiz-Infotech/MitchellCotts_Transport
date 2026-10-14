table 57078 "Petty Cash Return"
{
    Caption = 'Petty Cash Return';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Petty Cash Return";
    LookupPageId = "Petty Cash Return";


    fields
    {
        field(1; "Petty Cash Return No."; Code[20])
        {
            Caption = 'Petty Cash Return No.';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Unigroupsetup: Record "Unigroup Setup";
                NoSeriesMgmt: Codeunit "No. Series";
            begin
                if "Petty Cash Return No." <> xRec."Petty Cash Return No." then begin
                    Unigroupsetup.Get;
                    NoSeriesMgmt.TestManual(Unigroupsetup."Petty Cash Return No.");
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
            // trigger OnValidate()
            // var
            //     ExpenseTypeRec: Record "Petty Cash Expense Type";
            // begin
            //     if ExpenseTypeRec.Get("Expense Type") then begin
            //         if "For Closed Trip?" then
            //             "Account No." := ExpenseTypeRec."Petty Cash Expense Account"
            //         else
            //             "Account No." := ExpenseTypeRec."Petty Cash Prepayment Account";
            //     end else
            //         "Account No." := '';
            // end;
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
        field(112; "Return Date"; Date)
        {
            Caption = 'Last Modified Date';
            DataClassification = ToBeClassified;

        }
        field(113; "Voucher No."; Code[20])
        {
            Caption = 'Voucher No.';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Petty Cash Return No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        if "Petty Cash Return No." = '' then begin
            Unigroupsetup.Get;
            Unigroupsetup.TestField("Petty Cash Return No.");
            "No. Series" := xRec."No. Series";
            if NoSeriesMgmt.AreRelated(Unigroupsetup."Petty Cash Return No.", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "Petty Cash Return No." := NoSeriesMgmt.GetNextNo("No. Series");

        end;
        "Return Date" := WorkDate();
    end;

    procedure AssistEdit(ReturnNumberRec: Record "Petty Cash Return"): Boolean
    var
        ReturnNumber: Record "Petty Cash Return";
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        ReturnNumber := Rec;
        Unigroupsetup.Get;
        Unigroupsetup.TestField(Unigroupsetup."Petty Cash Return No.");
        if NoSeriesMgmt.LookupRelatedNoSeries(Unigroupsetup."Petty Cash Return No.", ReturnNumberRec."No. Series", "No. Series") then begin
            NoSeriesMgmt.GetNextNo(ReturnNumber."Petty Cash Return No.", WorkDate(), true);
            Rec := ReturnNumber;
            exit(true);
        end;
    end;
}
