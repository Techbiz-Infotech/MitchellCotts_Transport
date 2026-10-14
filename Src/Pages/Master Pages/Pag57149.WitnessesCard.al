page 57149 "Witnesses Card"
{
    Caption = 'Witnesses';
    PageType = Card;
    SourceTable = "Injured Partys";
    SourceTableView = where("Injured Party Type" = filter(Witness));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Injured Party Type"; Rec."Injured Party Type")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Injured Party ID"; Rec."Injured Party ID")
                {
                    Caption = 'Witness No.';
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
                field("Accident Date"; Rec."Accident Date")
                {
                    ApplicationArea = All;
                }
                field("Witness Type"; Rec."Witness Type")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(Address1; Rec.Address1)
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
                field(Known; Rec.Known)
                {
                    ApplicationArea = All;
                }

            }
        }
    }
}
