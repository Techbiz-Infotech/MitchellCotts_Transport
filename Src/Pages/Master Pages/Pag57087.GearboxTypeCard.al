page 57087 "Gearbox Type Card"
{
    Caption = 'Gearbox Type';
    PageType = Card;
    SourceTable = "Gearbox Type";
    layout
    {
        area(content)
        {
            group(General)
            {
                field(Code; Rec.Code)
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