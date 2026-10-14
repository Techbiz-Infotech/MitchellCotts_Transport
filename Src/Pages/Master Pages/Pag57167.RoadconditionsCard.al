page 57167 "Road conditions Card"
{
    Caption = 'Road conditions';
    PageType = Card;
    SourceTable = "Road conditions";

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

            }
        }
    }
}
