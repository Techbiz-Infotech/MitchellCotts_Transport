table 57071 "Transport Request Lines"
{
 
    Caption = 'Request For Transport Lines';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Line No"; Integer)
        {
            AutoIncrement = True;
        }
        field(9; " RFT No"; Code[50])
        {
            Caption = ' RFT No';
        }
        field(2; "Shipping Line"; Code[50])
        {
            Caption = 'Shipping Line';
        }
        field(3; "Container No"; Code[50])
        {
            Caption = 'Container No';
            NotBlank = true;
        }
        field(4; "Free Days"; Integer)
        {
            Caption = 'Free Days';
        }
        field(5; "Validity Date"; Date)
        {
            Caption = 'Validity Date';
          
            trigger OnValidate()
            begin
                rec.TestField("Free Days");
                if rec."Validity Date" <> 0D then "Expiry Date" := CalcDate(Format("Free Days") + 'D', rec."Validity Date");
            end;
        }
        field(6; "Cargo Type  "; enum "cargo Type")
        {

        }
        field(7; Description; Text[50])
        {
            Caption = 'Description';
        }

        field(10; "Expiry Date"; Date)
        {
            trigger OnValidate()
            begin
                rec.TestField("Free Days");
                if rec."Expiry Date" <> 0D then "Validity Date" := CalcDate('-' + Format("Free Days") + 'D', rec."Expiry Date");

            end;
        }
        field(11; Allocated; Boolean)
        {

        }
        field(12; "Truck No"; code[50])
        {
            NotBlank = true;
            TableRelation = "Fixed Asset"."No.";
           trigger OnValidate()
           begin
            
           end;
        }
        field(13; "Size"; Enum "Container Size")
        {

        }
        field(14; "Weight"; decimal)
        {

        }
        field(15; "Transit Entry"; code[50])
        {

        }

    }
    keys
    {
        key(PK; "Line No", " RFT No", "Truck No", "Container No")
        {
            Clustered = true;
        }

    }
}
