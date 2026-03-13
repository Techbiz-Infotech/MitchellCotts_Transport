tableextension 50114 ItemJnlLineExt extends "Item Journal Line"
{
    fields
    {
        field(50100; "Trip ID"; Code[20])
        {
            Caption = 'Trip ID';
            DataClassification = ToBeClassified;
        }
        field(50101; "Phys.Inv Pending Approval"; Boolean)
        {
            Caption = 'Phys.Inv Pending Approval';
            DataClassification = ToBeClassified;
        }
        field(50102; "Phys. Inv. Status"; Enum "Phys. Inv. Status")
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
        }
        field(50103; "Approval Status Inv"; Enum "Approval Status Inv")
        {
            Caption = 'Approval Request';
            DataClassification = ToBeClassified;
        }
        field(50104; "Closing phys. Inv Journal"; Boolean)
        {
            Caption = 'Closing phys. Inv Journal';
            DataClassification = ToBeClassified;
        }
        field(50105; "Phys. Inv Journal for Approval"; Boolean)
        {
            Caption = 'Phys. Inv Journal for Approval';
            DataClassification = ToBeClassified;
        }
        field(50106; "Reject phys. Inv Journal"; Boolean)
        {
            Caption = 'Reject phys. Inv Journal';
            DataClassification = ToBeClassified;
        }



    }
    // trigger OnModify()
    // begin
    //     if ("Phys. Inv. Status" = "Phys. Inv. Status"::Released) and not (xRec."Phys. Inv. Status" = "Phys. Inv. Status"::Released) then
    //         Error('You cannot modify a released Physical Inventory Journal line.');
    // end;

    // trigger OnDelete()
    // begin
    //     if "Phys. Inv. Status" = "Phys. Inv. Status"::Released then
    //         Error('You cannot delete a released Physical Inventory Journal line.');
    // end;
}
