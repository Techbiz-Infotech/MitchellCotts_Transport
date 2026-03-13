tableextension 50122 LocationExt extends Location
{
    fields
    {
        field(50100; "Scrap Location"; Code[20])
        {
            Caption = 'Scrap Location';
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
    }
}
