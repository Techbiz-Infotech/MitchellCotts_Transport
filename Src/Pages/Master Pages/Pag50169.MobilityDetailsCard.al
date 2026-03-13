page 50169 "Mobility Details Card"
{
    Caption = 'Mobility Details';
    PageType = Card;
    SourceTable = "Mobility Details";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Mobility No."; Rec."Mobility No.")
                {
                    ApplicationArea = All;
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field("Driver ID"; Rec."Driver ID")
                {
                    ApplicationArea = All;
                }

                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = All;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                }
                field("Budget Total"; Rec."Budget Total")
                {
                    ApplicationArea = All;
                }
                field("Spend Total"; Rec."Spend Total")
                {
                    ApplicationArea = All;
                }
                field("Budget Balance"; Rec."Budget Balance")
                {
                    ApplicationArea = All;
                }

            }
        }
    }
}
