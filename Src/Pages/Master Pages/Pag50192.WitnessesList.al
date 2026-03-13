page 50192 "Witnesses List"
{
    ApplicationArea = All;
    Caption = 'Witnesses';
    PageType = List;
    SourceTable = "Injured Partys";
    UsageCategory = Lists;
    CardPageId = "Witnesses Card";
    InsertAllowed = false;
    ModifyAllowed = false;
    SourceTableView = where("Injured Party Type" = filter(Witness));
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Injured Party Type"; Rec."Injured Party Type")
                {
                    ApplicationArea = All;
                    Visible = false;
                }

                field("Injured Party ID"; Rec."Injured Party ID")
                {
                    ApplicationArea = All;
                }
                field("Accident ref."; Rec."Accident ref.")
                {
                    ApplicationArea = All;
                }
                field("Accident Date"; Rec."Accident Date")
                {
                    ApplicationArea = All;
                }
                field("Witness Type"; Rec."Witness Type")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(Address1; Rec.Address1)
                {
                    ApplicationArea = All;
                }
                field(Telephone; Rec.Telephone)
                {
                    ApplicationArea = All;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                }
                field(Known; Rec.Known)
                {
                    ApplicationArea = All;
                }

            }
        }
    }
}