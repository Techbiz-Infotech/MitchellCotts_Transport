table 57060 "Stock request line"
{
    Caption = 'Stock request line';
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = ToBeClassified;
            TableRelation = "Stock request header"."Stock Request No." where("Stock Request No." = field("Document No."));
        }

        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
        }
        field(3; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            TableRelation = Item;

            trigger OnValidate()
            var
                ItemRec: Record Item;
                SerRec: Record "Job Card Services";
            begin

                if ItemRec.Get("No.") then begin
                    Description := ItemRec.Description;
                    "Scrap Applicable?" := ItemRec."Can Scrap?";
                end else begin
                    Description := '';
                    "Scrap Applicable?" := false;
                end;
            end;

        }
        field(4; Description; Text[50])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(5; "Job Card No."; Code[20])
        {
            Caption = 'Job Card No.';
            DataClassification = ToBeClassified;
        }
        field(6; "Stock Requested Date"; Date)
        {
            Caption = 'Stock Requested Date';
            DataClassification = ToBeClassified;
        }
        field(7; "Purchase Quote No."; Code[20])
        {
            Caption = 'Purchase Quote No.';
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." WHERE("Document Type" = CONST(Quote), "Job Card No." = field("Job Card No."));
            trigger OnValidate()
            var
                PQ: Record "Purchase Header";
            begin
                PQ.Reset();
                PQ.SetRange("Document Type", PQ."Document Type"::Quote);
                PQ.SetRange("No.", "Purchase Quote No.");
                if PQ.FindFirst() then
                    "Vendor No." := PQ."Buy-from Vendor No."
                else
                    "Vendor No." := '';
            end;
        }
        field(8; "Location Inventory"; Integer)
        {
            Caption = 'Location Inventory';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("No."), "Location Code" = field("Shortcut Dimension 6 Code")));
        }

        field(9; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = ToBeClassified;
        }
        field(10; "Qty to Issue"; Decimal)
        {
            Caption = 'Qty to Issue';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Remqty: Decimal;
            begin
                Remqty := (Quantity - "Qty Issued");
                if "Qty to Issue" > Remqty then
                    Error('Quantity Should not be more than %1', Remqty);
            end;
        }
        field(11; "Qty Issued"; Decimal)
        {
            Caption = 'Qty Issued';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "Job Line No."; Integer)
        {
            Caption = 'Job Line No.';
            DataClassification = ToBeClassified;
        }
        field(13; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
            Editable = false;
        }
        field(14; "Scrap Applicable?"; Boolean)
        {
            Caption = 'Scrap Applicable?';
            DataClassification = ToBeClassified;
        }
        field(15; "Scrap Quantity"; Decimal)
        {
            Caption = 'Scrap Quantity';
            DataClassification = ToBeClassified;
        }
        field(16; "Scrap Item No."; Code[20])
        {
            Caption = 'Scrap Item No.';
            DataClassification = ToBeClassified;
            TableRelation = Item;
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
        key(PK1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
        key(PK2; "Vendor No.")
        {

        }
    }
}
