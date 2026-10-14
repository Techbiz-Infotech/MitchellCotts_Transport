report 57046 Prepayment_Reversal
{
    ApplicationArea = All;
    Caption = 'Expense Prepayment Reversal';
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    Permissions = tabledata "G/L Entry" = rimd;
    UseRequestPage = false;
    trigger OnPostReport()
    begin
        Prepayment_Reveral();
    end;

    trigger OnInitReport()
    begin
        // if CompanyName = 'UTL Live' then
        //     Error('It should not process in live');
    end;

    procedure Prepayment_Reveral()
    var
        UnigroupSetup: record "Unigroup Setup";
        GLEntry: Record "G/L Entry";
        DimValue: Record "Dimension Value";
        TempTripID: Code[20];
        TempJnlLine: Record "Gen. Journal Line" temporary;
        TmpDimSetEntry: Record "Dimension Set Entry" temporary;
        GLSetup: Record "General Ledger Setup";
        GLAccount: Record "G/L Account";
        GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
        DimMgmt: Codeunit DimensionManagement;
        TripId: Code[20];
        TripRec: Record Trip;
    begin

        GLSetup.Get();
        UnigroupSetup.Get();
        GLEntry.Reset();
        GLEntry.SetRange("G/L Account No.", UnigroupSetup."Trip Prepayment From", UnigroupSetup."Trip Prepayment To");
        GLEntry.SetRange("Expense Prepayment Reversed", false);
        GLEntry.SetRange(Reversed, false);
        //GLEntry.SetFilter("Posting Date", '>%1', Today);
        if GLEntry.FindFirst() then begin
            repeat
                GLEntry.CalcFields(GLEntry."Shortcut Dimension 3 Code");
                TripRec.Reset();
                TripRec.SetRange("Trip ID", GLEntry."Shortcut Dimension 3 Code");
                TripRec.SetFilter("Trip Status", '%1|%2', TripRec."Trip Status"::Invoiced, TripRec."Trip Status"::Terminated);
                if TripRec.FindFirst() then begin
                    TempJnlLine.Reset();
                    TempJnlLine.Init();
                    TempJnlLine.Validate("Journal Template Name", 'GENERAL');
                    TempJnlLine.Validate("Journal Batch Name", 'DEFAULT');
                    TempJnlLine.Validate("Line No.", 10000 * (TempJnlLine.Count + 1));
                    TempJnlLine.Validate("Posting Date", GLEntry."Posting Date");
                    TempJnlLine.Validate("Document Type", 0);
                    TempJnlLine.Validate("Document No.", GLEntry."Document No.");
                    TempJnlLine.Validate("Account Type", TempJnlLine."Account Type"::"G/L Account");
                    GLAccount.Get(GLEntry."G/L Account No.");
                    TempJnlLine.Validate("Account No.", GLAccount."Prepayment Reversal Account");
                    GLEntry.CalcFields("G/L Account Name", "Shortcut Dimension 3 Code");
                    TempJnlLine.Validate(Description, GLEntry."Document No." + '-Reversal-' + GLEntry."Shortcut Dimension 3 Code" + ' ' + GLEntry."G/L Account Name");
                    TempJnlLine.Validate(Amount, GLEntry.Amount);
                    TempJnlLine.Validate("Bal. Account Type", TempJnlLine."Bal. Account Type"::"G/L Account");
                    TempJnlLine.Validate("Bal. Account No.", GLEntry."G/L Account No.");
                    TempJnlLine.Validate("Expense Prepayment Reversed", true);
                    TmpDimSetEntry.DeleteAll();

                    if DimValue.get(GLSetup."Global Dimension 1 Code", GLEntry."Global Dimension 1 Code") then begin
                        TmpDimSetEntry.init;
                        TmpDimSetEntry.Validate("Dimension Code", GLSetup."Global Dimension 1 Code");
                        TmpDimSetEntry.Validate("Dimension Value Code", GLEntry."Global Dimension 1 Code");
                        TmpDimSetEntry.insert;
                    end;
                    if DimValue.get(GLSetup."Global Dimension 2 Code", GLEntry."Global Dimension 2 Code") then begin
                        TmpDimSetEntry.Init;
                        TmpDimSetEntry.Validate("Dimension Code", GLSetup."Global Dimension 2 Code");
                        TmpDimSetEntry.Validate("Dimension Value Code", GLEntry."Global Dimension 2 Code");
                        TmpDimSetEntry.Insert;
                    end;
                    GLEntry.CalcFields(GLEntry."Shortcut Dimension 3 Code");
                    if DimValue.Get(GLSetup."Shortcut Dimension 3 Code", GLEntry."Shortcut Dimension 3 Code") then begin
                        TmpDimSetEntry.Init;
                        TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 3 Code");
                        TmpDimSetEntry.Validate("Dimension Value Code", GLEntry."Shortcut Dimension 3 Code");
                        TmpDimSetEntry.Insert;
                    end;
                    GLEntry.CalcFields(GLEntry."Shortcut Dimension 4 Code");
                    if DimValue.Get(GLSetup."Shortcut Dimension 4 Code", GLEntry."Shortcut Dimension 4 Code") then begin
                        TmpDimSetEntry.Init();
                        TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 4 Code");
                        TmpDimSetEntry.Validate("Dimension Value Code", GLEntry."Shortcut Dimension 4 Code");
                        TmpDimSetEntry.Insert;
                    end;
                    GLEntry.CalcFields(GLEntry."Shortcut Dimension 5 Code");
                    if DimValue.Get(GLSetup."Shortcut Dimension 5 Code", GLEntry."Shortcut Dimension 5 Code") then begin
                        TmpDimSetEntry.Init;
                        TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 5 Code");
                        TmpDimSetEntry.Validate("Dimension Value Code", GLEntry."Shortcut Dimension 5 Code");
                        TmpDimSetEntry.Insert;
                    end;
                    GLEntry.CalcFields(GLEntry."Shortcut Dimension 6 Code");
                    if DimValue.Get(GLSetup."Shortcut Dimension 6 Code", GLEntry."Shortcut Dimension 6 Code") then begin
                        TmpDimSetEntry.Init;
                        TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 6 Code");
                        TmpDimSetEntry.Validate("Dimension Value Code", GLEntry."Shortcut Dimension 6 Code");
                        TmpDimSetEntry.Insert();
                    end;
                    GLEntry.CalcFields(GLEntry."Shortcut Dimension 7 Code");
                    if DimValue.Get(GLSetup."Shortcut Dimension 7 Code", GLEntry."Shortcut Dimension 7 Code") then begin
                        TmpDimSetEntry.Init;
                        TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 7 Code");
                        TmpDimSetEntry.Validate("Dimension Value Code", GLEntry."Shortcut Dimension 7 Code");
                        TmpDimSetEntry.Insert();
                    end;
                    GLEntry.CalcFields(GLEntry."Shortcut Dimension 8 Code");
                    if DimValue.Get(GLSetup."Shortcut Dimension 8 Code", GLEntry."Shortcut Dimension 8 Code") then begin
                        TmpDimSetEntry.Init;
                        TmpDimSetEntry.Validate("Dimension Code", GLSetup."Shortcut Dimension 8 Code");
                        TmpDimSetEntry.Validate("Dimension Value Code", GLEntry."Shortcut Dimension 8 Code");
                        TmpDimSetEntry.Insert();
                    end;

                    TempJnlLine.validate("Dimension Set ID", DimMgmt.GetDimensionSetID(TmpDimSetEntry));
                    TempJnlLine.insert(true);
                    GenJnlPostLine.RunWithCheck(TempJnlLine);
                    GLEntry."Expense Prepayment Reversed" := true;
                    GLEntry.Modify(true);
                end;
            until GLEntry.Next() = 0;
        end;
    end;
}
