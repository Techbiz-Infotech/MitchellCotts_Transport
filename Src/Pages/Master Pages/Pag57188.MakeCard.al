page 57188 "Make Card"
{
    Caption = 'Make';
    PageType = Card;
    SourceTable = Make;
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Make Code"; Rec."Make Code")
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