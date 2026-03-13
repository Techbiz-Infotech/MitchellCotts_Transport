page 50108 "Petty Cash Expenses List"
{
    Caption = 'Petty Cash Expenses';
    PageType = List;
    ApplicationArea = All;
    CardPageId = "Petty Cash Voucher";
    UsageCategory = Lists;
    DeleteAllowed = false;
    SourceTableView = SORTING("Voucher No.") ORDER(Descending) where(Posted = filter(false), "Petty Cash Status" = filter(Active));
    SourceTable = "Petty Cash Expenses Detail";
    Editable = false;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Voucher No."; Rec."Voucher No.")
                {
                    ApplicationArea = All;
                }
                field("Petty Cash For"; Rec."Petty Cash For")
                {
                    ApplicationArea = All;
                }
                field("Expense date"; Rec."Creation date")
                {
                    ApplicationArea = All;
                }
                field("Petty Cash Approval Status"; Rec."Petty Cash Approval Status")
                {
                    ApplicationArea = All;
                }
                field("Petty Cash Amount"; Rec."Petty Cash Amount")
                {
                    ApplicationArea = All;
                }
                field("Trip ID"; Rec."Trip ID")
                {
                    ApplicationArea = All;
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ApplicationArea = All;
                }
                field("Driver ID"; Rec."Driver ID")
                {
                    ApplicationArea = All;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = All;
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = All;
                }
                field("Transaction Reference No."; Rec."Transaction Reference No.")
                {
                    ApplicationArea = All;
                }
                field("Expense Type"; Rec."Expense Type")
                {
                    ApplicationArea = All;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = All;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = All;
                }
                field("Trip Direction"; Rec."Trip Direction")
                {
                    ApplicationArea = All;
                }
                field(From; Rec.From)
                {
                    ApplicationArea = All;
                }
                field(Destination; Rec.Destination)
                {
                    ApplicationArea = All;
                }
                field("Remarks/Comments"; Rec."Remarks/Comments")
                {
                    ApplicationArea = All;
                }
                field("Reason For Rejection"; Rec."Reason For Rejection")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}