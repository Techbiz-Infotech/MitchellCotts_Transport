page 50173 "Drive Card"
{
    Caption = 'Drive';
    PageType = Card;
    SourceTable = Drives;

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
