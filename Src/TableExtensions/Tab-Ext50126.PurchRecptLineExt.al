tableextension 50126 PurchRecptLineExt extends "Purch. Rcpt. Line"
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
            CalcFormula = lookup("Purch. Rcpt. Header"."Fuel Issue No." where("No." = field("Document No.")));
            Editable = false;
        }
    }
}
