tableextension 50103 Manufacturers extends Manufacturer
{
    fields
    {
        field(50102; Active; Boolean)
        {
            Caption = 'Active';
            DataClassification = ToBeClassified;
        }
        field(50103; "Date"; Date)
        {
            Caption = 'Date';
            DataClassification = ToBeClassified;
        }   
        field(50104; "Created By"; Text[50])
        {
            Caption = 'Created By';
            DataClassification = ToBeClassified;
        }
        field(50105; "Changed Date"; Date)
        {
            Caption = 'Changed Date';
            DataClassification = ToBeClassified;
        }
        field(50106; "Changed By"; Text[50])
        {
            Caption = 'Changed By';
            DataClassification = ToBeClassified;
        }
    }
}
