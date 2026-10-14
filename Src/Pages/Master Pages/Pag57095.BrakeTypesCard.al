page 57095 "Brake Type Card"
{
    Caption = 'Brake Type';
    PageType = Card;
    SourceTable = "Brake Types";
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