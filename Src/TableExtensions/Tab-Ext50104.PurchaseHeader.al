tableextension 50104 PurchaseHeaderExt extends "Purchase Header"
{
    fields
    {
        field(50100; "Job Card No."; Code[20])
        {
            Caption = 'Job Card No.';
            DataClassification = ToBeClassified;
        }
        field(50101; "CU Number"; code[50])
        {
            Caption = 'CU Number';
            DataClassification = ToBeClassified;
        }
        field(50102; "Fuel Issue No."; code[20])
        {
            Caption = 'Fuel Issue No.';
            DataClassification = ToBeClassified;
        }
        field(50103; "Quantity Ordered"; Decimal)
        {
            Caption = 'Quantity Ordered';
            //DataClassification = ToBeClassified;
            FieldClass = FlowField;
            //CalcFormula=sum("Fuel Issue"."Net Requirement In Litres" where("Trip ID" = field("Trip ID"), Posted = const(true)));
            CalcFormula = sum("Purchase Line".Quantity where("Document No."=field("No.")));
        }
        field(50104; "Quantity Received"; Decimal)
        {
            Caption = 'Quantity Received';
            //DataClassification = ToBeClassified;
            FieldClass = FlowField;
            CalcFormula = sum("Purchase Line"."Quantity Received" where("Document No." = field("No.")));
        }
        field(50105; "Quantity Invoiced"; Decimal)
        {
            Caption = 'Quantity Invoiced';
            //DataClassification = ToBeClassified;
            FieldClass = FlowField;
            CalcFormula = sum("Purchase Line"."Quantity Invoiced" where("Document No." = field("No.")));
        }
        field(50106; "Quantity Not Invoiced"; Boolean)
        {
            Caption = 'Quantity Not Invoiced';
            DataClassification = ToBeClassified;
        }
        field(50107; "Completely Invoiced"; Boolean)
        {
            Caption = 'Completely invoiced';
            DataClassification = ToBeClassified;
        }

    }
}
