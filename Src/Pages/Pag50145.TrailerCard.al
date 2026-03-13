page 50145 "Trailer Card"
{
    Caption = 'Trailer Card';
    SourceTable = "Fixed Asset";
    SourceTableView = where("Is trailer" = const(true));
    PageType = Card;
    DeleteAllowed = false;
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    Caption = 'Trailer No.';
                    ApplicationArea = All;
                    Editable = false;
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field(Description;Rec.Description)
                {
                    ApplicationArea = All;
                }

            }
        }
    }
    
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Is trailer" := true;
    end;
}



