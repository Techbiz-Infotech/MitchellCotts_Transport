page 50129 "National Vehicle Type Card"
{
    Caption = 'National Vehicle Type';
    PageType = Card;
    SourceTable = "National Vehicle Type";
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
                field(Country; Rec.Country)
                {
                    ApplicationArea = All;
                }
                field("Fuel Tax Reclaim %"; Rec."Fuel Tax Reclaim %")
                {
                    ApplicationArea = All;
                }
                field("Misc Tax Reclaim %"; Rec."Misc Tax Reclaim %")
                {
                    ApplicationArea = All;
                }
                field(Active; Rec.Active)
                {
                    ApplicationArea = All;
                }
                field("Ddtype Id"; Rec."Ddtype Id")
                {
                    ApplicationArea = All;
                }
                field("Ddtype allias"; Rec."Ddtype allias")
                {
                    ApplicationArea = All;
                }
                field("Ddtype Name"; Rec."Ddtype Name")
                {
                    ApplicationArea = All;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                }
               
            }
        }

    }
}