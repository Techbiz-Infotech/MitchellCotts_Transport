page 57172 "Vehicle Colours Card"
{
    Caption = 'Vehicle Colours';
    PageType = Card;
    SourceTable = "Vehicle Colours";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Interior/Exterior"; Rec."Interior/Exterior")
                {
                    ApplicationArea = All;
                }

            }
        }
    }
}
