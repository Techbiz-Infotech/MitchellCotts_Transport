tableextension 57020 SalesPersonExt extends "Salesperson/Purchaser"
{
    // trigger OnAfterInsert()
    // var
    //     DimensionValue: Record "Dimension Value";
    //     Dim: Record Dimension;
    //     GLSetup: Record "General Ledger Setup";
    //     DimCode: Code[20];
    //     DimValue: Code[20];
    // begin
    //     GLSetup.Get();
    //     DimCode := GLSetup."Shortcut Dimension 5 Code";
    //     DimValue := Rec.Code;
    //     if not DimensionValue.Get(DimCode, DimValue) then begin
    //         DimensionValue.Init();
    //         DimensionValue.Validate("Dimension Code", DimCode);
    //         DimensionValue.Validate(Code, DimValue);
    //         DimensionValue.Validate(Name, DimValue);
    //         DimensionValue.Insert();
    //     end;
    // end;
}
