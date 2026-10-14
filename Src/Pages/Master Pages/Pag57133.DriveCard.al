page 57133 "Drive Card"
{
    Caption = 'Drive';
    PageType = Card;
    SourceTable = Driver;

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
                field("Port Pass No"; Rec."Port Pass No")
                {
                    ApplicationArea = All;

                }
                field("Driver ID No"; Rec."Driver ID No")
                {
                    ApplicationArea = All;

                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = All;

                }


            }
        }
    }
}
