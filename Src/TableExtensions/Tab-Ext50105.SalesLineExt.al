tableextension 50105 SalesLineExt extends "Sales Line"
{
    fields
    {
        field(50100; "Trip ID"; Code[20])
        {
            Caption = 'Trip ID';
            DataClassification = ToBeClassified;
        }

        field(50101; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
            trigger onvalidate()
            var
                myInt: Integer;
            begin
                rec.ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
            end;
        }
        field(50102; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
            trigger onvalidate()
            var
                myInt: Integer;
            begin
                rec.ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }

        field(50103; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
            trigger onvalidate()
            var
                myInt: Integer;
            begin
                rec.ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
            end;
        }
        field(50104; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
            trigger onvalidate()
            var
                myInt: Integer;
            begin
                rec.ValidateShortcutDimCode(6, "Shortcut Dimension 6 Code");
            end;
        }
        field(50105; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
            trigger onvalidate()
            var
                myInt: Integer;
            begin
                rec.ValidateShortcutDimCode(7, "Shortcut Dimension 7 Code");
            end;
        }
        field(50106; "Shortcut Dimension 8 Code"; Code[20])
        {
            CaptionClass = '1,2,8';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(8),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
            trigger onvalidate()
            var
                myInt: Integer;
            begin
                rec.ValidateShortcutDimCode(8, "Shortcut Dimension 8 Code");
            end;
        }
        field(50107; "Auto Calculated"; Boolean)
        {
            Caption = 'Auto Calculated';
            DataClassification = ToBeClassified;
        }
    }

}
