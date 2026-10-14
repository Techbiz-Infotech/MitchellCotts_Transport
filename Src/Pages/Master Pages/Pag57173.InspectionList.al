page 57173 "Inspection List"
{
    ApplicationArea = All;
    Caption = 'Inspections';
    PageType = List;
    SourceTable = "Inspection Header";
    UsageCategory = Lists;
    Editable = false;
    CardPageId = "Inspection Worksheet";
    SourceTableView = where(Posted = filter(false));

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
                }
                field("Inspection Date"; Rec."Inspection Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inspection Date field.';
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vehicle No. field.';
                }
                field("Trailer No."; Rec."Trailer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Trailer No. field.';
                }
                field("Driver ID"; Rec."Driver ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Driver ID field.';
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Driver Name field.';
                }
                field(Mileage; Rec.Mileage)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mileage field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted field.';
                    Visible = false;
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
