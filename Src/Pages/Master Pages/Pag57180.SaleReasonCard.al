page 57180 "Sale Reason Card"
{
    Caption = 'Sale Reason';
    PageType = Card;
    SourceTable = "Sale Reason";

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
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }

            }
        }
    }
}
