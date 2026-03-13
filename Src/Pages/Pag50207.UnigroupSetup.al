page 50207 "Unigroup Setup"
{
    ApplicationArea = All;
    Caption = 'Unigroup Setup';
    PageType = Card;
    SourceTable = "Unigroup Setup";
    UsageCategory = Tasks;
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Fuel Issue Template Name"; Rec."Fuel Consumption Template Name")
                {
                    ApplicationArea = All;
                }
                field("Fuel Issue Batch Name"; Rec."Fuel Consumption Batch Name")
                {
                    ApplicationArea = All;
                }
                field("Fuel Shortage Driver Account"; Rec."Fuel Shortage Driver Account")
                {
                    ApplicationArea = All;
                }
                field("Fuel Shortage Company Account"; Rec."Fuel Shortage Company Account")
                {
                    ApplicationArea = All;
                }
                field("Petty Cash Template Name"; Rec."Petty Cash Template Name")
                {
                    ApplicationArea = All;
                }
                field("Petty Cash Batch Name"; Rec."Petty Cash Batch Name")
                {
                    ApplicationArea = All;
                }
                field("Def. Petty Cash Payment Method"; Rec."Def. Petty Cash Payment Method")
                {
                    ApplicationArea = All;
                }
                field("Default Ext. Fuel Location"; Rec."Default Ext. Fuel Location")
                {
                    ApplicationArea = All;
                }
                field("Default Var Fuel Location"; Rec."Default Var Fuel Location")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Temp Fuel Location"; Rec."Vehicle Temp Fuel Location")
                {
                    ApplicationArea = All;
                }
                field("Default Item for Diesel"; Rec."Default Item for Diesel")
                {
                    ApplicationArea = All;
                }
                field("Default Item for Petrol"; Rec."Default Item for Petrol")
                {
                    ApplicationArea = All;
                }
                field("Prod Group for Non Trip Fuel"; Rec."Prod Group for Non Trip Fuel")
                {
                    ApplicationArea = All;
                }
                field("Prod Group for Trip Fuel"; Rec."Prod Group for Trip Fuel")
                {
                    ApplicationArea = All;
                }
                field("Prod Group Closed Trip Fuel"; Rec."Prod Group Closed Trip Fuel")
                {
                    ApplicationArea = All;
                }
                field("Trip Prepayment From"; Rec."Trip Prepayment From")
                {
                    ApplicationArea = All;
                }
                field("Trip Prepayment To"; Rec."Trip Prepayment To")
                {
                    ApplicationArea = All;
                }
                field("Default HS Code Zero rated"; Rec."Default HS Code Zero rated")
                {
                    ApplicationArea = All;
                }
                field("Default HS Code Exempted"; Rec."Default HS Code Exempted")
                {
                    ApplicationArea = All;
                }

            }
            group("Number Series")
            {
                Caption = 'Number Series';

                field("Trip ID"; Rec."Trip No.")
                {
                    ApplicationArea = All;
                }
                field("WorkShop Code"; Rec."WorkShop Code")
                {
                    ApplicationArea = All;
                }
                field("Route Code"; Rec."Route Code")
                {
                    ApplicationArea = All;
                }
                field("Trailer Code"; Rec."Trailer Code")
                {
                    ApplicationArea = All;
                }
                field("Voucher No"; Rec."Voucher No.")
                {
                    ApplicationArea = All;
                }
                field("Fuel Issue No."; Rec."Fuel Issue No.")
                {
                    ApplicationArea = All;
                }
                field("Fine No"; Rec."Fine No.")
                {
                    ApplicationArea = All;
                }
                field("Allocation No"; Rec."Allocation No.")
                {
                    ApplicationArea = All;
                }
                field("Mobility No"; Rec."Mobility No.")
                {
                    ApplicationArea = All;
                }
                field("Reallocation No"; Rec."Reallocation No.")
                {
                    ApplicationArea = All;
                }
                field("Gatepass No"; Rec."Gatepass No.")
                {
                    ApplicationArea = All;
                }
                field("Accident Details No"; Rec."Accident Details No.")
                {
                    ApplicationArea = All;
                }
                field("Injured Party No."; Rec."Injured Party No.")
                {
                    ApplicationArea = All;
                }
                field("Witness No."; Rec."Witness No.")
                {
                    ApplicationArea = All;
                }
                field("Job Card No."; Rec."Job Card No.")
                {
                    ApplicationArea = All;
                }
                field("Fitter No"; Rec."Fitter No.")
                {
                    ApplicationArea = All;
                }
                field("Fuel Card No"; Rec."Fuel Card No.")
                {
                    ApplicationArea = All;
                }
                field("Accident No."; Rec."Accident No.")
                {
                    ApplicationArea = All;
                }
                field("Inspection No."; Rec."Inspection No.")
                {
                    ApplicationArea = All;
                }
                field("Third Party No."; Rec."Third Party No.")
                {
                    ApplicationArea = All;
                }
                field("Stock Request No."; Rec."Stock Request No.")
                {
                    ApplicationArea = All;
                }
                field("Shunting Trip No."; Rec."Shunting Trip No.")
                {
                    ApplicationArea = All;
                }
                field("Stock Issue No"; Rec."Stock Issue No.")
                {
                    ApplicationArea = All;
                }
                field("Stock Return No."; Rec."Stock Return No.")
                {
                    ApplicationArea = All;
                }
            }
            group(Charges)
            {
                Caption = 'Charges';

                field("Detention Charge"; Rec."Truck Detention Charge")
                {
                    ApplicationArea = All;
                }
                field("Detention Amount Per Day"; Rec."Detention Amount Per Day")
                {
                    ApplicationArea = All;
                }
                field("Weighbridge Charge"; Rec."Weigh bridge Charge")
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
        if not UserSetup."All Setup Access" then
            CurrPage.Editable := false
        else
            CurrPage.Editable := true;
        Rec.InsertIfNotExist();
    end;

    trigger OnAfterGetRecord()
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.get(UserId);
        if not UserSetup."All Setup Access" then
            CurrPage.Editable := false
        else
            CurrPage.Editable := true;
    end;
}
