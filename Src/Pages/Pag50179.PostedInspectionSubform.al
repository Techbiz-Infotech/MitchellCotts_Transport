page 50179 "Posted Inspection Subform"
{
    Caption = 'Posted Inspection Subform';
    PageType = ListPart;
    SourceTable = "Inspection Line";
    SourceTableView = where(Posted = filter(true));
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Inspection No."; Rec."Inspection No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inspection No. field.';
                    Visible = false;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line No. field.';
                    Visible = false;
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
                field("Ok or Not Ok?"; Rec."Ok or Not Ok?")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ok or Not Ok? field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
            }
        }
    }
}

