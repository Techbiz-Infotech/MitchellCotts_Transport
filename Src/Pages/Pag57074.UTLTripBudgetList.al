page 57074 "UTL Trip Budget List"
{
    ApplicationArea = All;
    Caption = 'UTL Trip Budgets';
    PageType = List;
    SourceTable = "UTL Trip Budget Header";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Budget Year"; rec."Budget Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Budgetyear field.';
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 5 Code field.';
                }
                field("Budget Type"; rec."Budget Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Budget Type field.';

                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(EditBudget)
            {
                ApplicationArea = all;
                Caption = 'Edit Budget';
                Image = Edit;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = page "UTL Trip Budget Document";
                RunPageLink = "Budget Year" = field("Budget Year"), "Shortcut Dimension 5 Code" = field("Shortcut Dimension 5 Code"), "Budget Type" = field("Budget Type");

            }
        }
    }
}
