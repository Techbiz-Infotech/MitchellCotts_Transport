table 50161 "Requested Parts/Service Line"
{
    Caption = 'Requested Parts/Service Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Job Card No."; Code[20])
        {
            Caption = 'Job Card No.';
            DataClassification = ToBeClassified;
            TableRelation = "Workshop Jobs"."Job Card No." where("Job Card No." = field("Job Card No."));

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
            TableRelation = IF (Type = CONST(Item)) Item
            ELSE
            IF (Type = CONST(Service)) "Job Card Services";
            trigger OnValidate()
            var
                NoRec: Record Item;
                SerRec: Record "Job Card Services";
            begin

                if Type = Type::Item then
                    if NoRec.Get("No.") then
                        Description := NoRec.Description
                    else
                        Description := '';
                if Type = Type::Service then
                    if SerRec.Get("No.") then
                        Description := SerRec.Description
                    else
                        Description := '';
            end;


        }
        field(4; Description; Text[50])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(5; "Stock Request No."; Code[20])
        {
            Caption = 'Stock Request No.';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Stock Requested"; Boolean)
        {
            Caption = 'Stock Requested';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "Issued Quantity"; Decimal)
        {
            Caption = 'Issued Quantity';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = sum("Stock Issue line".Quantity where("Job Card No." = field("Job Card No."), "No." = field("No."), "Stock Request No." = field("Stock Request No."), "Job Line No." = field("Line No.")));
        }
        field(8; "Requested Date"; Date)
        {
            Caption = 'Requested Date';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; Type; Enum Type)
        {
            Caption = 'Type';
            DataClassification = ToBeClassified;
        }
        field(10; "Request Quantity"; Decimal)
        {
            Caption = 'Request Quantity';
            DataClassification = ToBeClassified;
        }
        field(11; "Return Quantity"; Decimal)
        {
            Caption = 'Return Quantity';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if "Return Quantity" > "Issued Quantity" then
                    Error('You Cannot return more than %1 quantity', "Issued Quantity");
            end;
        }
        field(12; "Stock Return"; Boolean)
        {
            Caption = 'Stock Return';
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
        key(PK1; "Job Card No.", "Line No.")
        {
            Clustered = true;
        }
    }

}



