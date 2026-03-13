table 50167 "Stock Return Header"
{
    Caption = 'Stock Return header';
    DataClassification = ToBeClassified;
    DataCaptionFields = "Stock Return No.";
    fields
    {
        field(1; "Stock Return No."; Code[20])
        {
            Caption = 'Stock Return No.';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Unigroupsetup: Record "Unigroup Setup";
                NoSeriesMgmt: Codeunit "No. Series";
            begin
                if "Stock Return No." <> xRec."Stock Return No." then begin
                    Unigroupsetup.Get;
                    NoSeriesMgmt.TestManual(Unigroupsetup."Stock Return No.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Stock Return Date"; Date)
        {
            Caption = 'Stock Return Date';
            DataClassification = ToBeClassified;
        }
        // field(3; "Stock Request Status"; Enum "Stock request status")
        // {
        //     Caption = 'Stock Request Status';
        //     DataClassification = ToBeClassified;
        // }
        field(4; "Return By"; Text[50])
        {
            Caption = 'Return By';
            DataClassification = ToBeClassified;
            TableRelation = user."User Name";
            Editable = false;
        }
        field(5; "Job Card No."; Code[20])
        {
            Caption = 'Job Card No.';
            DataClassification = ToBeClassified;
            TableRelation = "Workshop Jobs";
            Editable = false;
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
            TableRelation = Employee;
        }
        field(10; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
        }
        field(11; "Mechanic No"; Code[20])
        {
            Caption = 'Mechanic No.';
            DataClassification = ToBeClassified;
            TableRelation = Employee;
            trigger OnValidate()
            var
                Mechn: Record Employee;
            begin
                if Mechn.Get("Mechanic No") then
                    "Mechanic Name" := Mechn.FullName()
                else
                    "Mechanic Name" := '';
            end;
        }
        field(12; "Mechanic Name"; Text[50])
        {
            Caption = 'Mechanic Name';
            DataClassification = ToBeClassified;
        }
        field(13; Posted; Boolean)
        {
            Caption = 'Posted';
            DataClassification = ToBeClassified;
        }
        field(14; "Job Type"; Code[20])
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
        key(PK; "Stock Return No.")
        {
            Clustered = true;
        }
    }


    trigger OnInsert()
    var
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        if "Stock Return No." = '' then begin
            Unigroupsetup.Get;
            Unigroupsetup.TestField("Stock Return No.");
            "No. Series" := Unigroupsetup."Stock Return No.";
            if NoSeriesMgmt.AreRelated(Unigroupsetup."Stock Return No.", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "Stock Return No." := NoSeriesMgmt.GetNextNo("No. Series");

        end;
    end;

    procedure AssistEdit(StockReturnNoRec: Record "Stock Return Header"): Boolean
    var
        StockRetNo: Record "Stock Return Header";
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        StockRetNo := Rec;
        Unigroupsetup.Get;
        Unigroupsetup.TestField(Unigroupsetup."Stock Return No.");
        if NoSeriesMgmt.LookupRelatedNoSeries(Unigroupsetup."Stock Return No.", StockReturnNoRec."No. Series", "No. Series") then begin
            NoSeriesMgmt.GetNextNo("Stock Return No.");
            Rec := StockRetNo;
            exit(true);
        end;
    end;

    procedure PostStockReturn()
    var
        PoStockReturnHeader: Record "Posted StockReturn Header ";
        PoStockReturnline: Record "Posted StockReturn Line";
        StockReturnline: Record "Stock Return Line";
        UnigroupSetup: Record "Unigroup Setup";
        NoSeriesMgt: Codeunit "No. Series";
        RequestPartServicesline: Record "Requested Parts/Service Line";
        LineNo: Integer;
        TempItemJnlLine2, TempItemJnlLine : Record "Item Journal Line" temporary;
        TmpDimSetEntry: Record "Dimension Set Entry" temporary;
        DimValue: Record "Dimension Value";
        DimMgmt: Codeunit DimensionManagement;
        GLSetup: Record "General Ledger Setup";
        JournalBatch: Record "Item Journal Batch";
        ItemJnlPostline2, ItemJnlPostline : Codeunit "Item Jnl.-Post Line";
    begin
        if not Confirm('Do you want to stock Return?', true) then
            exit else begin
            StockReturnline.Reset();
            StockReturnline.SetRange("Document No.", Rec."Stock Return No.");
            StockReturnline.SetFilter(Quantity, '<>%1', 0);
            if not StockReturnline.FindSet() then
                Error('There is nothing to post')
            else begin
                UnigroupSetup.Get();
                PoStockReturnHeader.Init();
                PoStockReturnHeader."Stock Return No." := NoSeriesMgt.GetNextNo(UnigroupSetup."Stock Issue No.", Today, true);
                PoStockReturnHeader.Validate("Stock Return Date", Today);
                PoStockReturnHeader.Validate("Job Card No.", Rec."Job Card No.");
                PoStockReturnHeader.Validate("Job Type", Rec."Job Type");
                PoStockReturnHeader.Validate("Driver ID", Rec."Driver ID");
                PoStockReturnHeader.Validate("Vehicle No.", Rec."Vehicle No.");
                PoStockReturnHeader.Validate("Issued To", Rec."Issued To");
                PoStockReturnHeader.Validate("Mechanic No", Rec."Mechanic No");
                PoStockReturnHeader.Validate("Mechanic Name", Rec."Mechanic Name");
                PoStockReturnHeader.Validate("Return By", Rec."Return By");
                PoStockReturnHeader.Insert();
                StockReturnline.Reset();
                StockReturnline.SetRange("Document No.", Rec."Stock Return No.");
                StockReturnline.SetFilter(Quantity, '<>%1', 0);
                if StockReturnline.FindFirst() then
                    repeat
                        LineNo += 10000;
                        PoStockReturnline.Init();
                        PoStockReturnline."Document No." := Rec."Stock Return No.";
                        PoStockReturnline."Line No." := LineNo;
                        PoStockReturnline."Job Card No." := Rec."Job Card No.";
                        PoStockReturnline.Validate("No.", StockReturnline."No.");
                        PoStockReturnline.Validate(Description, StockReturnline.Description);
                        PoStockReturnline."Job Line No." := StockReturnline."Job Line No.";
                        PoStockReturnline.Quantity := StockReturnline.Quantity;
                        // PoStockReturnline."Location Code" := StockReturnline."Location Code";
                        PoStockReturnline."Stock Return Date" := StockReturnline."Stock Return Date";
                        PoStockReturnline.Validate("Global Dimension 1 Code", Rec."Global Dimension 1 Code");
                        PoStockReturnline.Validate("Global Dimension 2 Code", Rec."Global Dimension 2 Code");
                        PoStockReturnline.Validate("Shortcut Dimension 3 Code", Rec."Shortcut Dimension 3 Code");
                        PoStockReturnline.Validate("Shortcut Dimension 4 Code", Rec."Shortcut Dimension 4 Code");
                        PoStockReturnline.Validate("Shortcut Dimension 5 Code", Rec."Shortcut Dimension 5 Code");
                        PoStockReturnline.Validate("Shortcut Dimension 6 Code", Rec."Shortcut Dimension 6 Code");
                        PoStockReturnline.Validate("Shortcut Dimension 7 Code", Rec."Shortcut Dimension 7 Code");
                        PoStockReturnline.Validate("Shortcut Dimension 8 Code", Rec."Shortcut Dimension 8 Code");
                        PoStockReturnline.Insert();
                        if StockReturnline.Quantity = 0 then
                            error('Quantity should not be 0');
                        TempItemJnlLine2.Init();
                        Unigroupsetup.Get();
                        TempItemJnlLine2."Journal Template Name" := Unigroupsetup."Fuel Consumption Template Name";
                        TempItemJnlLine2."Journal Batch Name" := Unigroupsetup."Fuel Consumption Batch Name";
                        TempItemJnlLine2."Line No." := PoStockReturnline."Line No.";
                        TempItemJnlLine2."Entry Type" := TempItemJnlLine2."Entry Type"::"Positive Adjmt.";
                        TempItemJnlLine2."Posting Date" := WorkDate();
                        TempItemJnlLine2."Document No." := StockReturnline."Document No.";
                        TempItemJnlLine2.Validate("Item No.", StockReturnline."No.");
                        TempItemJnlLine2.Validate(Quantity, StockReturnline.Quantity);
                        TempItemJnlLine2.Validate("Location Code", StockReturnline."Shortcut Dimension 6 Code");
                        TempItemJnlLine2.Insert(true);
                        ItemJnlPostline.RunWithCheck(TempItemJnlLine2);
                    until StockReturnline.Next() = 0;
                GLSetup.Get();
                TmpDimSetEntry.DeleteAll();
                if DimValue.Get(GLSetup."Global Dimension 1 Code", Rec."Global Dimension 1 Code") then begin
                    TmpDimSetEntry.Init;
                    TmpDimSetEntry.Validate("Dimension Code", GLSetup."Global Dimension 1 Code");
                    TmpDimSetEntry.Validate("Dimension Value Code", Rec."Global Dimension 1 Code");
                    TmpDimSetEntry.Insert;
                end;
                if DimValue.Get(GLSetup."Global Dimension 2 Code", Rec."Global Dimension 2 Code") then begin
                    TmpDimSetEntry.Init;
                    TmpDimSetEntry.Validate("Dimension Code", GLSetup."Global Dimension 2 Code");
                    TmpDimSetEntry.Validate("Dimension Value Code", Rec."Global Dimension 2 Code");
                    TmpDimSetEntry.Insert;
                end;
                if DimValue.Get(GLSetup."Shortcut Dimension 3 Code", Rec."Shortcut Dimension 3 Code") then begin
                    TmpDimSetEntry.Init;
                    TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 3 Code");
                    TmpDimSetEntry.Validate("Dimension Value Code", Rec."Shortcut Dimension 3 Code");
                    TmpDimSetEntry.Insert;
                end;
                if DimValue.Get(GLSetup."Shortcut Dimension 4 Code", Rec."Shortcut Dimension 4 Code") then begin
                    TmpDimSetEntry.Init;
                    TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 4 Code");
                    TmpDimSetEntry.Validate("Dimension Value Code", Rec."Shortcut Dimension 4 Code");
                    TmpDimSetEntry.Insert;
                end;
                if DimValue.Get(GLSetup."Shortcut Dimension 5 Code", Rec."Shortcut Dimension 5 Code") then begin
                    TmpDimSetEntry.Init;
                    TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 5 Code");
                    TmpDimSetEntry.Validate("Dimension Value Code", Rec."Shortcut Dimension 5 Code");
                    TmpDimSetEntry.Insert;
                end;
                if DimValue.Get(GLSetup."Shortcut Dimension 6 Code", Rec."Shortcut Dimension 6 Code") then begin
                    TmpDimSetEntry.Init;
                    TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 6 Code");
                    TmpDimSetEntry.Validate("Dimension Value Code", Rec."Shortcut Dimension 6 Code");
                    TmpDimSetEntry.Insert;
                end;
                if DimValue.Get(GLSetup."Shortcut Dimension 7 Code", Rec."Shortcut Dimension 7 Code") then begin
                    TmpDimSetEntry.Init;
                    TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 7 Code");
                    TmpDimSetEntry.Validate("Dimension Value Code", Rec."Shortcut Dimension 7 Code");
                    TmpDimSetEntry.Insert;
                end;
                if DimValue.Get(GLSetup."Shortcut Dimension 8 Code", Rec."Shortcut Dimension 8 Code") then begin
                    TmpDimSetEntry.Init;
                    TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 8 Code");
                    TmpDimSetEntry.Validate("Dimension Value Code", Rec."Shortcut Dimension 8 Code");
                    TmpDimSetEntry.Insert;
                end;
                TempItemJnlLine.Validate("Dimension Set ID", DimMgmt.GetDimensionSetID(TmpDimSetEntry));
            end;
        end;
    end;

}
