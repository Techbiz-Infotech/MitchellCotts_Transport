page 50243 "Posted Petty Cash ExpensesList"
{
    ApplicationArea = All;
    Caption = 'Posted Petty Cash Expenses';
    PageType = List;
    SourceTable = "Petty Cash Expenses Detail";
    UsageCategory = Lists;
    Editable = false;
    CardPageId = "Posted Petty Cash Card";
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    SourceTableView = where(Posted = filter(true));
    layout
    {
        area(content)
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
                field("Transaction Reference No."; Rec."Transaction Reference No.")
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
                field("Account Type"; Rec."Account Type")
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
                field("Petty Cash Reversed"; Rec."Petty Cash Reversed")
                {
                    ApplicationArea = All;
                }
                field("Petty Cash Return No."; Rec."Petty Cash Return No.")
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
                field("Expense Type"; Rec."Expense Type")
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
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';

                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';

                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';

                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.';

                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 5 Code field.';

                }
                field("Shortcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 6 Code field.';

                }
                field("Shortcut Dimension 7 Code"; Rec."Shortcut Dimension 7 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 7 Code field.';

                }
                field("Shortcut Dimension 8 Code"; Rec."Shortcut Dimension 8 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 8 Code field.';
                }
            }
        }
    }
}
