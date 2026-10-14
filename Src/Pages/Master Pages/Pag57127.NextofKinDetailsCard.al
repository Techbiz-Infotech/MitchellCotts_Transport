page 57127 "Next of Kin Details Card"
{
    Caption = 'Next of Kin Details';
    PageType = Card;
    SourceTable = "Employee Relative";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                }
                field("Next Kin Address"; Rec."Next Kin Address")
                {
                    ApplicationArea = All;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                }
                field("Relative Code"; Rec."Relative Code")
                {
                    ApplicationArea = All;
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
