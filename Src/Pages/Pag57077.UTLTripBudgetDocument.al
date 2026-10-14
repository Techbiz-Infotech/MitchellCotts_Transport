page 57077 "UTL Trip Budget Document"
{
    Caption = 'UTL Trip Budget Document';
    PageType = Document;
    SourceTable = "UTL Trip Budget Header";
    InsertAllowed = false;


    layout
    {
        area(content)
        {
            group(General)
            {
                field("Budget Year"; rec."Budget Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Budget Year field.';
                    Editable = false;
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 5 Code field.';
                    Editable = false;
                }
                field("Budget Type"; rec."Budget Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Budget Type field.';

                }
            }
            part(UTLBudgetLine; "UTL Trip Budget Subform")
            {
                ApplicationArea = all;
                SubPageLink = "Budget Year" = field("Budget Year"), "Shortcut Dimension 5 Code" = field("Shortcut Dimension 5 Code"), "Budget Type" = field("Budget Type");
                UpdatePropagation = Both;

            }
        }
    }
}
