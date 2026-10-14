page 57126 "Next of Kin Details List"
{
    ApplicationArea = All;
    Caption = 'Next of Kin Details';
    PageType = List;
    SourceTable = "Employee Relative";
    UsageCategory = Lists;
    CardPageId = "Next of Kin Details Card";
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("First Name";Rec."First Name")
                {
                    ApplicationArea = All;
                }
                field("Next Kin Address"; Rec."Next Kin Address")
                {
                    ApplicationArea = All;
                }
                field("Phone No.";Rec."Phone No.")
                {
                    ApplicationArea = All;
                }
                field("Relative Code";Rec."Relative Code")
                {
                    ApplicationArea = All;
                }
                field(Comment;Rec.Comment)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
