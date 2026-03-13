tableextension 50113 PurchaseLineExt extends "Purchase Line"
{
    fields
    {
        field(50100; "Job Card No."; Code[20])
        {
            Caption = 'Job Card No.';
            DataClassification = ToBeClassified;
        }
        field(50101; "Shortage?"; Boolean)
        {
            Caption = 'Shortage?';
            DataClassification = ToBeClassified;
        }
        field(50102; "Shortage Quantity"; Decimal)
        {
            Caption = 'Shortage Quantity';
            DataClassification = ToBeClassified;
        }
        field(50103; "Fuel Issue No."; code[20])
        {
            Caption = 'Fuel Issue No.';
            fieldclass = flowfield;
            CalcFormula = lookup("Purchase Header"."Fuel Issue No." where("Document Type" = field("Document Type"),"No." = field("Document No.")));
            Editable = false;
        }
        

        modify("No.")
        {
            trigger OnAfterValidate()
            var
                ItemRec: record Item;
            begin
                if "Document Type" = "Document Type"::Invoice then begin
                    if itemrec.Get("No.") then
                        if Itemrec."Disable selection in invoice" <> false then
                            Error('You can not Select this item manually, Please use get receipt lines function');
                end;
            end;
        }
    }
}
