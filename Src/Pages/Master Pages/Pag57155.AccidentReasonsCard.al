page 57155 "Accident Reasons Card"
{
    Caption = 'Accident Reasons';
    PageType = Card;
    SourceTable = "Accident Reasons";

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
                field("Is Road Traffic Accident"; Rec."Is Road Traffic Accident")
                {
                    ApplicationArea = All;
                }

            }
        }
    }
}
