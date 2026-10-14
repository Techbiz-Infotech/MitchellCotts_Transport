page 57015 "Vehicle List"
{
    Caption = 'Vehicles';
    ApplicationArea = All;
    PageType = List;
    UsageCategory = Lists;
    //CardPageId = "Vehicle Card";
    DeleteAllowed = false;
    SourceTable = "Fixed Asset";
    SourceTableView = where("Is Trailer" = const(false));
    Editable = false;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    Caption = 'Vehicle No.';
                    ApplicationArea = All;
                }
                field("Balance Fuel"; Rec."Balance Fuel")
                {
                    ApplicationArea = All;
                }
                field("Trailer No."; Rec."Trailer No.")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Trailer List";
                    LookupPageId = "Trailer List";
                }
                field("Driver ID"; Rec."Driver ID")
                {
                    ApplicationArea = All;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = All;
                }
                field("Next Inspection Date"; Rec."Next Inspection Date")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Next Service Date"; Rec."Next Service Date")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Date Registered"; Rec."Date Registered")
                {
                    ApplicationArea = All;
                }
                field(Country; Rec.Country)
                {
                    ApplicationArea = All;
                }
                field("Make Code"; Rec."Make Code")
                {
                    ApplicationArea = All;
                }
                field("Model Code"; Rec."Model Code")
                {
                    ApplicationArea = All;
                }
                field(Station; Rec.Station)
                {
                    ApplicationArea = All;
                }
                field("Vehicle used for"; Rec."Vehicle used for")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Type"; Rec."Vehicle Type")
                {
                    ApplicationArea = All;
                }
                field("Body Type"; Rec."Body Type")
                {
                    ApplicationArea = All;
                }
                field("Fuel Type"; Rec."Fuel Type")
                {
                    ApplicationArea = All;
                }

                field("Manf.Year"; Rec."Manf.Year")
                {
                    ApplicationArea = All;
                }
                field("Booking location code"; Rec."Booking location code")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.get(UserId);
        if not UserSetup."Vehicle Edit" then
            CurrPage.Editable := false
        else
            CurrPage.Editable := true;
    end;

    trigger OnAfterGetRecord()
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.get(UserId);
        if not UserSetup."Vehicle Edit" then
            CurrPage.Editable := false
        else
            CurrPage.Editable := true;
    end;
}


