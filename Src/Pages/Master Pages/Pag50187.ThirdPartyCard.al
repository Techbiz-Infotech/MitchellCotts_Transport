page 50187 "Third Party Card"
{
    Caption = 'Third Party';
    PageType = Card;
    SourceTable = "Third Party";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Third Party No."; Rec."Third Party No.")
                {
                    ApplicationArea = All;
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field("Accident ref."; Rec."Accident ref.")
                {
                    ApplicationArea = All;
                }
                field("Item No.";Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field("Accident Date"; Rec."Accident Date")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Address 1"; Rec."Address 1")
                {
                    ApplicationArea = All;
                }
                field(Telephone; Rec.Telephone)
                {
                    ApplicationArea = All;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                }
                field("Third Party Insurance Company"; Rec."Third Party Insurance Company")
                {
                    ApplicationArea = All;
                }
                field("Tp Insur Address1"; Rec."Tp Insur Address1")
                {
                    ApplicationArea = All;
                }
                field("Tp Insur Address2"; Rec."Tp Insur Address2")
                {
                    ApplicationArea = All;
                }
                field("Tp Insur Address3"; Rec."Tp Insur Address3")
                {
                    ApplicationArea = All;
                }
                field("Tp Insur Address4"; Rec."Tp Insur Address4")
                {
                    ApplicationArea = All;
                }
                field("Tp Insur Telephone"; Rec."Tp Insur Telephone")
                {
                    ApplicationArea = All;
                }
                field("Tp Policy"; Rec."Tp Policy")
                {
                    ApplicationArea = All;
                }
                field("Tp dam desc"; Rec."Tp dam desc")
                {
                    ApplicationArea = All;
                }
                field("Tp Veh"; Rec."Tp Veh")
                {
                    ApplicationArea = All;
                }
                field("Exterior Colour"; Rec."Exterior Colour")
                {
                    ApplicationArea = All;
                }
                field("Third Party Registration No."; Rec."Third Party Registration No.")
                {
                    ApplicationArea = All;
                }

            }
        }
    }
}
