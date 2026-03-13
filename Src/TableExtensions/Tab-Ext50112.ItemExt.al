tableextension 50112 ItemExt extends Item
{
    fields
    {
        field(50100; "Can Scrap?"; Boolean)
        {
            Caption = 'Can Scrap?';
            DataClassification = ToBeClassified;
        }
        field(50101; "Scrap Item No."; Code[20])
        {
            Caption = 'Scrap Item No.';
            DataClassification = ToBeClassified;
            TableRelation = Item;
        }
        //SH 02-21-2024
        field(50102; "Disable selection in invoice"; Boolean)
        {
            Caption = 'Disable selection in invoice';
            DataClassification = ToBeClassified;
        }
        //SH 02-21-2024
    }
}
