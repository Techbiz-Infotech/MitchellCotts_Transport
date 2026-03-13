page 50248 "Trip Type"
{
    ApplicationArea = All;
    Caption = 'Trip Type';
    PageType = List;
    SourceTable = "dimension value";
    UsageCategory = Lists;
    SourceTableView = where("Global Dimension No." = const(2));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Dimension Code"; Rec."Dimension Code")
                {
                    ToolTip = 'Specifies the value of the Dimension Code field.';
                }
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the identifier of Dimension Value.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the name of dimension value.';
                }
                field("Transport Charge No."; Rec."Transport Charge No.")
                {
                    ToolTip = 'Specifies the value of the Transport Charge No. field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ToolTip = 'Specifies the value of the No Series. field.';
                }
                field("Inspection Mandatory"; Rec."Inspection Mandatory")
                {
                    ToolTip = 'Specifies the value of the Inspection Mandatory field.';
                }
            }
        }
    }
}
