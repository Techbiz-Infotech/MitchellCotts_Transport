table 50123 "Inspection Line"
{
    Caption = 'Inspection Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Inspection No."; Code[20])
        {
            Caption = 'Inspection No.';
            TableRelation = "Inspection Header"."Inspection No." where("Inspection No." = field("Inspection No."));
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Check List"; Text[100])
        {
            Caption = 'Check List';
        }
        field(4; "Ok or Not Ok?"; Boolean)
        {
            Caption = 'Ok or Not Ok?';
        }
        field(5; "Inspection Category"; Code[50])
        {
            Caption = 'Inspection Category';
        }
        field(6; Remarks; Text[1000])
        {
            Caption = 'Remarks';
            DataClassification = ToBeClassified;
        }
        field(8; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Inspection No.", "Line No.")
        {
            Clustered = true;
        }
    }
   
}
