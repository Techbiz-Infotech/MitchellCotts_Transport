page 57014 "Transport Request Lines"
{
    AutoSplitKey = false;
    ApplicationArea = All;
    Caption = 'Request For Transport Lines';
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Transport Request Lines";

    layout
    {
        area(Content)
        {
            repeater(General)
            {

                field("Cargo Type  "; Rec."Cargo Type  ")
                {
                    ToolTip = 'Specifies the value of the Cargo Type field.', Comment = '%';
                }
                field("Container No"; Rec."Container No")
                {
                    ToolTip = 'Specifies the value of the Container No field.', Comment = '%';

                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }

                field("Truck No"; Rec."Truck No")
                {

                }
                field("Transit Entry"; Rec."Transit Entry")
                {

                }
                field(Size; Rec.Size)
                {

                }
                field(Weight; Rec.Weight)
                {

                }
                // field("Free Days"; Rec."Free Days")
                // {
                //     ToolTip = 'Specifies the value of the Free Days field.', Comment = '%';
                // }
                // field("Validity Date"; Rec."Validity Date")
                // {
                //     ToolTip = 'Specifies the value of the Validity Date field.', Comment = '%';
                //     visible = false;
                // }
                // field("Expiry Date"; Rec."Expiry Date")
                // {

                // }


            }
        }
    }
}
