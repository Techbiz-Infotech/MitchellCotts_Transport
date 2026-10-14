tableextension 57026 PurchRcptHeadertExt extends "Purch. Rcpt. Header"
{
    fields
    {
        field(50100; "Job Card No."; Code[20])
        {
            Caption = 'Job Card No.';
            DataClassification = ToBeClassified;
        }
        field(50101; "CU Number"; code[50])
        {
            Caption = 'CU Number';
            DataClassification = ToBeClassified;
        }
        field(50102; "Fuel Issue No."; code[20])
        {
            Caption = 'Fuel Issue No.';
            DataClassification = ToBeClassified;
        }
    }
}
