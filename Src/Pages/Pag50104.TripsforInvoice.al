page 50104 "Trips to Calculate Invoice"
{
    Caption = 'Trip List to Calculate Invoice';
    PageType = List;
    SourceTable = Trip;
    Editable = false;
    //    SourceTableTemporary = true;
    ApplicationArea = all;
    //UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ToolTip = 'Specifies the value of the Trip Type field.';
                }
                field("Trip ID"; Rec."Trip ID")
                {
                    ToolTip = 'Specifies the value of the Trip ID field.';
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ToolTip = 'Specifies the value of the Registration No. field.';
                }
                field("Allocated Trailer No."; Rec."Allocated Trailer No.")
                {
                    ToolTip = 'Specifies the value of the Allocated Trailer No. field.';
                }
                field("Trip Date"; Rec."Trip Date")
                {
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Trip Status"; Rec."Trip Status")
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Trip Stage"; Rec."Trip Stage")
                {
                    ToolTip = 'Specifies the value of the Stage field.';
                }
                field("Departure Date"; Rec."Departure Date")
                {
                    ToolTip = 'Specifies the value of the Departure Date field.';
                }
                field("Actual Delivery Date"; Rec."Actual Delivery Date")
                {
                    ToolTip = 'Specifies the value of the Delivery Date field.';
                }
                field("Route Code"; Rec."Route Code")
                {
                    ToolTip = 'Specifies the value of the Route Code field.';
                }
                field("From(Source)"; Rec."From(Source)")
                {
                    ToolTip = 'Specifies the value of the From(Source) field.';
                }
                field("To (Destination)"; Rec."To (Destination)")
                {
                    ToolTip = 'Specifies the value of the To (Destination) field.';
                }
                field("Departure Odometer(Km)"; Rec."Departure Odometer(Km)")
                {
                    ToolTip = 'Specifies the value of the Departure Odometer(Km) field.';
                }
                field("Delivery Odometer(Km)"; Rec."Delivery Odometer(Km)")
                {
                    ToolTip = 'Specifies the value of the Delviery Odometer(Km) field.';
                }
                field("Client Name"; Rec."Client Name")
                {
                    ToolTip = 'Specifies the value of the Client Name field.';
                }
                field("Route Km"; Rec."Route Km")
                {
                    ToolTip = 'Specifies the value of the Route KM field.';
                }
                field("Actual Trip Days"; Rec."Actual Trip Days")
                {
                    ToolTip = 'Specifies the value of the Actual Trip Days field.';
                }
                field("TAT In Days"; Rec."TAT In Days")
                {
                    ToolTip = 'Specifies the value of the TAT In Days field.';
                }
                field("Client No."; Rec."Client No.")
                {
                    ToolTip = 'Specifies the value of the Client No. field.';
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        t_Trip: Record Trip temporary;
        trip2, trip1 : Record Trip;
    begin
        GetSalesHeader(SalesInvoiceNo);
        // t_Trip.Reset();
        // t_Trip.DeleteAll();
        // Trip1.Reset();
        // Trip1.SetRange("Client No.", CustNo);
        // trip1.setfilter("Global Dimension 2 Code", '%1', 'SHUNTING');
        // Trip1.setrange("Route Code", SalesHead."Route Code");
        // trip1.SetRange(Invoiced, false);
        // trip1.SetFilter("Trip Status", '=%1|%2', Trip1."Trip Status"::Live, Trip1."Trip Status"::"Completed");
        // if trip1.findset() then begin
        //     repeat
        //         t_Trip.Init();
        //         t_Trip := Trip1;
        //         t_Trip.insert;
        //     until trip1.Next() = 0;
        // end;

        // trip2.Reset();
        // trip2.SetRange("Client No.", CustNo);
        // trip2.setfilter("Global Dimension 2 Code", '<>%1', 'SHUNTING');
        // Trip2.SetRange("Trip Status", Trip2."Trip Status"::"Completed");
        // trip2.SetRange(Invoiced, false);
        // if Trip2.FindSet() then begin
        //     repeat
        //         t_Trip.Init();
        //         t_Trip := Trip2;
        //         t_Trip.insert;
        //         t_Trip.Modify();
        //     until trip2.Next() = 0;
        // end;

        // //Rec.copy(t_Trip);
        // IF t_Trip.findset THEN BEGIN
        //     repeat
        //         Rec.Init();
        //         Rec := t_Trip;
        //         Rec.Insert();
        //         Rec.Modify();
        //     until t_Trip.Next() = 0;
        // END;
    end;

    trigger OnAfterGetCurrRecord()
    begin

    end;

    trigger OnAfterGetRecord()
    begin

    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        IF CloseAction in [Action::OK, Action::LookupOK] then begin

            CurrPage.SetSelectionFilter(Trip);
            if Trip.FindSet() then
                repeat
                    TempTrip := Trip;
                    TempTrip.insert;
                    TempTrip.Modify();
                until Trip.Next() = 0;
            Salesline.Reset();
            Salesline.SetRange("Document Type", Salesline."Document Type"::Invoice);
            Salesline.SetRange("Document No.", SalesInvoiceNo);
            IF Salesline.FindSet() then begin
                IF Confirm('Do you want to delete the existing lines?', true) then begin
                    Salesline.DeleteAll();
                    InvoicingTrip.Reset();
                    InvoicingTrip.SetRange("Invoice No.", Salesline."Document No.");
                    InvoicingTrip.SetRange("Invoice Line No.", Salesline."Line No.");
                    InvoicingTrip.SetFilter("Posted Invoice No.", '<>%1', '');
                    if InvoicingTrip.FindSet() then
                        repeat
                            InvoicingTrip.Delete();
                        until Invoicingtrip.next() = 0;
                end else
                    exit;
            end;
            TempTrip.reset;
            if TempTrip.FindSet() then
                repeat
                    Clear(Counter);
                    if not GuiAllowed then
                        exit;
                    Progress.Open(ProgressMsg);
                    LineNo := GetLastLineNo();
                    UnigroupSetup.Get();
                    WBCharges := 0;
                    TransportCharges := 0;
                    DetentionCharges := 0;
                    TransportCharges := GetTransportCharges(TempTrip);
                    WBCharges := GetWeighBridgeCharges(TempTrip);
                    DetentionCharges := GetDetentionCharges(TempTrip);
                    if TransportCharges <> 0 then begin
                        Salesline.Init();
                        Salesline."Document Type" := Salesline."Document Type"::Invoice;
                        Salesline."Document No." := SalesInvoiceNo;
                        Salesline."Line No." := LineNo;
                        Salesline.Validate(Type, Salesline.Type::Item);
                        Salesline.validate("No.", GetTransportNo(TempTrip."Global Dimension 2 Code"));
                        Salesline.validate(Quantity, 1);
                        //Salesline.validate("Unit Price", GetTransportCharges(TempTrip));
                        Salesline.validate("Unit Price", TransportCharges);
                        Salesline."Trip ID" := TempTrip."Trip ID";
                        Salesline.validate("Shortcut Dimension 1 Code", Temptrip."Global Dimension 1 Code");
                        Salesline.validate("Shortcut Dimension 2 Code", Temptrip."Global Dimension 2 Code");
                        Salesline.Validate("Shortcut Dimension 3 Code", TempTrip."Shortcut Dimension 3 Code");
                        Salesline.Validate("Shortcut Dimension 4 Code", TempTrip."Shortcut Dimension 4 Code");
                        Salesline.Validate("Shortcut Dimension 5 Code", TempTrip."Shortcut Dimension 5 Code");
                        Salesline.Validate("Shortcut Dimension 6 Code", TempTrip."Shortcut Dimension 6 Code");
                        Salesline.Validate("Shortcut Dimension 7 Code", TempTrip."Shortcut Dimension 7 Code");
                        Salesline.Validate("Shortcut Dimension 8 Code", TempTrip."Shortcut Dimension 8 Code");
                        Salesline.validate("Auto Calculated", true);
                        Salesline.Insert();
                    end;

                    if TempTrip."Weigh Bridge Charges Appl" then begin
                        if WBCharges <> 0 then begin
                            Salesline.Init();
                            Salesline."Document Type" := Salesline."Document Type"::Invoice;
                            Salesline."Document No." := SalesInvoiceNo;
                            Salesline."Line No." := LineNo + 10000;
                            Salesline.Validate(Type, Salesline.Type::Item);
                            Salesline.validate("No.", UnigroupSetup."Weigh bridge Charge");
                            Salesline.validate(Quantity, 1);
                            //Salesline.validate("Unit Price", GetWeighBridgeCharges(TempTrip));
                            Salesline.validate("Unit Price", WBCharges);
                            Salesline."Trip ID" := TempTrip."Trip ID";
                            Salesline.validate("Shortcut Dimension 1 Code", Temptrip."Global Dimension 1 Code");
                            Salesline.validate("Shortcut Dimension 2 Code", Temptrip."Global Dimension 2 Code");
                            Salesline.Validate("Shortcut Dimension 3 Code", TempTrip."Shortcut Dimension 3 Code");
                            Salesline.Validate("Shortcut Dimension 4 Code", TempTrip."Shortcut Dimension 4 Code");
                            Salesline.Validate("Shortcut Dimension 5 Code", TempTrip."Shortcut Dimension 5 Code");
                            Salesline.Validate("Shortcut Dimension 6 Code", TempTrip."Shortcut Dimension 6 Code");
                            Salesline.Validate("Shortcut Dimension 7 Code", TempTrip."Shortcut Dimension 7 Code");
                            Salesline.Validate("Shortcut Dimension 8 Code", TempTrip."Shortcut Dimension 8 Code");
                            Salesline.validate("Auto Calculated", true);
                            Salesline.Insert();
                        end;
                    end;
                    if TempTrip."Detention Reason" = TempTrip."Detention Reason"::Customer then begin
                        if DetentionCharges <> 0 then begin
                            Salesline.Init();
                            Salesline."Document Type" := Salesline."Document Type"::Invoice;
                            Salesline."Document No." := SalesInvoiceNo;
                            Salesline."Line No." := LineNo + 20000;
                            Salesline.Validate(Type, Salesline.Type::Item);
                            Salesline.validate("No.", UnigroupSetup."Truck Detention Charge");
                            Salesline.validate(Quantity, 1);
                            //Salesline.validate("Unit Price", GetDetentionCharges(TempTrip));
                            Salesline.validate("Unit Price", DetentionCharges);
                            Salesline."Trip ID" := TempTrip."Trip ID";
                            Salesline.validate("Shortcut Dimension 1 Code", Temptrip."Global Dimension 1 Code");
                            Salesline.validate("Shortcut Dimension 2 Code", Temptrip."Global Dimension 2 Code");
                            Salesline.Validate("Shortcut Dimension 3 Code", TempTrip."Shortcut Dimension 3 Code");
                            Salesline.Validate("Shortcut Dimension 4 Code", TempTrip."Shortcut Dimension 4 Code");
                            Salesline.Validate("Shortcut Dimension 5 Code", TempTrip."Shortcut Dimension 5 Code");
                            Salesline.Validate("Shortcut Dimension 6 Code", TempTrip."Shortcut Dimension 6 Code");
                            Salesline.Validate("Shortcut Dimension 7 Code", TempTrip."Shortcut Dimension 7 Code");
                            Salesline.Validate("Shortcut Dimension 8 Code", TempTrip."Shortcut Dimension 8 Code");
                            Salesline.validate("Auto Calculated", true);
                            Salesline.Insert();
                        end;
                    end;
                    Progress.Update(1, TempTrip."Trip ID");
                    Sleep(500);
                    CreateTripDetails(TempTrip);
                until TempTrip.Next() = 0;
            Progress.Close();
            Salesline.Reset();
            Salesline.SetRange("Document Type", Salesline."Document Type"::Invoice);
            Salesline.SetRange("Document No.", SalesInvoiceNo);
            
            if Salesline.FindSet() then begin
                if Salesline.Count <> 0 then
                    Message('Trip Charges Calculated Successfully for Customer %1', CustNo)
                else
                    Message('There is nothing to calculate');
            end;
        end;
    end;

    procedure GetLastLineNo() LineNo: Integer
    var
        SalesLine: Record "Sales Line";
    begin
        SalesLine.Reset();
        SalesLine.SetRange("Document Type", SalesLine."Document Type"::Invoice);
        SalesLine.SetRange("Document No.", SalesInvoiceNo);
        if SalesLine.FindLast() then
            LineNo := SalesLine."Line No." + 10000
        else
            LineNo := 10000;
    end;

    procedure GetSalesInvoiceNo(var NewSalesHeadNo: Code[20]; NewCustNo: Code[20])
    begin
        SalesInvoiceNo := NewSalesHeadNo;
        CustNo := NewCustNo;
    end;

    procedure GetSalesHeader(var NewSalesHeadNo: Code[20])

    begin
        SalesHead.reset;
        saleshead.setrange("Document Type", SalesHead."Document Type"::Invoice);
        SalesHead.Setrange("No.", NewSalesHeadNo);
        SalesHead.Findfirst;
    end;

    local procedure GetTransportCharges(g_Trip: Record Trip) TripCharges: Decimal;
    var
        l_Trip: Record Trip;
        l_Shunting: Record "Shunting Details";
        UnigroupSetup: Record "Unigroup Setup";
        GLSetup: Record "General Ledger Setup";
    begin
        l_Trip.Reset();
        l_Trip.SetRange("Trip ID", g_Trip."Trip ID");
        l_Trip.SetRange("Trip Status", g_Trip."Trip Status");
        l_Trip.SetRange("Global Dimension 2 Code", g_Trip."Global Dimension 2 Code");
        if l_Trip.FindFirst() then begin
            if (l_Trip."Global Dimension 2 Code" = 'SHUNTING') or (l_Trip."Global Dimension 2 Code" = '3PL') then
                TripCharges := GetShuntingCharges(l_Trip)
            else
                TripCharges := l_Trip."Offered Route Price";
        end;
    end;

    local procedure GetWeighBridgeCharges(g_Trip: Record Trip) WeighbridgeCharges: Decimal;
    var
        l_Trip: Record Trip;
    begin
        l_Trip.Reset();
        l_Trip.SetRange("Trip ID", g_Trip."Trip ID");
        l_Trip.SetRange("Trip Status", g_Trip."Trip Status");
        l_Trip.SetRange("Global Dimension 2 Code", g_Trip."Global Dimension 2 Code");
        l_Trip.SetRange("Weigh Bridge Charges Appl", true);
        if l_Trip.FindFirst() then
            WeighbridgeCharges := l_Trip."WeighBridge charges"
        else
            WeighbridgeCharges := 0;
    end;

    local procedure GetDetentionCharges(g_Trip: Record Trip) DetentionCharges: Decimal;
    var
        l_Trip: Record Trip;
        UnigroupSetup: Record "Unigroup Setup";
    begin
        l_Trip.Reset();
        l_Trip.SetRange("Trip ID", g_Trip."Trip ID");
        l_Trip.SetRange("Trip Status", g_Trip."Trip Status");
        l_Trip.SetRange("Global Dimension 2 Code", g_Trip."Global Dimension 2 Code");
        l_Trip.SetRange("Overdue TAT In Days", true);
        if l_Trip.FindFirst() then
            if l_Trip."Detention Reason" = l_Trip."Detention Reason"::Customer then begin
                UnigroupSetup.Get();
                DetentionCharges := UnigroupSetup."Detention Amount Per Day" * l_Trip."Detention Days";
            end else
                DetentionCharges := 0;
        exit(DetentionCharges);
    end;

    local procedure GetTransportNo(TripType: code[20]) Charge: Code[20];
    var
        DimensionValue: Record "Dimension Value";
        GLSetup: Record "General Ledger Setup";
    begin
        GLSetup.get();
        If DimensionValue.Get(GLSetup."Global Dimension 2 Code", TripType) then
            Charge := DimensionValue."Transport Charge No."
        else
            Error('There is no Transport Account Setup with %1 %2.\Please Contact system Administrator', GLSetup."Global Dimension 2 Code", TripType);
        exit(Charge);
    end;

    local procedure GetShuntingCharges(g_Trip: Record Trip) Charges: Decimal;
    var
        Shunting: Record "Shunting Details";
        InvoicingShunting: Record "Invoicing Shunting Trips";
    begin
        Shunting.Reset();
        Shunting.SetRange("Trip Id", g_Trip."Trip ID");
        Shunting.SetRange("Trip Completed", true);
        Shunting.SetRange("Billing Status", Shunting."Billing Status"::"Pending for invoice");
        if Shunting.FindFirst() then
            repeat
                Charges += Shunting."Container Charge";
            until Shunting.Next() = 0;
    end;

    local procedure CreateTripDetails(g_Trip: Record Trip)
    var
        TripRec: Record Trip;
        ShuntingRec: Record "Shunting Details";
        TripInvoiceRec: Record "Invoicing Shunting Trips";
        EntryNo: Integer;
    begin
        GetSalesHeader(SalesInvoiceNo);
        TripInvoiceRec.Reset();
        if TripInvoiceRec.FindLast() then
            EntryNo := TripInvoiceRec."Entry No." + 1
        else
            EntryNo := 1;
        if (g_Trip."Global Dimension 2 Code" = 'SHUNTING') or (g_Trip."Global Dimension 2 Code" = '3PL') then begin
            ShuntingRec.Reset();
            ShuntingRec.SetRange("Trip Id", g_Trip."Trip ID");
            ShuntingRec.SetRange("Billing Status", ShuntingRec."Billing Status"::"Pending for Invoice");
            if ShuntingRec.FindSet() then
                repeat
                    TripInvoiceRec.Reset();
                    if TripInvoiceRec.FindLast() then
                        EntryNo := TripInvoiceRec."Entry No." + 1
                    else
                        EntryNo := 1;
                    TripInvoiceRec.Init();
                    TripInvoiceRec."Entry No." := EntryNo + 1;
                    TripInvoiceRec."Cargo type" := ShuntingRec."Cargo type";
                    TripInvoiceRec."Container No." := ShuntingRec."Container No.";
                    TripInvoiceRec."Container Size" := ShuntingRec."Container Size";
                    TripInvoiceRec."Container Charge" := ShuntingRec."Container Charge";
                    TripInvoiceRec."Delivery Note No" := ShuntingRec."Delivery Note No";
                    TripInvoiceRec."Additional Remarks" := ShuntingRec."Additional Remarks";
                    TripInvoiceRec."Interchange No" := ShuntingRec."Interchange No";
                    TripInvoiceRec."Booking No" := ShuntingRec."Booking No";
                    TripInvoiceRec.Validate("Global Dimension 1 Code", g_Trip."Global Dimension 1 Code");
                    TripInvoiceRec.Validate("Global Dimension 2 Code", g_Trip."Global Dimension 2 Code");
                    TripInvoiceRec.Validate("Shortcut Dimension 3 Code", g_Trip."Shortcut Dimension 3 Code");
                    TripInvoiceRec.Validate("Shortcut Dimension 4 Code", g_Trip."Shortcut Dimension 4 Code");
                    TripInvoiceRec.Validate("Shortcut Dimension 5 Code", g_Trip."Shortcut Dimension 5 Code");
                    TripInvoiceRec.Validate("Shortcut Dimension 6 Code", g_Trip."Shortcut Dimension 6 Code");
                    TripInvoiceRec.Validate("Shortcut Dimension 7 Code", g_Trip."Shortcut Dimension 7 Code");
                    TripInvoiceRec.Validate("Shortcut Dimension 8 Code", g_Trip."Shortcut Dimension 8 Code");
                    TripInvoiceRec."Invoice Line No." := Salesline."Line No.";
                    TripInvoiceRec."Invoice No." := Salesline."Document No.";
                    TripInvoiceRec."Shunting Trip ID" := ShuntingRec."Shunting Trip ID";
                    TripInvoiceRec."Trip Id" := g_Trip."Trip ID";
                    TripInvoiceRec.Insert();
                until ShuntingRec.Next() = 0;
        end else begin
            TripInvoiceRec.Init();
            TripInvoiceRec."Entry No." := EntryNo;
            //TripInvoiceRec."Cargo type" := ShuntingRec."Cargo type";
            //TripInvoiceRec."Container No." := ShuntingRec."Container No.";
            //TripInvoiceRec."Container Size" := ShuntingRec."Container Size";
            TripInvoiceRec.Validate("Global Dimension 1 Code", g_Trip."Global Dimension 1 Code");
            TripInvoiceRec.Validate("Global Dimension 2 Code", g_Trip."Global Dimension 2 Code");
            TripInvoiceRec.Validate("Shortcut Dimension 3 Code", g_Trip."Shortcut Dimension 3 Code");
            TripInvoiceRec.Validate("Shortcut Dimension 4 Code", g_Trip."Shortcut Dimension 4 Code");
            TripInvoiceRec.Validate("Shortcut Dimension 5 Code", g_Trip."Shortcut Dimension 5 Code");
            TripInvoiceRec.Validate("Shortcut Dimension 6 Code", g_Trip."Shortcut Dimension 6 Code");
            TripInvoiceRec.Validate("Shortcut Dimension 7 Code", g_Trip."Shortcut Dimension 7 Code");
            TripInvoiceRec.Validate("Shortcut Dimension 8 Code", g_Trip."Shortcut Dimension 8 Code");
            TripInvoiceRec."Invoice Line No." := Salesline."Line No.";
            TripInvoiceRec."Invoice No." := SalesHead."No.";
            //TripInvoiceRec."Shunting Trip ID" := ShuntingRec."Shunting Trip ID";
            TripInvoiceRec."Trip Id" := g_Trip."Trip ID";
            TripInvoiceRec."Booking No" := g_Trip."Booking No";
            TripInvoiceRec."Additional Remarks" := g_Trip."Additional Remarks";
            TripInvoiceRec.Insert();
        end;
    end;

    var
        Trip: Record Trip;
        Shunting: Record "Shunting Details";
        UnigroupSetup: Record "Unigroup Setup";
        SalesInvoiceNo: Code[20];
        CustNo: Code[20];
        WBCharges, DetentionCharges, TransportCharges : Decimal;
        SalesHead: Record "Sales Header";
        Salesline: Record "Sales Line";
        SIPostingDate: Date;
        TempTrip: Record Trip temporary;
        LineNo: Integer;
        Progress: Dialog;
        Counter: Integer;
        InvoicingTrip: Record "Invoicing Shunting Trips";
        ProgressMsg: Label 'Calculating Trip Charges......\Trip ID: #1######################';
}
