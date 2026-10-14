page 57000 "Trip list"
{
    ApplicationArea = All;
    Caption = 'Trips';
    PageType = List;
    SourceTable = Trip;
    DeleteAllowed = false;
    SourceTableView = SORTING("Trip ID") ORDER(Descending);
    CardPageId = "Trip Card";
    UsageCategory = Lists;
    RefreshOnActivate = true;
    Editable = false;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Trip Type field.';
                    StyleExpr = StyleExprTxt;
                }
                field("Trip ID"; Rec."Trip ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Trip ID field.';
                    StyleExpr = StyleExprTxt;
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Registration No. field.';
                    StyleExpr = StyleExprTxt;
                }
                field("Allocated Trailer No."; Rec."Allocated Trailer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Allocated Trailer No. field.';
                }

                field("Trip Date"; Rec."Trip Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Trip Status"; Rec."Trip Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Trip Status field.';
                    StyleExpr = StyleExprTxt;
                }
                field("Trip Stage"; Rec."Trip Stage")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Trip Stage field.';
                    StyleExpr = StyleExprTxt;
                }
                field("Invoiced"; Rec.Invoiced)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoiced field.';
                    //StyleExpr = StyleExprTxt;
                }
                field("Trip Revenue"; Rec."Trip Revenue")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Trip Revenue field.';
                    //StyleExpr = StyleExprTxt;
                }

                field("Departure Date"; Rec."Departure Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Departure Date field.';
                }
                field("From(Source)"; Rec."From(Source)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the From(Source) field.';
                }
                field("To (Destination)"; Rec."To (Destination)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the To (Destination) field.';
                }
                field("Client Name"; Rec."Client Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Client Name field.';
                }
                field("Gatepass No."; Rec."Gatepass No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Gatepass No. field.';
                }
                field("Driver ID"; Rec."Driver ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Driver No field.';
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Drive Name field.';
                }
                field("Mobile No."; Rec."Mobile No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mobile Number field.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = All;
                    StyleExpr = StyleExprTxt;
                }
                field("Route Code"; Rec."Route Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Route Code field.';
                }
                field("Posted Trip Invoices"; Rec."Posted Trip Invoices")
                {
                    ApplicationArea = all;
                }
                field("Posted Trip Credit Memos"; Rec."Posted Trip Credit Memos")
                {
                    ApplicationArea = all;
                }
                field("Expected No Of trips"; Rec."Expected No Of trips")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Expected No Of trips field.';
                }
                field("Registered Shunting trips"; Rec."Registered Shunting trips")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Registered Shunting trips field.';
                }
                field("Total Fuel Excepted"; Rec."Total Fuel Expected")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Fuel Excepted field.';
                }
                field("Total Fuel Issued"; Rec."Total Fuel Issued")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Fuel Issued field.';
                }
                field("Consumed Fuel In Litres"; Rec."Consumed Fuel In Litres")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Consumed Fuel In Litres field.';
                }

                field("Balance Fuel in Vehicle"; Rec."Balance Fuel in Truck")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shunting Balance Fuel field.';
                }
                field("Shunting Fuel Balance"; Rec."Shunting Fuel Balance")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shunting Balance Fuel field.';
                }
                field("TAT In Days"; Rec."TAT In Days")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the TAT In Days field.';
                }
                field("Overdue TAT In Days"; Rec."Overdue TAT In Days")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Overdue TAT In Days field.';
                }
                field("Actual Trip Days"; Rec."Actual Trip Days")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Overdue Actual Trip Days field.';
                }
                field("Actual Delivery Date"; Rec."Actual Delivery Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Delivery Date field.';
                }
            }
        }
    }
    var
        StyleExprTxt: Text;

    trigger OnOpenPage()
    var
        Item: Record Item;
    begin
        begin

            StyleExp();

        end;
    end;

    trigger OnAfterGetRecord()
    begin
        begin
            StyleExp();
            rec.CalculateTripRevenue;
        end;
    end;

    procedure StyleExp()
    var
        myInt: Integer;
    begin
        StyleExprTxt := '';
        if Rec."Trip Status" = Rec."Trip Status"::Live then begin
            if Rec."Due Date" <> 0D then begin
                if Rec."Due Date" < WorkDate() then
                    StyleExprTxt := 'Unfavorable';
            end;
        end;
    end;
}