page 57146 "Injured Partys List"
{
    ApplicationArea = All;
    Caption = 'Injured Partys';
    PageType = List;
    SourceTable = "Injured Partys";
    UsageCategory = Lists;
    CardPageId = "Injured Partys Card";
    InsertAllowed = false;
    ModifyAllowed = false;
    SourceTableView = where("Injured Party Type" = filter(Injured));
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
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(Address1; Rec.Address1)
                {
                    ApplicationArea = All;
                }
                field("Injury description"; Rec."Injury description")
                {
                    ApplicationArea = All;
                }
                field(Known; Rec.Known)
                {
                    ApplicationArea = All;
                }
                field("Injured type"; Rec."Injured type")
                {
                    ApplicationArea = All;
                }
                field("Injured extent"; Rec."Injured extent")
                {
                    ApplicationArea = All;
                }
                field("Injured age"; Rec."Injured age")
                {
                    ApplicationArea = All;
                }
                field("Hospital treatment"; Rec."Hospital treatment")
                {
                    ApplicationArea = All;
                }

            }
        }
    }
}
