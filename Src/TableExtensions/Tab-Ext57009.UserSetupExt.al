tableextension 57009 UserSetupExt1 extends "User Setup"
{
    fields
    {
        field(60100; "Manual Release"; Boolean)
        {
            Caption = 'Manual Release';
            DataClassification = ToBeClassified;
        }
        field(60101; "Master Access"; Boolean)
        {
            Caption = 'Master Access';
            DataClassification = ToBeClassified;
        }
        field(60102; "Modify Trip"; Boolean)
        {
            Caption = 'Modify Trip';
            DataClassification = ToBeClassified;
        }
        field(60103; "Modify Fuel"; Boolean)
        {
            Caption = 'Modify Fuel';
            DataClassification = ToBeClassified;
        }
        field(60104; "All Setup Access"; Boolean)
        {
            Caption = 'All Setup Access';
            DataClassification = ToBeClassified;
        }
        field(60105; "Item and COA Access"; Boolean)
        {
            Caption = 'Item Access';
            DataClassification = ToBeClassified;
        }
        field(60106; "COA Access"; Boolean)
        {
            Caption = 'COA Access';
            DataClassification = ToBeClassified;
        }
        field(60107; "Close Trip"; Boolean)
        {
            Caption = 'Close Trip';
            DataClassification = ToBeClassified;
        }
        field(60108; "Terminate Trip"; Boolean)
        {
            Caption = 'Terminate Trip';
            DataClassification = ToBeClassified;
        }
        field(60109; "Vehicle Edit"; Boolean)
        {
            Caption = 'Vehicle Edit';
            DataClassification = ToBeClassified;
        }
        // field(60110; "Workflow"; Boolean)
        // {
        //     Caption = 'Workflow';
        //     DataClassification = ToBeClassified;
        // }
        field(60111; "Fuel Log Edit"; Boolean)
        {
            Caption = 'Fuel Log Edit';
            DataClassification = ToBeClassified;
        }
        field(60112; "Phys. Inv Joural"; Boolean)
        {
            Caption = 'Phys. Inv Joural';
            DataClassification = ToBeClassified;
        }
    }
}