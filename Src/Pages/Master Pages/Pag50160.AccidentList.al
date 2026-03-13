page 50160 "Accident List"
{
    ApplicationArea = All;
    Caption = 'Accident';
    PageType = List;
    SourceTable = Accidents;
    UsageCategory = Lists;
    InsertAllowed = false;
    ModifyAllowed = false;
    CardPageId = "Accident Card";
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Accident No."; Rec."Accident No.")
                {
                    ApplicationArea = All;
                }
                field("Accident ref."; Rec."Accident ref.")
                {
                    ApplicationArea = All;
                }
                field("Accident Status"; Rec."Accident Status")
                {
                    ApplicationArea = All;
                }
                field("Liability Flag"; Rec."Liability Flag")
                {
                    ApplicationArea = All;
                }
                field("Party To Blame"; Rec."Party To Blame")
                {
                    ApplicationArea = All;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                }
                field("Date Accident Report For Rec"; Rec."Date Accident Report For Rec")
                {
                    ApplicationArea = All;
                }
                field("Insurance Company No."; Rec."Insurance Company No.")
                {
                    ApplicationArea = All;
                }
                field("Insurance Company"; Rec."Insurance Company")
                {
                    ApplicationArea = All;
                }
                field("Insurers Reference"; Rec."Insurers Reference")
                {
                    ApplicationArea = All;
                }
                field("Brokers Name"; Rec."Brokers Name")
                {
                    ApplicationArea = All;
                }
                field("Brokers Reference"; Rec."Brokers Reference")
                {
                    ApplicationArea = All;
                }
                field("Claim Handler"; Rec."Claim Handler")
                {
                    ApplicationArea = All;
                }
                field("Date Claim Completed"; Rec."Date Claim Completed")
                {
                    ApplicationArea = All;
                }
                field("Solicitors Name"; Rec."Solicitors Name")
                {
                    ApplicationArea = All;
                }
                field("Solicitors Reference"; Rec."Solicitors Reference")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
