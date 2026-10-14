page 57069 "Expired Pettycash Expenses"
{
    ApplicationArea = All;
    Caption = 'Expired Pettycash Expenses';
    PageType = List;
    SourceTable = "Petty Cash Expenses Detail";
    SourceTableView = SORTING("Voucher No.") ORDER(Descending) where("Petty Cash Status" = filter(InActive));
    UsageCategory = History;
    Editable = false;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Voucher No."; Rec."Voucher No.")
                {
                    ToolTip = 'Specifies the value of the Voucher No. field.';
                }
                field("Petty Cash For"; Rec."Petty Cash For")
                {
                    ToolTip = 'Specifies the value of the Petty Cash For field.';
                }
                field("Creation date"; Rec."Creation date")
                {
                    ToolTip = 'Specifies the value of the Creation Date field.';
                }
                field("Petty Cash Amount"; Rec."Petty Cash Amount")
                {
                    ToolTip = 'Specifies the value of the Petty Cash Amount field.';
                }
                field("Trip ID"; Rec."Trip ID")
                {
                    ToolTip = 'Specifies the value of the Trip ID field.';
                }
                field("Driver ID"; Rec."Driver ID")
                {
                    ToolTip = 'Specifies the value of the Driver ID field.';
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ToolTip = 'Specifies the value of the Mobile Phone No. field.';
                }
                field("Expense Type"; Rec."Expense Type")
                {
                    ToolTip = 'Specifies the value of the Expense Type field.';
                }
                field(From; Rec.From)
                {
                    ToolTip = 'Specifies the value of the From field.';
                }
                field(Destination; Rec.Destination)
                {
                    ToolTip = 'Specifies the value of the Destination field.';
                }
                field("Remarks/Comments"; Rec."Remarks/Comments")
                {
                    ToolTip = 'Specifies the value of the Remarks/Comments field.';
                }
                field("Reason For Rejection"; Rec."Reason For Rejection")
                {
                    ToolTip = 'Specifies the value of the Reason For Rejection field.';
                }
                field("Petty Cash Approval Status"; Rec."Petty Cash Approval Status")
                {
                    ToolTip = 'Specifies the value of the Petty Cash Approval Status field.';
                }
                field("Expired Date"; Rec."Expired Date")
                {
                    ToolTip = 'Specifies the value of the Expired Date field.';
                }
                field("Expired Time"; Rec."Expired Time")
                {
                    ToolTip = 'Specifies the value of the Expired Time field.';
                }
            }
        }
    }
}
