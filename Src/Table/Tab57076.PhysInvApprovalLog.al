table 57076 "Phys. Inv. Approval Log"
{
    Caption = 'Phys. Inv. Approval Log';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Journal Template Name"; Code[10])
        {
            Caption = 'Journal Template Name';
            DataClassification = ToBeClassified;
        }
        field(3; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
            DataClassification = ToBeClassified;
        }
        field(4; "Approval Status"; Enum "Approval Status Inv")
        {
            Caption = 'Approval Status';
            DataClassification = ToBeClassified;
        }
        field(5; "Requested By"; Code[100])
        {
            Caption = 'Requested By';
            DataClassification = ToBeClassified;
        }
        field(6; "Approved By"; Code[100])
        {
            Caption = 'Approved By';
            DataClassification = ToBeClassified;
        }
        field(7; "Approval DateTime"; DateTime)
        {
            Caption = 'Approval DateTime';
            DataClassification = ToBeClassified;
        }
        field(8; "Document No."; Code[50])
        {
            Caption = 'Document No.';
            DataClassification = ToBeClassified;
        }

    }
    keys
    {
        key(PK; "Journal Template Name")
        {
            Clustered = true;
        }
    }
    // procedure GetNextEntryNo(): Integer
    // var
    //     LastEntry: Record "Phys. Inv. Approval Log";
    // begin
    //     if LastEntry.FindLast() then
    //         exit(LastEntry."Entry No." + 1)
    //     else
    //         exit(1);
    // end;
}
