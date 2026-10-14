page 57151 "Workdone Codes Card"
{
    Caption = 'Workdone Codes';
    PageType = Document;
    SourceTable = "Workdone Codes";
    DeleteAllowed = false;
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
                field(Tyres; Rec.Tyres)
                {
                    ApplicationArea = All;
                }

            }
        }
    }
}
