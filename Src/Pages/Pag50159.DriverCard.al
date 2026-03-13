page 50159 "Driver Card"
{
    Caption = 'Driver';
    PageType = Card;
    SourceTable = Employee;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    Caption = 'Driver ID';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                }
                field("Employee's Age"; Rec."Employee's Age")
                {
                    ApplicationArea = All;
                }
                field("Birth Date"; Rec."Birth Date")
                {
                    ApplicationArea = All;
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = All;
                }
                field(Driver; Rec.Driver)
                {
                    ApplicationArea = All;
                }
                field("Authorized To Drive"; Rec."Authorized To Drive")
                {
                    ApplicationArea = All;
                }
                field("Passport No."; Rec."Passport No.")
                {
                    ApplicationArea = All;
                }
                field("Passport Expiry Date"; Rec."Passport Expiry Date")
                {
                    ApplicationArea = All;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                }
                field("Company E-Mail"; Rec."Company E-Mail")
                {
                    ApplicationArea = All;
                }
                field("Gross Pay"; Rec."Gross Pay")
                {
                    ApplicationArea = All;
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = All;
                }
                field("Social Security No."; Rec."Social Security No.")
                {
                    ApplicationArea = All;
                }
                field("AAR/Medical Scheme No."; Rec."AAR/Medical Scheme No.")
                {
                    ApplicationArea = All;
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ApplicationArea = All;
                }
                field("Driver Category"; Rec."Driver Category")
                {
                    ApplicationArea = All;
                }
                field("Employment with company car"; Rec."Employment with company car")
                {
                    ApplicationArea = All;
                }
                field("Employment Status"; Rec."Employment Status")
                {
                    ApplicationArea = All;
                }
                field("Employment Date"; Rec."Employment Date")
                {
                    ApplicationArea = All;
                }
                field("Probation period(Months)"; Rec."Probation period(Months)")
                {
                    ApplicationArea = All;
                }
                field("Risk Assessment Due Date"; Rec."Risk Assessment Due Date")
                {
                    ApplicationArea = All;
                }
                field("Grounds for Term. Code"; Rec."Grounds for Term. Code")
                {
                    ApplicationArea = All;
                }
                field("Budget Total"; Rec."Budget Total")
                {
                    ApplicationArea = All;
                }
                field("Spend Total"; Rec."Spend Total")
                {
                    ApplicationArea = All;
                }
                field("Budget Balance"; Rec."Budget Balance")
                {
                    ApplicationArea = All;
                }
                field("Is Director"; Rec."Is Director")
                {
                    ApplicationArea = All;
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = All;
                }
                field("Contract Period (Years)"; Rec."Contract Period (Years)")
                {
                    ApplicationArea = All;
                }
                field("Termination Date"; Rec."Termination Date")
                {
                    ApplicationArea = All;
                }
                field("Probation End date"; Rec."Probation End date")
                {
                    ApplicationArea = All;
                }
                field("Employee Contract End Date"; Rec."Employee Contract End Date")
                {
                    ApplicationArea = All;
                }

            }
            group("Emergency Details")
            {
                Caption = 'Emergency Details';
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Address 1"; Rec."Address 1")
                {
                    ApplicationArea = All;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = All;
                }
                field("Emer Contact ID No."; Rec."Emer Contact ID No.")
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
                field(Phone; Rec.Phone)
                {
                    ApplicationArea = All;
                }
                field(Fax; Rec.Fax)
                {
                    ApplicationArea = All;
                }
                field("Mobile Phone"; Rec."Mobile Phone")
                {
                    ApplicationArea = All;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = All;
                }
                field("Relationship type"; Rec."Relationship type")
                {
                    ApplicationArea = All;
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
                RunObject = page "Marked Vehicle Assets List";

            }
            action(Fuel)
            {
                Caption = 'Fuel';
                ApplicationArea = All;
                RunObject = page "Fuel Issue List";
            }
        }
        area(Processing)

        {
            action(Licence)
            {
                Caption = 'Licence';
                ApplicationArea = All;
                RunObject = page "Driver Licence List";
            }
            action("Summons and Disciplinary")
            {
                Caption = 'Summons and Disciplinary';
                ApplicationArea = All;
                RunObject = page "Fines List";
            }
            action("Duty and Care")
            {
                Caption = 'Duty and Care';
                ApplicationArea = All;
                RunObject = page "Accident List";
            }
            action(Leave)
            {
                Caption = 'Leave';
                ApplicationArea = All;
                RunObject = page "Driver Holidays List";
            }
            action("Next of Kin Details")
            {
                Caption = 'Next of Kin Details';
                ApplicationArea = All;
                RunObject = page "Next of Kin Details List";
            }
            action(Allocation)
            {
                Caption = 'Allocation';
                ApplicationArea = All;
                RunObject = page "Posted Allocation List";
                RunPageLink = "Driver ID" = field("No.");

            }
        }
    }
}

