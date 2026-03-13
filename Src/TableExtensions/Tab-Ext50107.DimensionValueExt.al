tableextension 50107 DimensionValueExt extends "Dimension Value"
{
    fields
    {
        field(50100; "Transport Charge No."; Code[20])
        {
            Caption = 'Transport Charge No.';
            DataClassification = ToBeClassified;
            TableRelation = Item where(Type = const(Service));
        }
        field(50101; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50102; "Inspection Mandatory"; Boolean)
        {
            Caption = 'Inspection Mandatory';
            DataClassification = ToBeClassified;
        }
    }
}
