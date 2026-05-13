page 50101 "Trip Card"
{
    Caption = 'Trip';
    PageType = Document;
    SourceTable = Trip;
    DeleteAllowed = false;
    RefreshOnActivate = true;
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Trip ID"; Rec."Trip ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Trip ID field.';
                    Editable = false;
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field("Trip Date"; Rec."Trip Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date field.';
                    ShowMandatory = true;
                    Editable = false;
                }
                field("Global Dimension 2 Code1"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type of Trip field.';
                    Visible = DimVisible1;
                    Editable = InvoicedEditable2;
                    ShowMandatory = true;
                    trigger OnValidate()
                    begin
                        ShuntingVisibility;
                        ShuntingactionVisibility;
                    end;
                }
                field("Consignment Type"; Rec."Consignment Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Consignment Type field.';
                    Editable = InvoicedEditable;
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Registration No. field.';
                    ShowMandatory = true;
                    Editable = InvoicedEditable;
                }
                field("Allocated Trailer No."; Rec."Allocated Trailer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Allocated Trailer No. field.';
                    ShowMandatory = true;
                    Editable = InvoicedEditable;
                }
                field("Vehicle Type"; Rec."Vehicle Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vehicle Type field.';
                    ShowMandatory = true;
                    Editable = InvoicedEditable;

                }
                field("Next Service Date"; Rec."Next Service Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Next Service No. field.';
                    Editable = InvoicedEditable;
                }
                field("Next Inspection Date"; Rec."Next Inspection Date")
                {
                    ApplicationArea = all;
                    ToolTip = 'Next Inspection Date';
                    Editable = InvoicedEditable;
                }
                field("Insurance Expiry Date"; Rec."Insurance Expiry Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Insurance Expiry Date field.';
                    ShowMandatory = true;
                    Editable = InvoicedEditable;
                }
                field("Transit Goods Expiry"; Rec."Transit Goods Expiry")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transit Goods Expiry field.';
                    Editable = InvoicedEditable;
                }
                field("Vehicle Fuel Type"; Rec."Vehicle Fuel Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transit Goods Expiry field.';
                    Editable = InvoicedEditable;

                }
                field("Driver ID"; Rec."Driver ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Driver No field.';
                    ShowMandatory = true;
                    Editable = InvoicedEditable;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Drive Name field.';
                    Editable = InvoicedEditable;
                }
                field("Mobile No."; Rec."Mobile No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mobile Number field.';
                    Editable = InvoicedEditable;
                }
                field("Customer No."; Rec."Client No.")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Editable = InvoicedEditable2;
                }
                field("Customer Name"; Rec."Client Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Shortcut Dimension 6 Code1"; Rec."Shortcut Dimension 6 Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'Location Code';
                    ShowMandatory = true;
                    Editable = InvoicedEditable;
                }
                field("Trip Stage"; Rec."Trip Stage")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Trip Stage field.';
                    Editable = GroupAdminEditable;
                }
                field("Trip Status"; Rec."Trip Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Trip Status field.';
                    Editable = GroupAdminEditable;
                }
                field("Invoiced"; Rec.Invoiced)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoiced field.';
                }
                group(Fuel)
                {
                    Caption = 'Fuel';
                    field("Total Fuel Expected"; Rec."Total Fuel Expected")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Total Fuel Excepted field.';
                        Editable = false;
                    }
                    field("Total Fuel Issued"; Rec."Total Fuel Issued")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Total Fuel Issued field.';
                        Editable = false;
                        DrillDownPageId = "Posted Fuel Issue List";
                    }
                    field("Balance Fuel in Vehicle"; Rec."Balance Fuel in Truck")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Balance Fuel field.';
                        Editable = false;
                    }
                    field("Shunting Fuel Balance"; Rec."Shunting Fuel Balance")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Balance Fuel field.';
                        Visible = NonShuntingactionVisible;
                    }
                    // field("Gatepass No."; Rec."Gatepass No.")
                    // {
                    //     ApplicationArea = All;
                    //     ToolTip = 'Specifies the value of the Gatepass No. field.';
                    //     Editable = false;
                    // }
                    field("Consumed Fuel In Litres"; Rec."Consumed Fuel In Litres")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Consumed Fuel In Litres field.';
                        Editable = InvoicedEditable;

                        trigger OnValidate()
                        var
                            Usersetup: Record "User Setup";
                        begin
                            Usersetup.Get(UserId);

                            if not Usersetup."Modify Fuel" then
                                Error('You do not have permission to Change');
                        end;
                    }
                    field("Alternate Trip?"; Rec."Alternate Trip?")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Alternate Trip? field.';
                        Editable = InvoicedEditable2;
                        trigger OnValidate()
                        begin
                            TerminatedVisibility();
                            CurrPage.Update();
                        end;
                    }

                    group(Terminate)
                    {
                        Caption = 'Terminate';
                        Visible = TerminatedVisible;

                        field("Alternate Trip ID"; Rec."Alternate Trip ID")
                        {
                            ApplicationArea = All;
                            ToolTip = 'Specifies the value of the Alternate Trip ID field.';
                            Editable = TerminatedVisible;
                        }
                        field("Termination Date"; Rec."Termination Date")
                        {
                            ApplicationArea = All;
                            ToolTip = 'Specifies the value of the Termination Date field.';
                            Editable = TerminatedVisible;
                        }
                        field("Fuel Return after Termination?"; Rec."Fuel Return after Termination?")
                        {
                            ApplicationArea = All;
                            ToolTip = 'Specifies the value of the Fuel Return after Termination field.';
                            Editable = TerminatedVisible;
                        }
                        field("Balance to Tranfer after Term"; Rec."Balance to Tranfer after Term")
                        {
                            ApplicationArea = All;
                            ToolTip = 'Specifies the value of the Balance to Tranfer after Termination field.';
                            Editable = TerminatedVisible;
                        }
                        field("Transfer fuel to altern Trip?"; Rec."Transfer fuel to altern Trip?")
                        {
                            ApplicationArea = All;
                            ToolTip = 'Specifies the value of the Transfer fuel to altern Trip? field.';
                            Editable = TerminatedVisible;
                        }
                    }
                }
            }
            group("Departure and Destination Details(TRIP)")
            {
                Caption = 'Departure and Destination Details(TRIP)';
                field("Departure Date"; Rec."Departure Date")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Editable = InvoicedEditable;
                    //Editable = false;
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = All;
                    StyleExpr = StyleExprTxt;
                    Editable = false;
                }
                field("Departure Odometer(Km)"; Rec."Departure Odometer(Km)")
                {
                    ApplicationArea = All;
                    Editable = InvoicedEditable2;
                }
                field("KM Travelled"; Rec."KM Travelled")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the KM Travelled';
                    Editable = InvoicedEditable2;
                }
                field("Route Code"; Rec."Route Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Route Code field.';
                    ShowMandatory = true;
                    Editable = InvoicedEditable2;
                }
                field("From(Source)"; Rec."From(Source)")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ShowMandatory = true;
                }
                field("To (Destination)"; Rec."To (Destination)")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ShowMandatory = true;
                }
                field("Route Km"; Rec."Route Km")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Standard Route Price"; Rec."Standard Route Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Standard Route Price field.';
                    ShowMandatory = true;
                }
                field("Offered Route Price"; Rec."Offered Route Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Offered Route Price field.';
                    Editable = InvoicedEditable2;
                }
                field("Route Price Deviation"; Rec."Route Price Deviation")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Route Price Deviation field.';
                    ShowMandatory = true;
                    Editable = InvoicedEditable2;
                }
                field("Include Departure Day"; Rec."Include Departure Day")
                {
                    ApplicationArea = All;
                    ToolTip = 'Mark yes if you wish to include Departure day in Calculation';
                    Editable = InvoicedEditable;
                }
                field(Delivered; Rec.Delivered)
                {
                    ApplicationArea = All;
                    ToolTip = 'Mark yes if the trip is delivered';
                    trigger OnValidate()
                    begin
                        SetFieldEditable();
                    end;
                }
                field("System Delivery Date"; Rec."System Delivery Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Delivery Date field.';
                }
                field("Actual Delivery Date"; Rec."Actual Delivery Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Delivery Date field.';
                    Editable = InvoicedEditable;
                }
                field("Delivery Odometer(Km)"; Rec."Delivery Odometer(Km)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Delivery Date field.';
                    Editable = InvoicedEditable;
                }
                field("TAT In Days"; Rec."TAT In Days")
                {
                    ApplicationArea = All;

                }

                field("Actual Trip Days"; Rec."Actual Trip Days")
                {
                    ApplicationArea = All;

                }
                field("Overdue TAT In Days"; Rec."Overdue TAT In Days")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Overdue TAT In Days field.';

                }
                field("Detention Reason"; Rec."Detention Reason")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Detention Reason field.';
                    Editable = DetentionReasonEditable;
                }
                field("Detention Days"; Rec."Detention Days")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Detention Days field.';

                }
                field("weigh Bridge Charges Appl"; Rec."weigh Bridge Charges Appl")
                {
                    ApplicationArea = All;
                    Editable = InvoicedEditable;
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        SetFieldEditable();
                    end;
                }
                field("WeighBridge charges"; Rec."WeighBridge charges")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Weig bridge field.';
                    Editable = WeighBridgeChargeseditable;
                }
                field("Trip Revenue"; Rec."Trip Revenue")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Trip Revenue field.';
                    Editable = RevenueEditable;

                }
            }
            // part(TripCharge; "Trip Charges Subform")
            // {
            //     ApplicationArea = Basic, Suite;
            //     SubPageLink = "Trip Id" = field("Trip ID");
            // }
            group("Shunting Detail")
            {
                Caption = 'Shunting Details';
                Visible = NonShuntingactionVisible;
                field("Expected No Of trips"; Rec."Expected No Of trips")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Expected No Of trips field.';
                }
                field("Registered Shunting trips"; Rec."Registered Shunting trips")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Registered Shunting Trips field.';
                }
            }
            group("Client and Cargo Details")
            {
                Caption = 'Cargo Details';
                Visible = ShuntingVisible;
                field("Container No."; Rec."Container No.")
                {
                    ApplicationArea = All;
                    Editable = InvoicedEditable2;
                }
                field("Container Type"; Rec."Container Type")
                {
                    ApplicationArea = All;
                    Editable = InvoicedEditable2;
                }
                field("Container Size"; Rec."Container Size")
                {
                    ApplicationArea = All;
                    Editable = InvoicedEditable2;
                }

                field("Goods desc"; Rec."Goods desc")
                {
                    ApplicationArea = All;
                    Editable = InvoicedEditable2;
                }
                field("Container Status"; Rec."Container Status")
                {
                    ApplicationArea = All;
                    Editable = InvoicedEditable2;
                }
                field("Seal No."; Rec."Seal No.")
                {
                    ApplicationArea = All;
                    Editable = InvoicedEditable2;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                    Editable = InvoicedEditable2;
                }
                field("Delivery Note No"; Rec."Delivery Note No")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Editable = InvoicedEditable2;
                }
                field("Interchange No"; Rec."Interchange No")
                {
                    ApplicationArea = All;
                    Editable = InvoicedEditable2;
                }

                field("Container No. 2"; Rec."Container No. 2")
                {
                    ApplicationArea = All;
                    Editable = InvoicedEditable2;
                }
                field("Container Type 2"; Rec."Container Type 2")
                {
                    ApplicationArea = All;
                    Editable = InvoicedEditable2;
                }
                field("Container Size 2"; Rec."Container Size 2")
                {
                    ApplicationArea = All;
                    Editable = InvoicedEditable2;
                }
                field("Goods description 2"; Rec."Goods description 2")
                {
                    ApplicationArea = All;
                    Editable = InvoicedEditable2;
                }
                field("Container Status 2"; Rec."Container Status 2")
                {
                    ApplicationArea = All;
                    Editable = InvoicedEditable2;
                }
                field("Seal No. 2"; Rec."Seal No. 2")
                {
                    ApplicationArea = All;
                    Editable = InvoicedEditable2;
                }
                field("Remarks 2"; Rec."Remarks 2")
                {
                    ApplicationArea = All;
                    Editable = InvoicedEditable2;
                }
                field("Booking No"; Rec."Booking No")
                {
                    ApplicationArea = All;
                    Editable = InvoicedEditable2;
                }
                field("Additional Remarks"; Rec."Additional Remarks")
                {
                    ApplicationArea = All;
                    Editable = InvoicedEditable2;
                }
            }
            group("Trip Expenses")
            {
                Caption = 'Trip Expenses';
                field("Route Drivers Allowance"; Rec."Route Drivers Allowance")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Route Drivers Allowance field.';
                    ShowMandatory = true;
                }
                field("Actual Drivers Allowance"; Rec."Actual Drivers Allowance")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Actual Drivers Allowance field.';
                    Editable = InvoicedEditable2;
                }
                field("Route Allowance Deviation"; Rec."Route Allowance Deviation")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Route Allowance Deviation field.';
                }
            }
            // group("Client Charge")
            // {
            //     Caption = 'Client Charge';



            // }
            group(Dimensions)
            {
                Caption = 'Dimensions';
                field("Global Dimension 1 Code1"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type of Trip field.';
                    Visible = DimVisible1;
                    Editable = false;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                    Visible = DimVisible2;
                    Editable = false;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                    Visible = DimVisible3;
                    Editable = false;
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.';
                    Visible = DimVisible4;
                    Editable = false;
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 5 Code field.';
                    Visible = DimVisible5;
                    Editable = false;
                }
                field("Shortcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 6 Code field.';
                    Visible = DimVisible6;
                    Editable = false;
                }
                field("Shortcut Dimension 7 Code"; Rec."Shortcut Dimension 7 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 7 Code field.';
                    Visible = DimVisible7;
                    Editable = false;
                }
                field("Shortcut Dimension 8 Code"; Rec."Shortcut Dimension 8 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 8 Code field.';
                    Visible = DimVisible8;
                    Editable = false;
                }
                field("Closure Pending Approval"; Rec."Closure Pending Approval")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 8 Code field.';
                    Visible = TIVisible;
                    //Editable = false;
                }
                field("Terminate Pending Approval"; Rec."Terminate Pending Approval")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 8 Code field.';
                    Visible = TIVisible;
                    //Editable = false;
                }

            }

        }
        area(factboxes)
        {
            part("Attached Documents"; "Doc. Attachment List Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(Database::Trip),
                              "No." = FIELD("Trip ID");
            }
        }
    }
    actions
    {
        area(Navigation)
        {

            action("Shunting Details")
            {
                Caption = 'Shunting Details';
                ApplicationArea = All;
                Image = Navigate;
                RunObject = page "Shunting Details List";
                RunPageLink = "Trip ID" = FIELD("Trip ID");
                Enabled = (Rec."Global Dimension 2 Code" = 'SHUNTING') or (Rec."Global Dimension 2 Code" = '3PL') and
                (Rec."Trip Status" = Rec."Trip Status"::Approved) or (Rec."Trip Status" = Rec."Trip Status"::Live) or
                (Rec."Trip Status" = Rec."Trip Status"::Completed) or (Rec."Trip Status" = Rec."Trip Status"::Invoiced);
                trigger OnAction()
                var
                    myInt: Integer;
                begin
                    CurrPage.Update(false);
                end;
            }
            action("Created Petty Cash Expenses")
            {
                Caption = 'Petty Cash Expenses';
                ApplicationArea = All;
                Image = Navigate;
                RunObject = page "Petty Cash Expenses List";
                RunPageLink = "Trip ID" = field("Trip ID");
                trigger OnAction()
                var
                    Pettycash: Record "Petty Cash Expenses Detail";
                begin
                    //Pettycash.TestField("Mobile Phone No.");
                end;
            }
            action("Posted Petty Cash Expenses")
            {
                Caption = 'Posted Petty Cash Expenses';
                ApplicationArea = All;
                Image = Navigate;
                RunObject = page "Posted Petty Cash ExpensesList";
                RunPageLink = "Trip ID" = field("Trip ID");
            }
            action("Created Fuel Issue")
            {
                ApplicationArea = All;
                Caption = 'Fuel Issues';
                Image = Navigate;
                RunObject = page "Fuel Issue List";
                RunPageLink = "Trip ID" = field("Trip ID");
            }


            action("Posted Fuel Issue")
            {
                ApplicationArea = All;
                Caption = 'Posted Fuel Issues';
                Image = Navigate;
                RunObject = page "Posted Fuel Issue List";
                RunPageLink = "Trip ID" = field("Trip ID");
            }
            // action("Created Inspection")
            // {
            //     ApplicationArea = All;
            //     Caption = 'Inspection';
            //     Image = Navigate;
            //     RunObject = page "Inspection List";
            //     RunPageLink = "Trip ID" = field("Trip ID");
            // }
            // action("Posted Inspection")
            // {
            //     ApplicationArea = All;
            //     Caption = 'Posted Inspection';
            //     Image = Navigate;
            //     RunObject = page "Posted Inspection List";
            //     RunPageLink = "Trip ID" = field("Trip ID");
            // }
            action("Created Gatepass")
            {
                ApplicationArea = All;
                Caption = 'Gatepass';
                Image = Navigate;
                RunObject = page "Gatepass List";
                RunPageLink = "Trip ID" = field("Trip ID");
            }
            action("Posted Gatepass")
            {
                ApplicationArea = All;
                Caption = 'Posted Gatepass';
                Image = Navigate;
                RunObject = page PostedGatepassList;
                RunPageLink = "Trip ID" = field("Trip ID");
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Send Approval Request';
                Image = SendApprovalRequest;
                trigger OnAction()
                var
                    myInt: Integer;
                begin
                    Rec.TestField("Vehicle No.");
                    Rec.TestField("Allocated Trailer No.");
                    Rec.TestField("Global Dimension 1 Code");
                    Rec.TestField("Trip Date");
                    //Rec.TestField("Vehicle Type");
                    Rec.TestField("Driver ID");
                    //Rec.TestField("Driver License Expiry");
                    //Rec.TestField("Insurance Expiry Date");
                    //Rec.TestField("Departure Date");
                    Rec.TestField("Route Code");
                    Rec.TestField("From(Source)");
                    Rec.TestField("To (Destination)");
                    Rec.TestField("Route Km");
                    //Rec.TestField("Due Date");
                    Rec.TestField("Standard Route Price");
                    //Rec.TestField("Actual Drivers Allowance");
                    //Rec.TestField("Route Drivers Allowance");
                    EventsHandler.OnSendTripforApproval(Rec);
                end;
            }
            action("Send Closure Approval Request")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Send Closure Approval Request';
                Image = SendApprovalRequest;
                trigger OnAction()
                var
                    myInt: Integer;
                begin
                    Rec.TestField("Actual Delivery Date");
                    Rec.TestField("Consumed Fuel In Litres");
                    Rec.TestField("Trip Status", Rec."Trip Status"::Live);
                    if Rec."Detention Days" > 0 then
                        if rec."Detention Reason" = Rec."Detention Reason"::" " then
                            error('Please select Detention Reason');
                    if Rec."Closure Pending Approval" <> true then begin
                        Rec."Closure Pending Approval" := true;
                        Rec.Modify();
                        Message('Trip closure request has been sent');
                    end else
                        Error('Trip already in Closure Approval');
                end;
            }
            action("Send Terminate Approval Request")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Send Terminate Approval Request';
                Image = SendApprovalRequest;
                trigger OnAction()
                var
                    myInt: Integer;
                begin
                    Rec.TestField("Actual Delivery Date");
                    Rec.TestField("Consumed Fuel In Litres");
                    Rec.TestField("Trip Status", Rec."Trip Status"::Live);
                    If rec."Terminate Pending Approval" <> true then begin
                        Rec."Terminate Pending Approval" := true;
                        Rec.Modify();
                        Message('Trip Terminate request has been sent');
                    end else
                        Error('Trip already in Termination approval');
                end;
            }
            // action("Cancel Approval Request")
            // {
            //     ApplicationArea = all;
            //     Caption = 'Cancel Approval Request';
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     PromotedIsBig = true;
            //     PromotedOnly = true;
            //     Image = CancelApprovalRequest;
            //     trigger OnAction()
            //     var
            //         myInt: Integer;
            //     begin
            //         EventsCU.OnSendChargeGroupforCancel(Rec);
            //     end;
            // }
            group(Action21)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action(Release)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    Visible = true;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Release the document to the next stage of processing. You must reopen the document before you can make changes to it.';

                    trigger OnAction()
                    var
                        UserSetup: Record "User Setup";
                    begin
                        if UserSetup.get(UserId) then begin
                            if not UserSetup."Manual Release" then begin
                                Error('You are not Authorised. Please Contact Group Audit');
                            end else begin
                                Rec."Trip Status" := Rec."Trip Status"::Approved;
                                Rec.Modify();
                            end;
                        end;
                    end;

                }
                action(Reopen)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Re&open';
                    Enabled = Rec."Trip Status" <> Rec."Trip Status"::Open;
                    Image = ReOpen;
                    ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed.';
                    trigger OnAction()
                    begin
                        if rec."Trip Status" <> Rec."Trip Status"::"Pending Approval" then begin
                            Rec."Trip Status" := Rec."Trip Status"::Open;
                            Rec.Modify();
                        end;
                    end;
                }
                // action(Test)
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'Test';
                //     //Enabled = Rec."Trip Status" <> Rec."Trip Status"::Open;
                //     Image = ReOpen;
                //     ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed.';
                //     trigger OnAction()
                //     var
                //         Item: Record Item;
                //     begin
                //         Item.Reset();
                //         if item.FindFirst() then
                //             repeat
                //                 item.Delete();
                //             until item.Next() = 0;
                //     end;
                // }
            }
            group("&Print")
            {
                Caption = '&Print';
                Image = Print;
                action(Print)
                {
                    ApplicationArea = Suite;
                    Caption = 'Print';
                    Ellipsis = true;
                    Image = PostPrint;
                    trigger OnAction()
                    var
                        Trip: Record Trip;
                    begin
                        Trip.Reset();
                        Trip.SetRange("Trip ID", Rec."Trip ID");
                        if Trip.FindFirst then
                            Report.RunModal(50101, true, false, Trip);
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Category5)
            {
                Caption = 'Release', Comment = 'Generated from the PromotedActionCategories property index 4.';
                ShowAs = Standard;

                actionref(Release_Promoted; Release)
                {
                }
                actionref(Reopen_Promoted; Reopen)
                {
                }
            }
            group(Category_Category6)
            {
                Caption = 'Fuel Issue', Comment = 'Generated from the PromotedActionCategories property index 4.';
                ShowAs = Standard;

                actionref(fuelIssues_Promoted; "Created Fuel Issue")
                {
                }
                actionref(POstedFuelIssue_promoted; "Posted Fuel Issue")
                {
                }
            }
            group(Category_Category7)
            {
                Caption = 'Petty Cash', Comment = 'Generated from the PromotedActionCategories property index 4.';
                ShowAs = Standard;
                actionref(PettyCash_promoted; "Created Petty Cash Expenses")
                {
                }
                actionref(PostedPettyCash_Promoted; "Posted Petty Cash Expenses")
                {
                }
            }
            group(Category_Category8)
            {
                Caption = 'Gatepass', Comment = 'Generated from the PromotedActionCategories property index 4.';
                ShowAs = Standard;
                actionref(Gatepass_promoted; "Created Gatepass")
                {
                }
                actionref(PostedGatepass_Promoted; "Posted Gatepass")
                {
                }
            }
            group(Category_Category9)
            {
                Caption = 'Request Approval', Comment = 'Generated from the PromotedActionCategories property index 8.';

                actionref(SendApprovalRequest_Promoted; "Send Approval Request")
                {
                }
                actionref(SendCloseApprovalRequest_Promoted; "Send Closure Approval Request")
                {
                }
                actionref(SendTerminateApprovalRequest_Promoted; "Send Terminate Approval Request")
                {
                }
                // actionref(CancelApprovalRequest_Promoted;"Cancel Approval Request")
                // {
                // }
            }
            group(Category_Category10)
            {
                Caption = 'Posting', Comment = 'Generated from the PromotedActionCategories property index 10.';


                actionref(ApproveClosureRequest_Promoted; "Deliver Trip")
                {
                }

                actionref(RejectClosureApprovalRequest_Promoted; "Reject Closure")
                {
                }
                actionref(ApproveTerminateRequest_Promoted; "Terminate Trip")
                {
                }
                actionref(RejectTerminateApprovalRequest_Promoted; "Reject Terminate")
                {
                }
            }
        }
        area(Processing)
        {
            // action("Create Inspection")
            // {
            //     ApplicationArea = All;
            //     Caption = 'Create Inspection';
            //     Image = CreateDocument;
            //     trigger OnAction()
            //     begin
            //         Rec.CreateInspection();
            //     end;
            // }
            action("Create Fuel Issue")
            {
                ApplicationArea = All;
                Caption = 'Create Fuel Issue';
                Image = CreateDocument;
                trigger OnAction()
                begin
                    Rec.createFuelissue();
                end;
            }
            action("Create Petty Cash Expenses")
            {
                Caption = 'Create Petty Cash Expenses';
                ApplicationArea = All;
                Image = CreateDocument;
                trigger OnAction()
                begin
                    Rec.Pettycashexpenses();
                end;
            }
            // action("Create Temporary Gatepass")
            // {
            //     ApplicationArea = All;
            //     Caption = 'Create Temporary Gatepass';
            //     Image = CreateDocument;
            //     trigger OnAction()
            //     begin
            //         Rec.CreateTempGatepass();
            //     end;
            // }
            action("Create Permanent Gatepass")
            {
                ApplicationArea = All;
                Caption = 'Create Permanent Gatepass';
                Image = CreateDocument;
                trigger OnAction()
                begin
                    Rec.CreatePerGatepass();
                end;
            }
            action("Deliver Trip")
            {
                ApplicationArea = All;
                Caption = 'Approve Closure';
                Image = Delivery;
                Visible = CloseActionVisible;
                trigger OnAction()
                begin
                    if confirm('This action will post Trip Fuel & Petty Cash costs to their respective prepaid expense ledgers.\This action cannot be reversed. \ Do you want to continue?', true) then begin
                        Rec.TripDeliveredClosed();
                        Rec."Closure Pending Approval" := false;
                        Rec.Modify();
                    end else
                        exit;
                end;
            }
            action("Reject Closure")
            {
                ApplicationArea = All;
                Caption = 'Reject Closure';
                Image = Reject;
                Visible = CloseActionVisible;
                trigger OnAction()
                begin
                    if confirm('This action will reject the closure Approval request. \ Do you want to continue?', true) then begin
                        Rec."Closure Pending Approval" := false;
                        Rec.Modify();
                    end else
                        exit;
                end;
            }
            action("Reject Terminate")
            {
                ApplicationArea = All;
                Caption = 'Reject Terminate';
                Image = Reject;
                Visible = TermActionVisible;
                trigger OnAction()
                begin
                    if confirm('This action will reject the Terminate Approval request. \ Do you want to continue?', true) then begin
                        Rec."Terminate Pending Approval" := false;
                        Rec.Modify();
                    end else
                        exit;
                end;
            }
            action("Copy Trip")
            {
                ApplicationArea = All;
                Caption = 'Copy Trip';
                Image = Copy;
                trigger OnAction()
                var
                    Trip: Page "Copy Trip";
                begin

                    Trip.CopyTrip(Rec);
                    Trip.RunModal();
                end;
            }
            // action("Completed editable")
            // {
            //     ApplicationArea = All;
            //     Caption = 'Completed editable';
            //     Image = Copy;
            //     trigger OnAction()
            //     var
            //         Trip: Page "Copy Trip";
            //     begin
            //         InvoicedTripEditable();
            //     end;
            //}
            action("Terminate Trip")
            {
                ApplicationArea = All;
                Caption = 'Approve Terminate';
                Image = TerminationDescription;
                Visible = TermActionVisible;
                trigger OnAction()
                begin
                    if confirm('This action will post Trip Fuel & Petty Cash costs to their respective prepaid expense ledgers.\This action cannot be reversed. \ Do you want to continue?', true) then begin
                        Rec.TripTermimated();
                        Rec."Terminate Pending Approval" := false;
                        Rec.Modify();
                    end else
                        exit;

                end;
            }
        }
    }
    trigger OnModifyRecord(): Boolean
    var
        UserSetUp: Record "User Setup";
    begin
        UserSetUp.Get(UserId);
        if Rec."Trip Status" = Rec."Trip Status"::Invoiced then begin
            if not UserSetUp."Modify Trip" then
                Error('You are not Authorized to modify this area. Please contact Group Audit');
        end
    end;

    var
        EventsHandler: Codeunit "Unigroup Workflow Events";

    trigger OnOpenPage()
    var
        UserSetUp: Record "User Setup";
    begin
        SetFieldEditable();
        SetDimensionsVisibility();
        TerminatedVisibility();
        ShuntingVisibility;
        GroupAuditEdit;
        InvoicedTripEditable;
        if UserId <> 'TI' then
            TIVisible := false
        else
            TIVisible := true;

        InvoicedTripEditable();
        CurrPage.update(false);
        // CalculateTripRevenue();
        // ShuntingactionVisibility;
        //rec.Calculatefuel;
        TotalRevenueeditable;
    end;


    trigger OnAfterGetRecord()
    var
        UserSetUp: Record "User Setup";
    begin
        SetFieldEditable();
        ShuntingVisibility;
        TerminatedVisibility();
        GroupAuditEdit;
        //rec.Calculatefuel();
        //ShuntingactionVisibility;
        InvoicedTripEditable;
        if UserId <> 'TI' then
            TIVisible := false
        else
            TIVisible := true;
        InvoicedTripEditable();
        CurrPage.Update(false);
        if Rec."Global Dimension 2 Code" = 'SHUNTING' then
            rec.CalculateTripRevenue();
        TotalRevenueeditable;
    end;

    trigger OnAfterGetCurrRecord()
    begin
        SetFieldEditable();
        GroupAuditEdit;
        TerminatedVisibility();
        //ShuntingactionVisibility;
        ShuntingVisibility();
        ActionVisibleFunction();
        //rec.Calculatefuel();
        InvoicedTripEditable();
        CurrPage.Update(false);
        TotalRevenueeditable;
    end;

    var
        DimVisible1: Boolean;
        DimVisible2: Boolean;
        DimVisible3: Boolean;
        DimVisible4: Boolean;
        DimVisible5: Boolean;
        DimVisible6: Boolean;
        DimVisible7: Boolean;
        DimVisible8: Boolean;

    local procedure SetDimensionsVisibility()
    var
        DimMgt: Codeunit DimensionManagement;
    begin
        DimVisible1 := false;
        DimVisible2 := false;
        DimVisible3 := false;
        DimVisible4 := false;
        DimVisible5 := false;
        DimVisible6 := false;
        DimVisible7 := false;
        DimVisible8 := false;

        DimMgt.UseShortcutDims(
          DimVisible1, DimVisible2, DimVisible3, DimVisible4, DimVisible5, DimVisible6, DimVisible7, DimVisible8);

        Clear(DimMgt);

    end;

    var
        TIVisible, TermActionVisible, CloseActionVisible, InvoicedEditable2, InvoicedEditable, NonShuntingactionVisible, ShuntingactionVisible, GroupAdminEditable, ShuntingVisible, TerminatedVisible, WeighBridgeChargeseditable, DetentionReasonEditable : Boolean;
        StyleExprTxt: Text;

    procedure SetFieldEditable()
    begin
        if Rec."Overdue TAT In Days" = true then
            DetentionReasonEditable := true
        else
            DetentionReasonEditable := false;

        if Rec."Weigh Bridge Charges Appl" = true then
            WeighBridgeChargeseditable := true
        else begin
            WeighBridgeChargeseditable := false;
            Rec."WeighBridge charges" := 0;
        end;
    end;

    procedure TerminatedVisibility()
    begin
        if Rec."Alternate Trip?" = true then
            TerminatedVisible := true
        else
            TerminatedVisible := false;
        CurrPage.Update(false);
    end;

    procedure ShuntingVisibility()
    begin
        if Rec."Global Dimension 2 Code" = 'SHUNTING' then begin
            ShuntingVisible := false;
            NonShuntingactionVisible := true;
        end else begin
            ShuntingVisible := true;
            NonShuntingactionVisible := false;
        end;
    end;


    procedure GroupAuditEdit()
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.Get(UserId);
        if UserSetup."Manual Release" then
            GroupAdminEditable := true
        else
            GroupAdminEditable := false;
    end;

    procedure ShuntingactionVisibility()
    var
        UserSetup: Record "User Setup";
    begin
        if (rec."Global Dimension 2 Code" = 'SHUNTING')
         and (Rec."Trip Status" = Rec."Trip Status"::Live)
         or (Rec."Trip Status" = Rec."Trip Status"::Completed) then
            ShuntingactionVisible := true
        else
            ShuntingactionVisible := false;
    end;

    procedure InvoicedTripEditable()
    var
        UserSetup: Record "User Setup";
    begin
        if (Rec."Trip Status" = Rec."Trip Status"::Invoiced) or (Rec."Trip Status" = Rec."Trip Status"::Completed) then
            InvoicedEditable := false
        else
            InvoicedEditable := true;
        if Rec.Invoiced = true then
            InvoicedEditable2 := false;
        if (Rec.Delivered = true) and (Rec.Invoiced <> true) then begin
            UserSetup.Get(UserId);
            if UserSetup."Modify Trip" then
                InvoicedEditable2 := true
            else
                InvoicedEditable2 := false;
        end else
            InvoicedEditable2 := true;
    end;

    procedure ActionVisibleFunction()
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.get(userid);
        if (UserSetup."Close Trip" <> true) or (Rec."Closure Pending Approval" <> true) then
            CloseActionVisible := false
        else
            CloseActionVisible := true;
        if (UserSetup."Terminate Trip" <> true) or (Rec."Terminate Pending Approval" <> true) then
            TermActionVisible := false
        else
            TermActionVisible := true;

    end;


    procedure TotalRevenueeditable(): Boolean
    var
    begin
        if Rec."Global Dimension 2 Code" = 'SHUNTING' then
            RevenueEditable := false
        else
            RevenueEditable := true;
    end;

    var
        RevenueEditable: Boolean;

}
