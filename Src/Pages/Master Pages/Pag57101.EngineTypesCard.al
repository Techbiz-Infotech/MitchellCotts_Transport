page 57101 "Engine Types Card"
{
    Caption = 'Engine Types';
    PageType = Card;
    SourceTable = "Engine Types";
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(Code; Rec."Code")
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
