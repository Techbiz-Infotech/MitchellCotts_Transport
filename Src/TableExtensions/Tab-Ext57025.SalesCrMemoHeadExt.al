tableextension 57025 SalesCrMemoHeadExt extends "Sales Cr.Memo Header"
{
    fields
    {
        field(60100; "Trip Invoice"; Boolean)
        {
            Caption = 'Trip Invoice';
            DataClassification = ToBeClassified;
        }
        field(60101; "CU Number"; Code[50])
        {
            Caption = 'CU Number';
            DataClassification = ToBeClassified;
        }
        // field(50102; "Global Dimension 2 Code"; Code[20])
        // {
        //     Caption = 'Global Dimension 2 Code';
        //     DataClassification = ToBeClassified;
        //     CaptionClass = '1,1,2';
        //     TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        // }
        field(60104; "Route Code"; Code[20])
        {
            Caption = 'Route Code';
            DataClassification = ToBeClassified;
        }
    }
}
