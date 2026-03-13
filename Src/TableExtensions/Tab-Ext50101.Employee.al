tableextension 50101 EmployeeExt extends Employee
{

    fields
    {
        field(50102; "Employee's Age"; Integer)
        {
            Caption = 'Employee Age';
            DataClassification = ToBeClassified;
        }
        field(50105; Driver; Boolean)
        {
            Caption = 'Driver';
            DataClassification = ToBeClassified;
        }
        field(50106; "Authorized To Drive"; Boolean)
        {
            Caption = 'Authorized To Drive Company Vehicle';
            DataClassification = ToBeClassified;
        }
        field(50107; "Passport No."; Code[20])
        {
            Caption = 'Passport No.';
            DataClassification = ToBeClassified;
        }
        field(50108; "Passport Expiry Date"; Date)
        {
            Caption = 'Passport Expiry Date';
            DataClassification = ToBeClassified;
        }
        field(50112; "Gross Pay"; Decimal)
        {
            Caption = 'Gross Pay';
            DataClassification = ToBeClassified;
        }
        field(50113; Grade; Text[50])
        {
            Caption = 'Grade';
            DataClassification = ToBeClassified;
        }

        field(50116; "AAR/Medical Scheme No."; Code[20])
        {
            Caption = 'AAR/Medical Scheme No.';
            DataClassification = ToBeClassified;
        }
        field(50117; "Marital Status"; Enum "Marital Status")
        {
            Caption = 'Marital Status';
            DataClassification = ToBeClassified;
        }
        field(50118; "Driver Category"; Text[50])
        {
            Caption = 'Driver Category';
            DataClassification = ToBeClassified;
        }
        field(50119; "Employment with company car"; Boolean)
        {
            Caption = 'Employment With Company Car';
            DataClassification = ToBeClassified;
        }
        field(50121; "Probation period(Months)"; Integer)
        {
            Caption = 'Probation Period(Months)';
            DataClassification = ToBeClassified;
        }
        field(50122; "Risk Assessment Due Date"; Date)
        {
            Caption = 'Risk Assessment Due Date';
            DataClassification = ToBeClassified;
        }
        field(50124; "Budget Total"; Decimal)
        {
            Caption = 'Budget Total';
            DataClassification = ToBeClassified;
        }
        field(50125; "Spend Total"; Decimal)
        {
            Caption = 'Spend Total';
            DataClassification = ToBeClassified;
        }
        field(50126; "Budget Balance"; Decimal)
        {
            Caption = 'Budget Balance';
            DataClassification = ToBeClassified;
        }
        field(50127; "Is Director"; Text[50])
        {
            Caption = 'Is Director';
            DataClassification = ToBeClassified;
        }
        field(50133; "Contract Period (Years)"; Integer)
        {
            Caption = 'Contract Period (Years)';
            DataClassification = ToBeClassified;
        }
        field(50135; "Probation End date"; Date)
        {
            Caption = 'Probation End Date';
            DataClassification = ToBeClassified;
        }
        field(50136; "Employee Contract End Date"; Date)
        {
            Caption = 'Employee Contract End Date';
            DataClassification = ToBeClassified;
        }
        field(50137; "Employment Status"; Text[50])
        {
            Caption = 'Employment Status';
            DataClassification = ToBeClassified;
        }
        field(50138; Name; Text[50])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
        }
        field(50139; "Address 1"; Text[250])
        {
            Caption = 'Address 1';
            DataClassification = ToBeClassified;
        }
        field(50140; "Emer Contact ID No."; Code[20])
        {
            Caption = 'Emer Contact ID No.';
            DataClassification = ToBeClassified;
        }
        field(50141; "Town/City"; Text[50])
        {
            Caption = 'Town/City';
            DataClassification = ToBeClassified;
        }
        field(50142; "Country"; Text[50])
        {
            Caption = 'Country';
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region";
        }
        field(50143; Phone; Text[20])
        {
            Caption = 'Phone';
            DataClassification = ToBeClassified;
        }
        field(50144; Fax; Text[50])
        {
            Caption = 'Fax';
            DataClassification = ToBeClassified;
        }
        field(50145; "Mobile Phone"; Text[20])
        {
            Caption = 'Mobile Phone';
            DataClassification = ToBeClassified;
        }
        field(50146; "Relationship type"; Text[50])
        {
            Caption = 'Relationship type';
            DataClassification = ToBeClassified;
        }

        field(50150; "Created By"; Text[50])
        {
            Caption = 'Created By';
            DataClassification = ToBeClassified;
        }
        field(50151; "Created Date"; Date)
        {
            Caption = 'Created Date';
            DataClassification = ToBeClassified;
        }
        field(50152; "Last Modified by"; Date)
        {
            Caption = 'Last Modified by';
            DataClassification = ToBeClassified;
        }
        field(50153; "Last Modified Date"; Date)
        {
            Caption = 'Last Modified Date';
            DataClassification = ToBeClassified;
        }
    }
    trigger OnAfterInsert()
    var
        DimensionValue: Record "Dimension Value";
        Dim: Record Dimension;
        GLSetup: Record "General Ledger Setup";
        DimCode: Code[20];
        DimValue: Code[20];
        DimValueName: Text[100];
    begin
        GLSetup.Get();
        DimCode := GLSetup."Shortcut Dimension 4 Code";
        DimValue := Rec."No.";
        if not DimensionValue.Get(DimCode, DimValue) then begin
            DimensionValue.Init();
            DimensionValue.Validate("Dimension Code", DimCode);
            DimensionValue.Validate(Code, DimValue);
            DimensionValue.Validate(Name, DimValue);
            DimensionValue.Insert(true);
        end;
    end;

    // trigger OnAfterModify()
    // var
    //     DimensionValue: Record "Dimension Value";
    //     Dim: Record Dimension;
    //     GLSetup: Record "General Ledger Setup";
    //     DimCode: Code[20];
    //     DimValue: Code[20];
    //     DimValueName: Text[100];
    // begin
    //     GLSetup.Get();
    //     DimCode := GLSetup."Shortcut Dimension 4 Code";
    //     DimValue := Rec."No.";
    //     DimValueName := Rec.FullName();
    //     if DimensionValue.Get(DimCode, DimValue) then begin
    //         DimensionValue.Init();
    //         DimensionValue.Validate(Name, DimValueName);
    //         DimensionValue.Modify();
    //     end;
    // end;
}
