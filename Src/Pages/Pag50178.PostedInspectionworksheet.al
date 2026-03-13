page 50178 "Posted Inspection worksheet"
{
    ApplicationArea = All;
    Caption = 'Posted Inspection worksheet';
    PageType = Document;
    SourceTable = "Inspection Header";
    SourceTableView = where(Posted = filter(true));
    Editable = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
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
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
            }
            part(InspectionLine; "Inspection Subform")
            {
                Caption = 'Lines';
                ApplicationArea = Basic, Suite;
                SubPageLink = "Inspection No." = field("Inspection No.");
            }

        }
area(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(Database::"Inspection Header"),
                              "No." = FIELD("Inspection No.");
            }
        }
    }
}

