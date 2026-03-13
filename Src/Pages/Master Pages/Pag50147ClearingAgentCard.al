page 50147 "Clearing Agent Card"
{
    Caption = 'Clearing Agent';
    PageType = Card;
    SourceTable = "Clearing Agent";
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Clearing Agent Code"; Rec."Clearing Agent Code")
                {
                    ApplicationArea = All;
                }
                field("Clearing Agent Name"; Rec."Clearing Agent Name")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}