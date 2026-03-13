page 50203 "Fitters Card"
{
    Caption = 'Fitters';
    PageType = Card;
    SourceTable = Fitters;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Fitter No."; Rec."Fitter No.")
                {
                    ApplicationArea = All;
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field("Fifter Name"; Rec."Fifter Name")
                {
                    ApplicationArea = All;
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = All;
                }
                field(Pin; Rec.Pin)
                {
                    ApplicationArea = All;
                }
                field(Sex; Rec.Sex)
                {
                    ApplicationArea = All;
                }
                field("Employment Status"; Rec."Employment Status")
                {
                    ApplicationArea = All;
                }
                field("Start date"; Rec."Start date")
                {
                    ApplicationArea = All;
                }
                field("Probation period (Months)"; Rec."Probation period (Months)")
                {
                    ApplicationArea = All;
                }
                field("Job title"; Rec."Job title")
                {
                    ApplicationArea = All;
                }
                field(Skills; Rec.Skills)
                {
                    ApplicationArea = All;
                }
                field("National ID Card No"; Rec."National ID Card No")
                {
                    ApplicationArea = All;
                }
                field("Date Finished"; Rec."Date Finished")
                {
                    ApplicationArea = All;
                }
                field("Probation End Date"; Rec."Probation End Date")
                {
                    ApplicationArea = All;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                }
          
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }
                field("Gross pay"; Rec."Gross pay")
                {
                    ApplicationArea = All;
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                }

            }
            group("Address Details")
            {
                Caption = 'Address Details';
                field(Address1; Rec.Address1)
                {
                    ApplicationArea = All;
                }
                field(Address2; Rec.Address2)
                {
                    ApplicationArea = All;
                }
                field("Town/City"; Rec."Town/City")
                {
                    ApplicationArea = All;
                }
                field(Country; Rec.Country)
                {
                    ApplicationArea = All;
                }
                field(Postcode; Rec.Postcode)
                {
                    ApplicationArea = All;
                }
                field(Education; Rec.Education)
                {
                    ApplicationArea = All;
                }
            }
            group("Emergency Contact")
            {
                Caption = 'Emergency Contact';
                field("Contact Person"; Rec."Contact Person")
                {
                    ApplicationArea = All;
                }
                field("Mobile No.";Rec."Mobile No.")
                {
                    ApplicationArea = All;
                }
                field("Contact Person Relatinship"; Rec."Contact Person Relatinship")
                {
                    ApplicationArea = All;
                }
                group("Labour Rule")
                {
                    Caption = 'Labour Rule';
                    field("Rate 1"; Rec."Rate 1")
                    {
                        ApplicationArea = All;
                    }
                    field("Rate 2"; Rec."Rate 2")
                    {
                        ApplicationArea = All;
                    }
                    field("Rate 3"; Rec."Rate 3")
                    {
                        ApplicationArea = All;
                    }
                    field("Rate 4"; Rec."Rate 4")
                    {
                        ApplicationArea = All;
                    }
                    field("Rate 5"; Rec."Rate 5")
                    {
                        ApplicationArea = All;
                    }
                    field("Rate 6"; Rec."Rate 6")
                    {
                        ApplicationArea = All;
                    }
                    field("Created By"; Rec."Created By")
                    {
                        ApplicationArea = All;
                    }


                }
            }
        }
    }
    actions
    {
        area(Navigation)
        {
            action(Assets)
            {
                Caption = 'Assets';
                ApplicationArea = All;
                RunObject = page "Allocation List";

            }
        }
    }
}
