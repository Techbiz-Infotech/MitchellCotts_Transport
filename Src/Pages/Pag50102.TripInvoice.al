page 50102 "Trip Invoice"
{
    Caption = 'Trip Invoice';
    PageType = Document;
    RefreshOnActivate = true;
    DeleteAllowed = false;
    SourceTable = "Sales Header";
    SourceTableView = WHERE("Document Type" = FILTER(Invoice));

    AboutTitle = 'About sales invoice details';
    AboutText = 'You can update and add to the sales invoice until you post it. If you leave the invoice without posting, you can return to it later from the list of ongoing invoices.';

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Importance = Standard;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    Visible = DocNoVisible;

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customer No.';
                    Importance = Additional;
                    NotBlank = true;
                    ToolTip = 'Specifies the number of the customer who will receive the products and be billed by default.';

                    trigger OnValidate()
                    begin
                        IsSalesLinesEditable := Rec.SalesLinesEditable();
                        Rec.SelltoCustomerNoOnAfterValidate(Rec, xRec);
                        CurrPage.Update();
                    end;
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customer Name';
                    Importance = Promoted;
                    NotBlank = true;
                    ShowMandatory = true;
                    AboutTitle = 'Who you are selling to';
                    AboutText = 'This can be an existing customer, or you can register a new from here. Customers can have special prices and discounts that are automatically used when you enter the sales lines.?';
                    ToolTip = 'Specifies the name of the customer who will receive the products and be billed by default.';

                    trigger OnValidate()
                    begin
                        Rec.SelltoCustomerNoOnAfterValidate(Rec, xRec);
                        CurrPage.Update();
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        exit(Rec.LookupSellToCustomerName(Text));
                    end;
                }
                field("VAT Registration No."; Rec."VAT Registration No.")
                {
                    ApplicationArea = VAT;
                    Editable = false;
                    Importance = Additional;
                    ToolTip = 'Specifies the customer''s VAT registration number for customers.';
                    Visible = false;
                }
                field("Posting Description"; Rec."Posting Description")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies additional posting information for the document. After you post the document, the description can add detail to vendor and customer ledger entries.';
                    Visible = false;
                }
                group("Sell-to")
                {
                    Caption = 'Sell-to';
                    field("Sell-to Address"; Rec."Sell-to Address")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Address';
                        Importance = Additional;
                        QuickEntry = false;
                        ToolTip = 'Specifies the address where the customer is located.';
                    }
                    field("Sell-to Address 2"; Rec."Sell-to Address 2")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Address 2';
                        Importance = Additional;
                        QuickEntry = false;
                        ToolTip = 'Specifies additional address information.';
                    }
                    field("Sell-to City"; Rec."Sell-to City")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'City';
                        Importance = Additional;
                        QuickEntry = false;
                        ToolTip = 'Specifies the city of the customer on the sales document.';
                    }
                    group(Control60)
                    {
                        ShowCaption = false;
                        Visible = IsSellToCountyVisible;
                        field("Sell-to County"; Rec."Sell-to County")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'County';
                            Importance = Additional;
                            QuickEntry = false;
                            ToolTip = 'Specifies the state, province or county of the address.';
                        }
                    }
                    field("Sell-to Post Code"; Rec."Sell-to Post Code")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Post Code';
                        Importance = Additional;
                        QuickEntry = false;
                        ToolTip = 'Specifies the postal code.';
                    }
                    field("Sell-to Country/Region Code"; Rec."Sell-to Country/Region Code")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Country/Region Code';
                        Importance = Additional;
                        QuickEntry = false;
                        ToolTip = 'Specifies the country or region of the address.';

                        trigger OnValidate()
                        begin
                            IsSellToCountyVisible := FormatAddress.UseCounty(Rec."Sell-to Country/Region Code");
                        end;
                    }
                    field("Sell-to Contact No."; Rec."Sell-to Contact No.")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Contact No.';
                        Importance = Additional;
                        ToolTip = 'Specifies the number of the contact person that the sales document will be sent to.';

                        trigger OnLookup(var Text: Text): Boolean
                        begin
                            if not Rec.SelltoContactLookup() then
                                exit(false);
                            Text := Rec."Sell-to Contact No.";
                            CurrPage.Update();
                            exit(true);
                        end;

                        trigger OnValidate()
                        begin
                            if ApplicationAreaMgmtFacade.IsAdvancedEnabled() then
                                if Rec.GetFilter("Sell-to Contact No.") = xRec."Sell-to Contact No." then
                                    if Rec."Sell-to Contact No." <> xRec."Sell-to Contact No." then
                                        Rec.SetRange("Sell-to Contact No.");
                            if Rec."Sell-to Contact No." <> xRec."Sell-to Contact No." then
                                CurrPage.Update();
                        end;
                    }
                    field(SellToPhoneNo; SellToContact."Phone No.")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Phone No.';
                        Importance = Additional;
                        Editable = false;
                        ExtendedDatatype = PhoneNo;
                        ToolTip = 'Specifies the telephone number of the contact person that the sales document will be sent to.';
                    }
                    field(SellToMobilePhoneNo; SellToContact."Mobile Phone No.")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Mobile Phone No.';
                        Importance = Additional;
                        Editable = false;
                        ExtendedDatatype = PhoneNo;
                        ToolTip = 'Specifies the mobile telephone number of the contact person that the sales document will be sent to.';
                    }
                    field(SellToEmail; SellToContact."E-Mail")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Email';
                        Importance = Additional;
                        Editable = false;
                        ExtendedDatatype = EMail;
                        ToolTip = 'Specifies the email address of the contact person that the sales document will be sent to.';
                    }
                }
                field("Sell-to Contact"; Rec."Sell-to Contact")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Contact';
                    Editable = Rec."Sell-to Customer No." <> '';
                    ToolTip = 'Specifies the name of the person to contact at the customer.';
                }
                field("Your Reference"; Rec."Your Reference")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies the customer''s reference. The contents will be printed on sales documents.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies the date when the related document was created.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                    ToolTip = 'Specifies the date when the posting of the sales document will be recorded.';

                    trigger OnValidate()
                    begin
                        SaveInvoiceDiscountAmount();
                    end;
                }
                // field("VAT Reporting Date"; Rec."VAT Reporting Date")
                // {
                //     ApplicationArea = VAT;
                //     Importance = Promoted;
                //     Editable = VATDateEnabled;
                //     Visible = VATDateEnabled;
                //     ToolTip = 'Specifies the date used to include entries on VAT reports in a VAT period. This is either the date that the document was created or posted, depending on your setting on the General Ledger Setup page.';
                // }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                    ToolTip = 'Specifies when the sales invoice must be paid.';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ShowMandatory = ExternalDocNoMandatory;
                    ToolTip = 'Specifies a document number that refers to the customer''s or vendor''s numbering system.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = all;
                    Importance = Additional;
                    ShowMandatory = true;
                    ToolTip = 'Specifies a Trip type';
                }
                field("Route Code"; Rec."Route Code")
                {
                    ApplicationArea = all;
                    Importance = Additional;
                    ShowMandatory = true;
                    ToolTip = 'Specifies a Route Code';
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ApplicationArea = Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies the name of the salesperson who is assigned to the customer.';

                    trigger OnValidate()
                    begin
                        SalespersonCodeOnAfterValidate();
                    end;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Suite;
                    Importance = Promoted;
                    StyleExpr = StatusStyleTxt;
                    AboutTitle = 'Check the invoice status here';
                    AboutText = 'You can only edit an open invoice. When status is Released, it means the invoice is up for next stage in processing, such as reserving the products being sold. Use Reopen if you must edit a released invoice.';
                    ToolTip = 'Specifies whether the document is open, waiting to be approved, has been invoiced for prepayment, or has been released to the next stage of processing.';
                }
                group("Work Description")
                {
                    Caption = 'Work Description';
                    field(WorkDescription; WorkDescription)
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Additional;
                        MultiLine = true;
                        ShowCaption = false;
                        ToolTip = 'Specifies the products or service being offered';

                        trigger OnValidate()
                        begin
                            Rec.SetWorkDescription(WorkDescription);
                        end;
                    }
                }
            }
            part(TripLines; "Trip Invoice Subform")
            {
                ApplicationArea = Basic, Suite;
                Editable = IsSalesLinesEditable;
                Enabled = IsSalesLinesEditable;
                SubPageLink = "Document No." = FIELD("No.");
                UpdatePropagation = Both;
            }
            part(TripInvLines; InvoicingShuntingTrips)
            {
                ApplicationArea = Basic, Suite;
                Editable = IsSalesLinesEditable;
                Enabled = IsSalesLinesEditable;
                SubPageLink = "Invoice No." = FIELD("No.");
                UpdatePropagation = Both;
            }
            group("Invoice Details")
            {
                Caption = 'Invoice Details';
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Suite;
                    Importance = Promoted;
                    ToolTip = 'Specifies the currency of amounts on the sales document.';

                    trigger OnAssistEdit()
                    begin
                        Clear(ChangeExchangeRate);
                        if Rec."Posting Date" <> 0D then
                            ChangeExchangeRate.SetParameter(Rec."Currency Code", Rec."Currency Factor", Rec."Posting Date")
                        else
                            ChangeExchangeRate.SetParameter(Rec."Currency Code", Rec."Currency Factor", WorkDate());
                        if ChangeExchangeRate.RunModal() = ACTION::OK then begin
                            Rec.Validate("Currency Factor", ChangeExchangeRate.GetParameter());
                            SaveInvoiceDiscountAmount();
                        end;
                        Clear(ChangeExchangeRate);
                    end;

                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
                }

                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the VAT specification of the involved customer or vendor to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.';

                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
                }
                field("Customer Posting Group"; Rec."Customer Posting Group")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = IsPostingGroupEditable;
                    Importance = Additional;
                    ToolTip = 'Specifies the customer''s market type to link business transactions to.';
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                    ToolTip = 'Specifies a formula that calculates the payment due date, payment discount date, and payment discount amount.';
                }
                field("Payment Method Code"; Rec."Payment Method Code")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies how to make payment, such as with bank transfer, cash, or check.';
                    Visible = IsPaymentMethodCodeVisible;

                    trigger OnValidate()
                    begin
                        UpdatePaymentService();
                    end;
                }
                group(Control174)
                {
                    ShowCaption = false;
                    Visible = PaymentServiceVisible;
                    field(SelectedPayments; Rec.GetSelectedPaymentServicesText())
                    {
                        ApplicationArea = All;
                        Caption = 'Payment Service';
                        Editable = false;
                        Enabled = PaymentServiceEnabled;
                        MultiLine = true;
                        ToolTip = 'Specifies the online payment service, such as PayPal, that customers can use to pay the sales document.';

                        trigger OnAssistEdit()
                        begin
                            Rec.ChangePaymentServiceSetting();
                        end;
                    }
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';

                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.';

                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
                }
                field("Journal Templ. Name"; Rec."Journal Templ. Name")
                {
                    ApplicationArea = BasicBE;
                    ToolTip = 'Specifies the name of the journal template in which the sales header is to be posted.';
                    Visible = IsJournalTemplNameVisible;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Location;
                    Importance = Additional;
                    ToolTip = 'Specifies the location from where inventory items to the customer on the sales document are to be shipped by default.';
                }
            }
            // group("Shipping and Billing")
            // {
            //     Caption = 'Shipping and Billing';
            //     Enabled = Rec."Sell-to Customer No." <> '';
            //     group(Control34)
            //     {
            //         ShowCaption = false;
            //         group(Control200)
            //         {
            //             ShowCaption = false;
            //             field(ShippingOptions; ShipToOptions)
            //             {
            //                 ApplicationArea = Basic, Suite;
            //                 Caption = 'Ship-to';
            //                 ToolTip = 'Specifies the address that the products on the sales document are shipped to. Default (Sell-to Address): The same as the customer''s sell-to address. Alternate Ship-to Address: One of the customer''s alternate ship-to addresses. Custom Address: Any ship-to address that you specify in the fields below.';

            //                 trigger OnValidate()
            //                 var
            //                     ShipToAddress: Record "Ship-to Address";
            //                     ShipToAddressList: Page "Ship-to Address List";
            //                     IsHandled: Boolean;
            //                 begin
            //                     IsHandled := false;
            //                     if not IsHandled then
            //                         case ShipToOptions of
            //                             ShipToOptions::"Default (Sell-to Address)":
            //                                 begin
            //                                     Rec.Validate("Ship-to Code", '');
            //                                     Rec.CopySellToAddressToShipToAddress();
            //                                 end;
            //                             ShipToOptions::"Alternate Shipping Address":
            //                                 begin
            //                                     ShipToAddress.SetRange("Customer No.", Rec."Sell-to Customer No.");
            //                                     ShipToAddressList.LookupMode := true;
            //                                     ShipToAddressList.SetTableView(ShipToAddress);

            //                                     if ShipToAddressList.RunModal() = ACTION::LookupOK then begin
            //                                         ShipToAddressList.GetRecord(ShipToAddress);
            //                                         Rec.Validate("Ship-to Code", ShipToAddress.Code);
            //                                         IsShipToCountyVisible := FormatAddress.UseCounty(ShipToAddress."Country/Region Code");
            //                                     end else
            //                                         ShipToOptions := ShipToOptions::"Custom Address";
            //                                 end;
            //                             ShipToOptions::"Custom Address":
            //                                 begin
            //                                     Rec.Validate("Ship-to Code", '');
            //                                     IsShipToCountyVisible := FormatAddress.UseCounty(Rec."Ship-to Country/Region Code");
            //                                 end;
            //                         end;
            //                 end;
            //             }
            //             group(Control202)
            //             {
            //                 ShowCaption = false;
            //                 Visible = NOT (ShipToOptions = ShipToOptions::"Default (Sell-to Address)");
            //                 field("Ship-to Code"; Rec."Ship-to Code")
            //                 {
            //                     ApplicationArea = Basic, Suite;
            //                     Caption = 'Code';
            //                     Editable = ShipToOptions = ShipToOptions::"Alternate Shipping Address";
            //                     Importance = Promoted;
            //                     ToolTip = 'Specifies the code for another shipment address than the customer''s own address, which is entered by default.';

            //                     trigger OnValidate()
            //                     var
            //                         ShipToAddress: Record "Ship-to Address";
            //                     begin
            //                         if (xRec."Ship-to Code" <> '') and (Rec."Ship-to Code" = '') then
            //                             Error(EmptyShipToCodeErr);
            //                         if Rec."Ship-to Code" <> '' then begin
            //                             ShipToAddress.Get(Rec."Sell-to Customer No.", Rec."Ship-to Code");
            //                             IsShipToCountyVisible := FormatAddress.UseCounty(ShipToAddress."Country/Region Code");
            //                         end else
            //                             IsShipToCountyVisible := false;
            //                     end;
            //                 }
            //                 field("Ship-to Name"; Rec."Ship-to Name")
            //                 {
            //                     ApplicationArea = Basic, Suite;
            //                     Caption = 'Name';
            //                     Editable = ShipToOptions = ShipToOptions::"Custom Address";
            //                     ToolTip = 'Specifies the name that products on the sales document will be shipped to.';
            //                 }
            //                 field("Ship-to Address"; Rec."Ship-to Address")
            //                 {
            //                     ApplicationArea = Basic, Suite;
            //                     Caption = 'Address';
            //                     Editable = ShipToOptions = ShipToOptions::"Custom Address";
            //                     QuickEntry = false;
            //                     ToolTip = 'Specifies the address that products on the sales document will be shipped to.';
            //                 }
            //                 field("Ship-to Address 2"; Rec."Ship-to Address 2")
            //                 {
            //                     ApplicationArea = Basic, Suite;
            //                     Caption = 'Address 2';
            //                     Editable = ShipToOptions = ShipToOptions::"Custom Address";
            //                     QuickEntry = false;
            //                     ToolTip = 'Specifies additional address information.';
            //                 }
            //                 field("Ship-to City"; Rec."Ship-to City")
            //                 {
            //                     ApplicationArea = Basic, Suite;
            //                     Caption = 'City';
            //                     Editable = ShipToOptions = ShipToOptions::"Custom Address";
            //                     QuickEntry = false;
            //                     ToolTip = 'Specifies the city of the customer on the sales document.';
            //                 }
            //                 group(Control82)
            //                 {
            //                     ShowCaption = false;
            //                     Visible = IsShipToCountyVisible;
            //                     field("Ship-to County"; Rec."Ship-to County")
            //                     {
            //                         ApplicationArea = Basic, Suite;
            //                         Caption = 'County';
            //                         Editable = ShipToOptions = ShipToOptions::"Custom Address";
            //                         QuickEntry = false;
            //                         ToolTip = 'Specifies the state, province or county of the address.';
            //                     }
            //                 }
            //                 field("Ship-to Post Code"; Rec."Ship-to Post Code")
            //                 {
            //                     ApplicationArea = Basic, Suite;
            //                     Caption = 'Post Code';
            //                     Editable = ShipToOptions = ShipToOptions::"Custom Address";
            //                     QuickEntry = false;
            //                     ToolTip = 'Specifies the postal code.';
            //                 }
            //                 field("Ship-to Country/Region Code"; Rec."Ship-to Country/Region Code")
            //                 {
            //                     ApplicationArea = Basic, Suite;
            //                     Caption = 'Country/Region';
            //                     Editable = ShipToOptions = ShipToOptions::"Custom Address";
            //                     Importance = Additional;
            //                     QuickEntry = false;
            //                     ToolTip = 'Specifies the customer''s country/region.';

            //                     trigger OnValidate()
            //                     begin
            //                         IsShipToCountyVisible := FormatAddress.UseCounty(Rec."Ship-to Country/Region Code");
            //                     end;
            //                 }
            //             }
            //             field("Ship-to Contact"; Rec."Ship-to Contact")
            //             {
            //                 ApplicationArea = Basic, Suite;
            //                 Caption = 'Contact';
            //                 ToolTip = 'Specifies the name of the contact person at the address that products on the sales document will be shipped to.';
            //             }
            //         }
            //         group("Shipment Method")
            //         {
            //             Caption = 'Shipment Method';
            //             field("Shipment Method Code"; Rec."Shipment Method Code")
            //             {
            //                 ApplicationArea = Basic, Suite;
            //                 Caption = 'Code';
            //                 Importance = Additional;
            //                 ToolTip = 'Specifies how items on the sales document are shipped to the customer.';
            //             }
            //             field("Shipping Agent Code"; Rec."Shipping Agent Code")
            //             {
            //                 ApplicationArea = Suite;
            //                 Caption = 'Agent';
            //                 Importance = Additional;
            //                 ToolTip = 'Specifies which shipping agent is used to transport the items on the sales document to the customer.';
            //             }
            //             field("Shipping Agent Service Code"; Rec."Shipping Agent Service Code")
            //             {
            //                 ApplicationArea = Suite;
            //                 Caption = 'Agent service';
            //                 Importance = Additional;
            //                 ToolTip = 'Specifies which shipping agent service is used to transport the items on the sales document to the customer.';
            //             }
            //             field("Package Tracking No."; Rec."Package Tracking No.")
            //             {
            //                 ApplicationArea = Suite;
            //                 Importance = Additional;
            //                 ToolTip = 'Specifies the shipping agent''s package number.';
            //             }
            //         }
            //     }
            //     group(Control203)
            //     {
            //         ShowCaption = false;
            //         field(BillToOptions; BillToOptions)
            //         {
            //             ApplicationArea = Basic, Suite;
            //             Caption = 'Bill-to';
            //             ToolTip = 'Specifies the customer that the sales invoice will be sent to. Default (Customer): The same as the customer on the sales invoice. Another Customer: Any customer that you specify in the fields below.';

            //             trigger OnValidate()
            //             begin
            //                 if BillToOptions = BillToOptions::"Default (Customer)" then begin
            //                     Rec.Validate("Bill-to Customer No.", Rec."Sell-to Customer No.");
            //                     Rec.RecallModifyAddressNotification(Rec.GetModifyBillToCustomerAddressNotificationId());
            //                 end;

            //                 Rec.CopySellToAddressToBillToAddress();
            //             end;
            //         }
            //         group(Control205)
            //         {
            //             ShowCaption = false;
            //             Visible = NOT (BillToOptions = BillToOptions::"Default (Customer)");
            //             field("Bill-to Name"; Rec."Bill-to Name")
            //             {
            //                 ApplicationArea = Basic, Suite;
            //                 Caption = 'Name';
            //                 Editable = BillToOptions = BillToOptions::"Another Customer";
            //                 Enabled = BillToOptions = BillToOptions::"Another Customer";
            //                 Importance = Promoted;
            //                 NotBlank = true;
            //                 ToolTip = 'Specifies the customer to whom you will send the sales invoice, when different from the customer that you are selling to.';

            //                 trigger OnValidate()
            //                 begin
            //                     if Rec.GetFilter("Bill-to Customer No.") = xRec."Bill-to Customer No." then
            //                         if Rec."Bill-to Customer No." <> xRec."Bill-to Customer No." then
            //                             Rec.SetRange("Bill-to Customer No.");

            //                     CurrPage.Update();
            //                 end;
            //             }
            //             field("Bill-to Address"; Rec."Bill-to Address")
            //             {
            //                 ApplicationArea = Basic, Suite;
            //                 Caption = 'Address';
            //                 Editable = false;
            //                 Enabled = false;
            //                 Importance = Additional;
            //                 QuickEntry = false;
            //                 ToolTip = 'Specifies the address of the customer that you will send the invoice to.';
            //             }
            //             field("Bill-to Address 2"; Rec."Bill-to Address 2")
            //             {
            //                 ApplicationArea = Basic, Suite;
            //                 Caption = 'Address 2';
            //                 Editable = false;
            //                 Enabled = false;
            //                 Importance = Additional;
            //                 QuickEntry = false;
            //                 ToolTip = 'Specifies additional address information.';
            //             }
            //             field("Bill-to City"; Rec."Bill-to City")
            //             {
            //                 ApplicationArea = Basic, Suite;
            //                 Caption = 'City';
            //                 Editable = false;
            //                 Enabled = false;
            //                 Importance = Additional;
            //                 QuickEntry = false;
            //                 ToolTip = 'Specifies the city of the customer on the sales document.';
            //             }
            //             group(Control85)
            //             {
            //                 ShowCaption = false;
            //                 Visible = IsBillToCountyVisible;
            //                 field("Bill-to County"; Rec."Bill-to County")
            //                 {
            //                     ApplicationArea = Basic, Suite;
            //                     Caption = 'County';
            //                     Editable = false;
            //                     Enabled = false;
            //                     Importance = Additional;
            //                     QuickEntry = false;
            //                     ToolTip = 'Specifies the state, province or county of the address.';
            //                 }
            //             }
            //             field("Bill-to Post Code"; Rec."Bill-to Post Code")
            //             {
            //                 ApplicationArea = Basic, Suite;
            //                 Caption = 'Post Code';
            //                 Editable = false;
            //                 Enabled = false;
            //                 Importance = Additional;
            //                 QuickEntry = false;
            //                 ToolTip = 'Specifies the postal code.';
            //             }
            //             field("Bill-to Country/Region Code"; Rec."Bill-to Country/Region Code")
            //             {
            //                 ApplicationArea = Basic, Suite;
            //                 Caption = 'Country/Region';
            //                 Editable = false;
            //                 Enabled = false;
            //                 Importance = Additional;
            //                 QuickEntry = false;
            //                 ToolTip = 'Specifies the country or region of the address.';

            //                 trigger OnValidate()
            //                 begin
            //                     IsBillToCountyVisible := FormatAddress.UseCounty(Rec."Bill-to Country/Region Code");
            //                 end;
            //             }
            //             field("Bill-to Contact No."; Rec."Bill-to Contact No.")
            //             {
            //                 ApplicationArea = Basic, Suite;
            //                 Caption = 'Contact No.';
            //                 Editable = false;
            //                 Enabled = false;
            //                 Importance = Additional;
            //                 ToolTip = 'Specifies the number of the contact the invoice will be sent to.';
            //             }
            //             field("Bill-to Contact"; Rec."Bill-to Contact")
            //             {
            //                 ApplicationArea = Basic, Suite;
            //                 Caption = 'Contact';
            //                 Editable = false;
            //                 Enabled = false;
            //                 ToolTip = 'Specifies the name of the person you should contact at the customer you are sending the invoice to.';
            //             }
            //             field(BillToContactPhoneNo; BillToContact."Phone No.")
            //             {
            //                 ApplicationArea = Basic, Suite;
            //                 Caption = 'Phone No.';
            //                 Editable = false;
            //                 Importance = Additional;
            //                 ExtendedDatatype = PhoneNo;
            //                 ToolTip = 'Specifies the telephone number of the person you should contact at the customer you are sending the invoice to.';
            //             }
            //             field(BillToContactMobilePhoneNo; BillToContact."Mobile Phone No.")
            //             {
            //                 ApplicationArea = Basic, Suite;
            //                 Caption = 'Mobile Phone No.';
            //                 Editable = false;
            //                 Importance = Additional;
            //                 ExtendedDatatype = PhoneNo;
            //                 ToolTip = 'Specifies the mobile telephone number of the person you should contact at the customer you are sending the invoice to.';
            //             }
            //             field(BillToContactEmail; BillToContact."E-Mail")
            //             {
            //                 ApplicationArea = Basic, Suite;
            //                 Caption = 'Email';
            //                 Editable = false;
            //                 Importance = Additional;
            //                 ExtendedDatatype = EMail;
            //                 ToolTip = 'Specifies the email address of the person you should contact at the customer you are sending the invoice to.';
            //             }
            //         }
            //     }
            // }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Doc. Attachment List Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(Database::"Sales Header"),
                              "No." = FIELD("No."),
                              "Document Type" = FIELD("Document Type");
            }

            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Invoice")
            {
                Caption = '&Invoice';
                Image = Invoice;
                action(Statistics)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Statistics';
                    Enabled = xRec."No." <> '';
                    Image = Statistics;
                    ShortCutKey = 'F7';
                    ToolTip = 'View statistical information, such as the value of posted entries, for the record.';

                    trigger OnAction()
                    var
                        Handled: Boolean;
                    begin
                        Handled := false;
                        if Handled then
                            exit;

                        Rec.OpenDocumentStatistics();
                        CurrPage.TripLines.Page.ForceTotalsCalculation();
                    end;
                }
                action("Co&mments")
                {
                    ApplicationArea = Comments;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Sales Comment Sheet";
                    RunPageLink = "Document Type" = FIELD("Document Type"),
                                  "No." = FIELD("No."),
                                  "Document Line No." = CONST(0);
                    ToolTip = 'View or add comments for the record.';
                }
                action(Approvals)
                {
                    AccessByPermission = TableData "Approval Entry" = R;
                    ApplicationArea = Suite;
                    Caption = 'Approvals';
                    Image = Approvals;
                    ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.OpenApprovalsSales(Rec);
                    end;
                }
                action(Function_CustomerCard)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customer';
                    Enabled = IsCustomerOrContactNotEmpty;
                    Image = Customer;
                    RunObject = Page "Customer Card";
                    RunPageLink = "No." = FIELD("Sell-to Customer No."),
                                  "Date Filter" = FIELD("Date Filter");
                    ShortCutKey = 'Shift+F7';
                    ToolTip = 'View or edit detailed information about the customer on the sales document.';
                }
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension = R;
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Enabled = Rec."No." <> '';
                    Image = Dimensions;
                    ShortCutKey = 'Alt+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim();
                        CurrPage.SaveRecord();
                    end;
                }
            }
        }
        area(processing)
        {
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = All;
                    Caption = 'Approve';
                    Image = Approve;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(xRec.RecordId);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = All;
                    Caption = 'Reject';
                    Image = Reject;
                    ToolTip = 'Reject the approval request.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(xRec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = All;
                    Caption = 'Delegate';
                    Image = Delegate;
                    ToolTip = 'Delegate the approval to a substitute approver.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(xRec.RecordId);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = All;
                    Caption = 'Comments';
                    Image = ViewComments;
                    ToolTip = 'View or add comments for the record.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
            }
            group(Action9)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action(Release)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&lease';
                    Enabled = IsCustomerOrContactNotEmpty;
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Release the document to the next stage of processing. You must reopen the document before you can make changes to it.';

                    trigger OnAction()
                    var
                        ReleaseSalesDoc: Codeunit "Release Sales Document";
                    begin
                        ReleaseSalesDoc.PerformManualRelease(Rec);
                        CurrPage.TripLines.PAGE.ClearTotalSalesHeader();
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&open';
                    Enabled = Rec.Status <> Rec.Status::Open;
                    Image = ReOpen;
                    ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed.';

                    trigger OnAction()
                    var
                        ReleaseSalesDoc: Codeunit "Release Sales Document";
                    begin
                        ReleaseSalesDoc.PerformManualReopen(Rec);
                        CurrPage.TripLines.PAGE.ClearTotalSalesHeader();
                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";

                action(CalcTripCharges)
                {
                    ApplicationArea = Suite;
                    Caption = 'Calculate Trip Charges';
                    //Ellipsis = true;
                    Enabled = Rec."No." <> '';
                    Image = Calculate;
                    ToolTip = 'Calculate trip charges';

                    trigger OnAction()
                    begin
                        CalculateTripCharges();
                    end;
                }
                action(CopyDocument)
                {
                    ApplicationArea = Suite;
                    Caption = 'Copy Trip Document';
                    Ellipsis = true;
                    Enabled = xRec."No." <> '';
                    Image = CopyDocument;
                    ToolTip = 'Copy document lines and header information from another sales document to this document. You can copy a posted sales invoice into a new sales invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        Rec.CopyTripDocument();
                        if Rec.Get(Rec."Document Type", Rec."No.") then;
                        CurrPage.TripLines.Page.ForceTotalsCalculation();
                        CurrPage.Update();
                    end;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    Enabled = NOT OpenApprovalEntriesExist AND CanRequestApprovalForFlow;
                    Image = SendApprovalRequest;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    begin
                        if ApprovalsMgmt.CheckSalesApprovalPossible(Rec) then
                            ApprovalsMgmt.OnSendSalesDocForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = CanCancelApprovalForRecord OR CanCancelApprovalForFlow;
                    Image = CancelApprovalRequest;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                    begin
                        ApprovalsMgmt.OnCancelSalesApprovalRequest(Rec);
                        WorkflowWebhookMgt.FindAndCancel(xRec.RecordId);
                    end;
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                action(Post)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'P&ost';
                    Image = PostOrder;
                    ShortCutKey = 'F9';
                    AboutTitle = 'When all is set, you post';
                    AboutText = 'After entering the sales lines and other information, you post the invoice to make it count.? After posting, the sales invoice is moved to the Posted Sales Invoices list.';
                    ToolTip = 'Finalize the document or journal by posting the amounts and quantities to the related accounts in your company books.';

                    trigger OnAction()
                    var
                        SalesLine: Record "Sales Line";
                        SalesLineCount: integer;
                    begin
                        SalesLineCount := 0;
                        SalesLine.reset;
                        SalesLine.setrange("Document Type", Rec."Document Type");
                        SalesLine.setrange("Document No.", Rec."No.");
                        if SalesLine.findfirst then begin
                            SalesLineCount := SalesLine.Count;
                            repeat
                                If salesline."Shortcut Dimension 1 Code" = '' then
                                    Error('Line No. %1 does not have Dimension of %2', SalesLine."Line No.", SalesLine.fieldcaption("shortcut Dimension 1 Code"));
                                If salesline."Shortcut Dimension 2 Code" = '' then
                                    Error('Line No. %1 does not have Dimension of %2', SalesLine."Line No.", SalesLine.FIELDcaption("shortcut Dimension 2 Code"));
                                If salesline."Shortcut Dimension 3 Code" = '' then
                                    Error('Line No. %1 does not have Dimension of %2', SalesLine."Line No.", SalesLine.FIELDcaption("shortcut Dimension 3 Code"));
                                If salesline."Shortcut Dimension 4 Code" = '' then
                                    Error('Line No. %1 does not have Dimension of %2', SalesLine."Line No.", SalesLine.FIELDcaption("shortcut Dimension 4 Code"));
                                If salesline."Shortcut Dimension 5 Code" = '' then
                                    Error('Line No. %1 does not have Dimension of %2', SalesLine."Line No.", SalesLine.FIELDcaption("shortcut Dimension 5 Code"));
                                If salesline."Shortcut Dimension 6 Code" = '' then
                                    Error('Line No. %1 does not have Dimension of %2', SalesLine."Line No.", SalesLine.FIELDcaption("shortcut Dimension 6 Code"));
                            until salesline.next = 0;
                        end;
                        If Rec."Global Dimension 2 Code" = 'LOCAL' then begin
                            if SalesLineCount > 15 then
                                error('Lines should not be more than 15');
                        end;
                        PostDocument(CODEUNIT::"Sales-Post (Yes/No)", "Navigate After Posting"::"Posted Document");
                    end;
                }

                // action(PostAndSend)
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'Post and &Send';
                //     Ellipsis = true;
                //     Image = PostSendTo;
                //     ToolTip = 'Finalize and prepare to send the document according to the customer''s sending profile, such as attached to an email. The Send document to window opens first so you can confirm or select a sending profile.';

                //     trigger OnAction()
                //     begin
                //         PostDocument(CODEUNIT::"Sales-Post and Send", "Navigate After Posting"::"Do Nothing");
                //     end;
                // }
                action(Preview)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Preview Posting';
                    Image = ViewPostedOrder;
                    ShortCutKey = 'Ctrl+Alt+F9';
                    ToolTip = 'Review the different types of entries that will be created when you post the document or journal.';

                    trigger OnAction()
                    begin
                        ShowPreview();
                    end;
                }
                action(DraftInvoice)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Draft Invoice';
                    Ellipsis = true;
                    Image = ViewPostedOrder;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category5;
                    ToolTip = 'View or print the sales invoice as a draft before you perform the actual posting.';
                    Visible = false;
                    trigger OnAction()
                    var
                        DocumentPrint: Codeunit "Document-Print";
                    begin
                        DocumentPrint.PrintSalesHeader(Rec);
                    end;
                }
                // action(ProformaInvoice)
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'Pro Forma Invoice';
                //     Ellipsis = true;
                //     Image = ViewPostedOrder;
                //     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //     //PromotedCategory = Category5;
                //     ToolTip = 'View or print the pro forma sales invoice.';

                //     trigger OnAction()
                //     var
                //         DocumentPrint: Codeunit "Document-Print";
                //     begin
                //         DocumentPrint.PrintProformaSalesInvoice(Rec);
                //     end;
                // }
                // action("Test Report")
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'Test Report';
                //     Ellipsis = true;
                //     Image = TestReport;
                //     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //     //PromotedCategory = Category5;
                //     ToolTip = 'View a test report so that you can find and correct any errors before you perform the actual posting of the journal or document.';

                //     trigger OnAction()
                //     begin
                //         ReportPrint.PrintSalesHeader(Rec);
                //     end;
                // }
                action(PrintToAttachment)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Attach as PDF';
                    Ellipsis = true;
                    Image = PrintAttachment;
                    ToolTip = 'Create a PDF file and attach it to the document.';

                    trigger OnAction()
                    var
                        SalesHeader: Record "Sales Header";
                        DocumentPrint: Codeunit "Document-Print";
                    begin
                        SalesHeader := Rec;
                        SalesHeader.SetRecFilter();
                        DocumentPrint.PrintSalesInvoiceToDocumentAttachment(SalesHeader, DocumentPrint.GetSalesInvoicePrintToAttachmentOption(Rec));
                    end;
                }
            }
        }
        area(Promoted)
        {

            group(Category_Category7)
            {
                Caption = 'Invoice', Comment = 'Generated from the PromotedActionCategories property index 6.';
                actionref("CopyDoc_Promoted"; CopyDocument)
                {
                }
                actionref(Dimensions_Promoted; Dimensions)
                {
                }
                actionref(Statistics_Promoted; Statistics)
                {
                }
                actionref("Co&mments_Promoted"; "Co&mments")
                {
                }
                // actionref(DocAttach_Promoted; DocAttach)
                // {
                // }
                actionref(Approvals_Promoted; Approvals)
                {
                }
                separator(Navigate_Separator)
                {
                }
                actionref(Function_CustomerCard_Promoted; Function_CustomerCard)
                {
                }
            }

            group(Category_CalculateCharges)
            {
                Caption = 'Calculate';

                actionref(CalculateTripCharges_Promoted; CalcTripCharges)
                {
                }
            }
            // group(Category_PrintSend)
            // {
            //     Caption = 'Print/Send';

            //     actionref(DraftInvoice_Promoted; DraftInvoice)
            //     {
            //     }
            //     // actionref(ProformaInvoice_Promoted; ProformaInvoice)
            //     // {
            //     // }
            // }
            group(Category_Category4)
            {
                Caption = 'Approve', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref(Approve_Promoted; Approve)
                {
                }
                actionref(Reject_Promoted; Reject)
                {
                }
                actionref(Comment_Promoted; Comment)
                {
                }
                actionref(Delegate_Promoted; Delegate)
                {
                }
            }
            group(Category_Category9)
            {
                Caption = 'Request Approval', Comment = 'Generated from the PromotedActionCategories property index 8.';

                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
            }
            group(Category_Category8)
            {
                Caption = 'Release', Comment = 'Generated from the PromotedActionCategories property index 7.';
                ShowAs = Standard;

                actionref(Release_Promoted; Release)
                {
                }
                actionref(Reopen_Promoted; Reopen)
                {
                }
            }
            group(Category_Category5)
            {
                Caption = 'Posting', Comment = 'Generated from the PromotedActionCategories property index 4.';
                ShowAs = Standard;

                actionref(Post_Promoted; Post)
                {
                }
                actionref(Preview_Promoted; Preview)
                {
                }
                actionref(PDF_Promoted; PrintToAttachment)
                {
                }
            }


            group(Category_Category10)
            {
                Caption = 'View', Comment = 'Generated from the PromotedActionCategories property index 9.';
            }
            group(Category_Category11)
            {
                Caption = 'Navigate', Comment = 'Generated from the PromotedActionCategories property index 10.';
            }
            group(Category_Report)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        StatusStyleTxt := Rec.GetStatusStyleText();
        UpdatePaymentService();
        SetControlAppearance();
    end;

    trigger OnAfterGetRecord()
    var
        ICInboxOutboxMgt: Codeunit ICInboxOutboxMgt;
    begin
        RejectICSalesInvoiceEnabled := ICInboxOutboxMgt.IsSalesHeaderFromIncomingIC(Rec);
        WorkDescription := Rec.GetWorkDescription();
        UpdateShipToBillToGroupVisibility();
        SellToContact.GetOrClear(Rec."Sell-to Contact No.");
        BillToContact.GetOrClear(Rec."Bill-to Contact No.");
    end;

    trigger OnDeleteRecord(): Boolean
    begin

        CurrPage.SaveRecord();
        exit(Rec.ConfirmDeletion());
    end;

    trigger OnInit()
    begin
        JobQueuesUsed := SalesSetup.JobQueueActive();
        SetExtDocNoMandatoryCondition();
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Trip Invoice" := true;
        if DocNoVisible then
            Rec.CheckCreditMaxBeforeInsert();

        if (Rec."Sell-to Customer No." = '') and (Rec.GetFilter(Rec."Sell-to Customer No.") <> '') then
            CurrPage.Update(false);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        xRec.Init();
        Rec."Responsibility Center" := UserMgt.GetSalesFilter();
        if (not DocNoVisible) and (Rec."No." = '') then
            Rec.SetSellToCustomerFromFilter();

        Rec.SetDefaultPaymentServices();
        UpdateShipToBillToGroupVisibility();
    end;

    trigger OnOpenPage()
    var
        PaymentServiceSetup: Record "Payment Service Setup";
        OfficeMgt: Codeunit "Office Management";
        EnvironmentInfo: Codeunit "Environment Information";
        ICInboxOutboxMgt: Codeunit ICInboxOutboxMgt;
        VATReportingDateMgt: Codeunit "VAT Reporting Date Mgt";
    begin
        Rec.SetSecurityFilterOnRespCenter();

        Rec.SetRange("Date Filter", 0D, WorkDate());

        ActivateFields();

        SetDocNoVisible();

        if Rec."No." = '' then
            if OfficeMgt.CheckForExistingInvoice(Rec."Sell-to Customer No.") then
                Error(''); // Cancel invoice creation
        IsSaaS := EnvironmentInfo.IsSaaS();
        if (Rec."No." <> '') and (Rec."Sell-to Customer No." = '') then
            DocumentIsPosted := (not Rec.Get(Rec."Document Type", Rec."No."));
        PaymentServiceVisible := PaymentServiceSetup.IsPaymentServiceVisible();

        CheckShowBackgrValidationNotification();
        RejectICSalesInvoiceEnabled := ICInboxOutboxMgt.IsSalesHeaderFromIncomingIC(Rec);
        VATDateEnabled := VATReportingDateMgt.IsVATDateEnabled();
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if not (SkipConfirmationDialogOnClosing or DocumentIsPosted) then
            exit(Rec.ConfirmCloseUnposted());
    end;

    var
        SellToContact: Record Contact;
        BillToContact: Record Contact;
        SalesSetup: Record "Sales & Receivables Setup";
        GLSetup: Record "General Ledger Setup";
        MoveNegSalesLines: Report "Move Negative Sales Lines";
        ApplicationAreaMgmtFacade: Codeunit "Application Area Mgmt. Facade";
        ReportPrint: Codeunit "Test Report-Print";
        UserMgt: Codeunit "User Setup Management";
        SalesCalcDiscountByType: Codeunit "Sales - Calc Discount By Type";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        LinesInstructionMgt: Codeunit "Lines Instruction Mgt.";
        CustomerMgt: Codeunit "Customer Mgt.";
        FormatAddress: Codeunit "Format Address";
        ChangeExchangeRate: Page "Change Exchange Rate";
        WorkDescription: Text;

        StatusStyleTxt: Text;
        HasIncomingDocument: Boolean;
        DocNoVisible: Boolean;
        ExternalDocNoMandatory: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;
        PaymentServiceVisible: Boolean;
        PaymentServiceEnabled: Boolean;
        IsPostingGroupEditable: Boolean;
        SureToRejectMsg: Label 'Rejecting this order will remove it from your company and send it back to the partner company.\\Do you want to continue?';
        OpenPostedSalesInvQst: Label 'The invoice is posted as number %1 and moved to the Posted Sales Invoices window.\\Do you want to open the posted invoice?', Comment = '%1 = posted document number';
        IsCustomerOrContactNotEmpty: Boolean;
        ShowQuoteNo: Boolean;
        JobQueuesUsed: Boolean;
        CanCancelApprovalForRecord: Boolean;
        DocumentIsPosted: Boolean;
        EmptyShipToCodeErr: Label 'The Code field can only be empty if you select Custom Address in the Ship-to field.';
        IsSaaS: Boolean;
        IsBillToCountyVisible: Boolean;
        IsSellToCountyVisible: Boolean;
        IsShipToCountyVisible: Boolean;
        SalesDocCheckFactboxVisible: Boolean;

        IsJournalTemplNameVisible: Boolean;

        IsPaymentMethodCodeVisible: Boolean;

        IsSalesLinesEditable: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        SkipConfirmationDialogOnClosing: Boolean;
        RejectICSalesInvoiceEnabled: Boolean;

        VATDateEnabled: Boolean;
        t_Trip: Record Trip temporary;

    protected var
        ShipToOptions: Enum "Sales Ship-to Options";
        BillToOptions: Enum "Sales Bill-to Options";

    local procedure ActivateFields()
    begin
        IsBillToCountyVisible := FormatAddress.UseCounty(Rec."Bill-to Country/Region Code");
        IsSellToCountyVisible := FormatAddress.UseCounty(Rec."Sell-to Country/Region Code");
        IsShipToCountyVisible := FormatAddress.UseCounty(Rec."Ship-to Country/Region Code");
        GLSetup.Get();
        IsJournalTemplNameVisible := GLSetup."Journal Templ. Name Mandatory";
        IsPaymentMethodCodeVisible := not GLSetup."Hide Payment Method Code";
        IsSalesLinesEditable := Rec.SalesLinesEditable();
    end;

    procedure CallPostDocument(PostingCodeunitID: Integer; Navigate: Enum "Navigate After Posting")
    begin
        PostDocument(PostingCodeunitID, Navigate);
    end;

    local procedure PostDocument(PostingCodeunitID: Integer; Navigate: Enum "Navigate After Posting")
    var
        SalesHeader: Record "Sales Header";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        OfficeMgt: Codeunit "Office Management";
        InstructionMgt: Codeunit "Instruction Mgt.";
        PreAssignedNo: Code[20];
        IsScheduledPosting: Boolean;
        IsHandled: Boolean;
    begin
        LinesInstructionMgt.SalesCheckAllLinesHaveQuantityAssigned(Rec);
        PreAssignedNo := Rec."No.";

        Rec.SendToPosting(PostingCodeunitID);

        IsScheduledPosting := Rec."Job Queue Status" = Rec."Job Queue Status"::"Scheduled for Posting";
        DocumentIsPosted := (not SalesHeader.Get(Rec."Document Type", Rec."No.")) or IsScheduledPosting;


        if IsScheduledPosting then
            CurrPage.Close();
        CurrPage.Update(false);

        IsHandled := false;

        if IsHandled then
            exit;

        if PostingCodeunitID <> CODEUNIT::"Sales-Post (Yes/No)" then
            exit;

        if OfficeMgt.IsAvailable() then begin
            SalesInvoiceHeader.SetCurrentKey("Pre-Assigned No.");
            SalesInvoiceHeader.SetRange("Pre-Assigned No.", PreAssignedNo);
            if SalesInvoiceHeader.FindFirst() then
                PAGE.Run(PAGE::"Posted Sales Invoice", SalesInvoiceHeader);
        end else
            case Navigate of
                "Navigate After Posting"::"Posted Document":
                    if InstructionMgt.IsEnabled(InstructionMgt.ShowPostedConfirmationMessageCode()) then
                        ShowPostedConfirmationMessage(PreAssignedNo);
                "Navigate After Posting"::"New Document":
                    if DocumentIsPosted then begin
                        SalesHeader.Init();
                        SalesHeader.Validate("Document Type", SalesHeader."Document Type"::Invoice);
                        SalesHeader.Insert(true);
                        PAGE.Run(PAGE::"Sales Invoice", SalesHeader);
                    end;
            end;
    end;

    local procedure ApproveCalcInvDisc()
    begin
        CurrPage.TripLines.PAGE.ApproveCalcInvDisc();
    end;

    local procedure SaveInvoiceDiscountAmount()
    var
        DocumentTotals: Codeunit "Document Totals";
    begin
        CurrPage.SaveRecord();
        DocumentTotals.SalesRedistributeInvoiceDiscountAmountsOnDocument(Rec);
        CurrPage.Update(false);
    end;

    local procedure ShowPostedConfirmationMessage(PreAssignedNo: Code[20])
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
        InstructionMgt: Codeunit "Instruction Mgt.";
    begin
        SalesInvoiceHeader.SetCurrentKey("Pre-Assigned No.");
        SalesInvoiceHeader.SetRange("Pre-Assigned No.", PreAssignedNo);
        if SalesInvoiceHeader.FindFirst() then
            if InstructionMgt.ShowConfirm(StrSubstNo(OpenPostedSalesInvQst, SalesInvoiceHeader."No."),
                 InstructionMgt.ShowPostedConfirmationMessageCode())
            then
                InstructionMgt.ShowPostedDocument(SalesInvoiceHeader, Page::"Sales Invoice");
    end;

    local procedure SalespersonCodeOnAfterValidate()
    begin
        CurrPage.TripLines.PAGE.UpdatePage(true);
    end;

    local procedure SetDocNoVisible()
    var
        DocumentNoVisibility: Codeunit DocumentNoVisibility;
        DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",Reminder,FinChMemo;
    begin
        DocNoVisible := DocumentNoVisibility.SalesDocumentNoIsVisible(DocType::Invoice, Rec."No.");
    end;

    local procedure SetExtDocNoMandatoryCondition()
    begin
        SalesSetup.GetRecordOnce();
        ExternalDocNoMandatory := SalesSetup."Ext. Doc. No. Mandatory";
    end;

    local procedure ShowPreview()
    var
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
    begin
        SalesPostYesNo.Preview(Rec);
    end;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        DocumentErrorsMgt: Codeunit "Document Errors Mgt.";
        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
    begin
        HasIncomingDocument := Rec."Incoming Document Entry No." <> 0;
        ShowQuoteNo := Rec."Quote No." <> '';
        SetExtDocNoMandatoryCondition();
        SetPostingGroupEditable();

        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(xRec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(xRec.RecordId);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(xRec.RecordId);

        IsCustomerOrContactNotEmpty := (Rec."Sell-to Customer No." <> '') or (Rec."Sell-to Contact No." <> '');
        IsSalesLinesEditable := Rec.SalesLinesEditable();

        SalesDocCheckFactboxVisible := DocumentErrorsMgt.BackgroundValidationEnabled();
        WorkflowWebhookMgt.GetCanRequestAndCanCancel(xRec.RecordId, CanRequestApprovalForFlow, CanCancelApprovalForFlow);
    end;

    local procedure CheckShowBackgrValidationNotification()
    var
        DocumentErrorsMgt: Codeunit "Document Errors Mgt.";
    begin
        if DocumentErrorsMgt.CheckShowEnableBackgrValidationNotification() then
            SetControlAppearance();
    end;

    procedure SetSkipConfirmationDialogOnClosing(Skip: Boolean)
    begin
        SkipConfirmationDialogOnClosing := Skip;
    end;

    protected procedure UpdatePaymentService()
    var
        PaymentServiceSetup: Record "Payment Service Setup";
    begin
        PaymentServiceEnabled := PaymentServiceSetup.CanChangePaymentService(Rec);
    end;

    procedure SetPostingGroupEditable()
    var
        BillToCustomer: Record Customer;
    begin
        if BillToCustomer.Get(Rec."Bill-to Customer No.") then
            IsPostingGroupEditable := BillToCustomer."Allow Multiple Posting Groups";
    end;

    local procedure UpdateShipToBillToGroupVisibility()
    begin

    end;

    procedure CalculateTripCharges()
    var
        Trip: Record Trip;

        PageTripList: page "Trips to Calculate Invoice";
    begin
        Rec.TestField("Route Code");
        Rec.Testfield("Global Dimension 2 Code");
        trip.Reset();
        trip.SetRange("Client No.", Rec."Sell-to Customer No.");
        trip.setrange("Global Dimension 2 Code", Rec."Global Dimension 2 Code");
        Trip.setrange("Route Code", Rec."Route Code");
        if (Rec."Global Dimension 2 Code" = 'SHUNTING') or (Rec."Global Dimension 2 Code" = '3PL') then
            trip.SetFilter("Trip Status", '=%1|%2', Trip."Trip Status"::Live, Trip."Trip Status"::Completed)
        else
            trip.SetFilter("Trip Status", '%1', Trip."Trip Status"::Completed);
        Trip.SetRange(Invoiced, false);
        clear(PageTripList);
        PageTripList.SetTableView(Trip);
        PageTripList.SetRecord(Trip);
        PageTripList.LookupMode(true);
        PageTripList.GetSalesInvoiceNo(rec."No.", rec."Sell-to Customer No.");
        if PageTripList.RunModal() = ACTION::LookupOK then begin
        end;
    end;
}

