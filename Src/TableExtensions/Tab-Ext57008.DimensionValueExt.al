tableextension 57008 DimensionValueExt extends "Dimension Value"
{
    fields
    {
        field(60100; "Transport Charge No."; Code[20])
        {
            Caption = 'Transport Charge No.';
            DataClassification = ToBeClassified;
            TableRelation = Item where(Type = const(Service));
        }
        field(60101; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(60102; "Inspection Mandatory"; Boolean)
        {
            Caption = 'Inspection Mandatory';
            DataClassification = ToBeClassified;
        }
    }
}
