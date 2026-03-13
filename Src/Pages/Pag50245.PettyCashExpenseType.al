page 50245 "Petty Cash Expense Type"
{
    ApplicationArea = All;
    Caption = 'Petty Cash Expense Type';
    PageType = List;
    SourceTable = "Petty Cash Expense Type";
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Petty Cash Expense Code"; Rec."Petty Cash Expense Code")
                {
                    ToolTip = 'Specifies the value of the Petty Cash Expense Code field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Petty Cash Prepayment Account"; Rec."Petty Cash Prepayment Account")
                {
                    ToolTip = 'Specifies the value of the Petty Cash Prepayment Account field.';
                }
                field("Petty Cash Expense Account"; Rec."Petty Cash Expense Account")
                {
                    ToolTip = 'Specifies the value of the Petty Cash Expense Account field.';
                }
            }
        }
    }
}
