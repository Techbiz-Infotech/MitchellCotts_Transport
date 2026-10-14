table 57024 Driver
{
    Caption = 'Drive';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Drive List";
    LookupPageId = "Drive List";
    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Unigroupsetup: Record "Unigroup Setup";
                NoSeriesMgmt: Codeunit "No. Series";
            begin
                if Code <> xRec.Code then begin
                    Unigroupsetup.Get;
                    NoSeriesMgmt.TestManual(Unigroupsetup."Driver No");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(100; "Created By"; Code[20])
        {
            Caption = 'Created By';
            DataClassification = ToBeClassified;
        }
        field(101; "Created Date"; Date)
        {
            Caption = 'Created Date';
            DataClassification = ToBeClassified;
        }
        field(102; "Last Modified by"; Code[20])
        {
            Caption = 'Last Modified by';
            DataClassification = ToBeClassified;
        }
        field(103; "Last Modified Date"; Date)
        {
            Caption = 'Last Modified Date';
            DataClassification = ToBeClassified;
        }
        field(104; "Driver ID No"; code[50])
        {

        }
        field(105; "Port Pass No"; code[100])
        {

        }
        field(106; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
        }
        field(107; "Mobile Phone No."; code[10])
        {
            DataClassification = ToBeClassified;

        }

    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        Unigroupsetup: Record "Unigroup Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        if "Code" = '' then begin
            Unigroupsetup.Get;
            Unigroupsetup.TestField("Driver No");
            "No. Series" := Unigroupsetup."Driver No";
            if NoSeriesMgmt.AreRelated(Unigroupsetup."Driver No", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            Code := NoSeriesMgmt.GetNextNo("No. Series");

        end;
    end;
}
