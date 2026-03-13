page 50231 "Manufacturer List"
{
    ApplicationArea = All;
    Caption = 'Manufacturers';
    PageType = List;
    SourceTable = Manufacturer;
    UsageCategory = Lists;
    CardPageId = "Manufacturer Card";
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code you want to use for the manufacturer.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the manufacturer.';
                }
              
              
                field(Active; Rec.Active)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Active field.';
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Changed Date"; Rec."Changed Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Changed Date field.';
                }
                field("Changed By"; Rec."Changed By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Changed By field.';
                }
            }
        }
    }
}
