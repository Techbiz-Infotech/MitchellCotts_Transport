page 57131 "Incident Type Card"
{
    Caption = 'Incident Type';
    PageType = Card;
    SourceTable = "Incident Type";

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
