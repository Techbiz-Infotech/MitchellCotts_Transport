page 57183 "Driver Licence type card"
{
    Caption = 'Driver Licence type';
    PageType = Card;
    SourceTable = "Driver Licence type";

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
