page 57085 "Model Code Card"
{
    Caption = 'Model Code';
    PageType = Card;
    SourceTable = "Model Code";
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Model Code";Rec."Model Code")
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