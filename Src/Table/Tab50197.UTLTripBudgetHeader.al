table 50197 "UTL Trip Budget Header"
{
    Caption = 'UTL Trip Budget Header';
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Budget Year"; Integer)
        {
            Caption = 'Budget Year';
            DataClassification = ToBeClassified;
        }
        field(2; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));

            trigger OnValidate()
            var

            begin
                if xRec."Shortcut Dimension 5 Code" <> '' then
                    Error('You Can not change Sales Person Code');
            end;
        }
        field(3; "Budget Type"; Enum "UTL Budget type")
        {
            Caption = 'Budget Type';
            DataClassification = ToBeClassified;
        }


    }
    keys
    {
        key(Pk; "Budget Year", "Shortcut Dimension 5 Code", "Budget Type")
        {
            Clustered = true;
        }
    }
    procedure InitValues()
    var
        Dim2, Dim : Record Dimension;
        DimValue2, DimValue : Record "Dimension Value";
        BudgetLine2, BudgetLine : Record "UTL Trip Budget Line";
        LineNo: Integer;
        GLSetup: Record "General Ledger Setup";
    begin
        Clear(LineNo);
        GLSetup.Get();
        Dim2.Reset();
        Dim2.SetRange(Code, GLSetup."Global Dimension 2 Code");
        if Dim2.FindFirst() then begin
            DimValue2.Reset();
            DimValue2.SetRange("Dimension Code", Dim2.Code);
            //DimValue2.SetRange("Trip Type", DimValue2.Code);
            if DimValue2.FindFirst() then
                repeat
                    BudgetLine2.Reset();
                    BudgetLine2.SetRange("Budget Year", Rec."Budget Year");
                    BudgetLine2.SetRange("Shortcut Dimension 5 Code", rec."Shortcut Dimension 5 Code");
                    BudgetLine2.SetRange("Budget Type", Rec."Budget Type");
                    if BudgetLine2.FindLast() then
                        LineNo := BudgetLine2."Line No." + 10000
                    else
                        LineNo := 10000;
                    BudgetLine.Init();
                    BudgetLine."Budget Year" := Rec."Budget Year";
                    BudgetLine."Shortcut Dimension 5 Code" := rec."Shortcut Dimension 5 Code";
                    BudgetLine."Budget Type" := Rec."Budget Type";
                    BudgetLine."Line No." := LineNo;
                    //BudgetLine."Shortcut Dimension 5 Code" := DimValue.Code;
                    BudgetLine."Global Dimension 2 Code" := DimValue2.Code;
                    BudgetLine.Insert();
                until DimValue2.Next = 0;
        end;
    end;

    procedure UpdateSalesPersoninLines()
    var
        BudgetLine: Record "UTL Trip Budget Line";
    begin
        BudgetLine.Reset();
        BudgetLine.SetRange("Budget Year", rec."Budget Year");
        BudgetLine.SetRange("Shortcut Dimension 5 Code", Rec."Shortcut Dimension 5 Code");
        if not BudgetLine.FindFirst() then
            Rec.InitValues();
    end;

    trigger OnInsert()
    begin
        TestField("Budget Type");
        TestField("Shortcut Dimension 5 Code");
        rec.InitValues();
    end;

    // trigger OnModify()
    // begin
    //     Rec.UpdateSalesPersoninLines();
    // end;
    trigger OnDelete()
    var
        BudgetLine: Record "UTL Trip Budget Line";
    begin
        BudgetLine.Reset();
        BudgetLine.SetRange("Budget Year", rec."Budget Year");
        BudgetLine.SetRange("Shortcut Dimension 5 Code", Rec."Shortcut Dimension 5 Code");
        BudgetLine.SetRange("Budget Type", Rec."Budget Type");
        if BudgetLine.FindFirst() then
            repeat
                BudgetLine.DeleteAll();
            //Rec.InitValues();
            until BudgetLine.Next() = 0;

    end;
}