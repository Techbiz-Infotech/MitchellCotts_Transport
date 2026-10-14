page 57023 "Driver List"
{
    ApplicationArea = All;
    Caption = 'Driver';
    PageType = List;
    SourceTable = Employee;
    UsageCategory = Lists;
    InsertAllowed = false;
    ModifyAllowed = false;
    CardPageId = "Driver Card";
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    Caption = 'Driver ID';
                    ApplicationArea = All;
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
                field("Authorized To Drive";Rec."Authorized To Drive")
                {
                    ApplicationArea = All;
                }
                field("Passport No.";Rec."Passport No.")
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
                field("Company E-Mail";Rec."Company E-Mail")
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
                field("Social Security No.";Rec."Social Security No.")
                {
                    ApplicationArea = All;
                }
                field("AAR/Medical Scheme No.";Rec."AAR/Medical Scheme No.")
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
                field("Employment Date";Rec."Employment Date")
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
                field("Grounds for Term. Code";Rec."Grounds for Term. Code")
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
                field("Job Title";Rec."Job Title")
                {
                    ApplicationArea = All;
                }
                field("Contract Period (Years)"; Rec."Contract Period (Years)")
                {
                    ApplicationArea = All;
                }
                field("Termination Date";Rec."Termination Date")
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
        }
    }
}
