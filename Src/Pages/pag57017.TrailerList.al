page 57017 "Trailer List"
{
    ApplicationArea = All;
    Caption = 'Trailer';
    PageType = List;
    CardPageId = "Trailer Card";
    SourceTable = "Fixed Asset";
    SourceTableView = where("Is trailer" = const(true));
    UsageCategory = Lists;
    Editable = false;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    Caption = 'Trailer No.';
                    ApplicationArea = All;
                }
                field(Description;Rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }

    }
}