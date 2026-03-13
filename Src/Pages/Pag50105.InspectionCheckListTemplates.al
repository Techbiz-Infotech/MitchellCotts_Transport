page 50105 "Inspection CheckList Templates"
{
    ApplicationArea = All;
    Caption = 'Inspection Check List Templates';
    PageType = List;
    SourceTable = "Inspection Check List Template";
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Check List"; Rec."Check List")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Check List field.';
                }
                field("Inspection Category"; Rec."Inspection Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inspection Category field.';
                }
            }
        }
    }
}
