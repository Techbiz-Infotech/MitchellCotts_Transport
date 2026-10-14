table 57003 "Pump"
{
    Caption = 'Pump';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Pump List";
    LookupPageId = "Pump List";

    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(3; "Fuel Item No."; Code[20])
        {
            Caption = 'Fuel Item No.';
            DataClassification = ToBeClassified;
            TableRelation = Item;
        }
        field(4; "Fuel Vendor No."; Code[20])
        {
            Caption = 'Fuel Vendor No.';
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
        field(5; "Fuel Location"; Code[20])
        {
            Caption = 'Fuel Location';
            DataClassification = ToBeClassified;
            TableRelation = Location where("Use As In-Transit" = const(false));
        }
    }

    keys
    {
        key(PK1; "Code")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}