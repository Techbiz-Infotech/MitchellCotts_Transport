page 50111 "Fuel Issue Card"
{
    Caption = 'Fuel Issue';
    PageType = Card;
    DeleteAllowed = false;
    SourceTable = "Fuel Issue";
    SourceTableView = where(Posted = filter(false));
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Fuel Issue No."; Rec."Fuel Issue No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field("Issue Date"; Rec."Issue Date")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Fuel Issue For"; Rec."Fuel Issue For")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Fuel Source"; Rec."Fuel Source")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    trigger OnValidate()
                    begin
                        UnitCostEdit();
                        CurrPage.Update(false);
                    end;
                }
                field("For Closed Trip?"; Rec."For Closed Trip?")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Trip ID"; Rec."Trip ID")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        SetFieldEditable();
                    end;
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Editable = ForTripEditable;
                }
                field("Trailer No."; Rec."Trailer No.")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Editable = false;
                }
                field("Tank Size"; Rec."Tank Size")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Editable = false;
                }
                field("Fuel Type"; Rec."Fuel Type")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Editable = false;
                }
                field("Driver ID"; Rec."Driver ID")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Editable = false;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Pump; Rec.Pump)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Fueling Station Name"; Rec."Fueling Station Name")
                {
                    ApplicationArea = All;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Editable = UnitCostEditable;
                }
                field(Odometer; Rec.Odometer)
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 6 Code1"; Rec."Shortcut Dimension 6 Code")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    //Editable = ForTripEditable;
                }
                field("Unit of measure"; Rec."Unit of measure")
                {
                    ApplicationArea = All;
                    Editable = ForTripEditable;
                }

                field("Fuel Approval Status"; Rec."Fuel Approval Status")
                {
                    ApplicationArea = All;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }
                group("Fuel Required")
                {
                    Caption = 'Fuel Required';
                    field("Required Fuel In Litres"; Rec."Required Fuel In Litres")
                    {
                        ApplicationArea = All;
                        ShowMandatory = true;
                        //Editable = ForTripEditable;
                    }
                    field("Balance Fuel in Vehicle"; Rec."Balance Fuel in Truck")
                    {
                        ApplicationArea = All;
                        // Editable = ForTripEditable;
                    }
                    field("Shortage in liters(If Any)"; Rec."Shortage in liters(If Any)")
                    {
                        ApplicationArea = All;
                    }
                    field("Net Requirement in litres"; Rec."Net Requirement in litres")
                    {
                        ApplicationArea = All;
                        ShowMandatory = true;
                        Editable = ForTripEditable;
                    }
                }

            }
            group(Dimensions)
            {
                Caption = 'Dimensions';
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                    Visible = DimVisible1;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                    Visible = DimVisible2;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                    Visible = DimVisible3;
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.';
                    Visible = DimVisible4;
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 5 Code field.';
                    Visible = DimVisible5;
                }
                field("Shortcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 6 Code field.';
                    Visible = DimVisible6;
                }
                field("Shortcut Dimension 7 Code"; Rec."Shortcut Dimension 7 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 7 Code field.';
                    Visible = DimVisible7;
                }
                field("Shortcut Dimension 8 Code"; Rec."Shortcut Dimension 8 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 8 Code field.';
                    Visible = DimVisible8;
                }
                field("Purchase Receipt No."; Rec."Purchase Receipt No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Purchase Receipt No. field.';
                }
                field("PO No."; Rec."PO No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PO No. field.';
                }

            }
        }
    }
    actions
    {
        area(Processing)
        {
            group("P&osting")
            {
                action(PostReceipt)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Post Purchase';
                    Image = Document;
                    trigger OnAction()
                    var
                        Fuelissue: Record "Fuel Issue";
                        Trip: Record Trip;
                    begin
                        Rec.TestField("Fuel Source");
                        if Rec."Fuel Source" = Rec."Fuel Source"::External then begin
                            if Rec."External Fuel Location" = '' then
                                Error('There is no external Fuel Location on Fuel Issue No. %1', Rec."Fuel Issue No.");
                            if Rec."Unit Cost" = 0 then
                                Error('Unit Cost must have a value if fuel source is external for Fuel Issue No. %1', Rec."Fuel Issue No.");
                        end;
                        Rec.TestField("Fuel Approval Status", Rec."Fuel Approval Status"::Approved);
                        if not Confirm('Do you want to post the Purchase?', false) then
                            exit else begin
                            Rec.TestField("Fuel Approval Status", Rec."Fuel Approval Status"::Approved);
                            if Rec."Net Requirement In Litres" < 1 then
                                Error('You can not issue fuel %1', Rec."Net Requirement In Litres");
                            Rec.CreatePO();
                            CurrPage.Update(false);
                            //CurrPage.Close();
                        end;
                    end;
                }
                action(Post)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Post Fuel Issue';
                    Image = Document;
                    trigger OnAction()
                    var
                        Fuelissue: Record "Fuel Issue";
                        Trip: Record Trip;
                    begin
                        Rec.TestField("Fuel Source");
                        if Rec."Fuel Source" = Rec."Fuel Source"::External then begin
                            if Rec."External Fuel Location" = '' then
                                Error('There is no external Fuel Location on Fuel Issue No. %1', Rec."Fuel Issue No.");
                            if Rec."Unit Cost" = 0 then
                                Error('Unit Cost must have a value if fuel source is external for Fuel Issue No. %1', Rec."Fuel Issue No.");
                        end;
                        Rec.TestField("Fuel Approval Status", Rec."Fuel Approval Status"::Approved);
                        if not Confirm('Do you want to post Fuel Issue?', false) then
                            exit else begin
                            Rec.TestField("Fuel Approval Status", Rec."Fuel Approval Status"::Approved);
                            if Rec."Net Requirement In Litres" < 1 then
                                Error('You can not issue fuel %1', Rec."Net Requirement In Litres");
                            if Rec."Fuel Issue For" = Rec."Fuel Issue For"::"Non-Trip" then
                                Rec.PostDirectFuelExpenseJournal()
                            else begin
                                if not Rec."For Closed Trip?" then
                                    Rec.TransferOrderForFuelissue(Rec)
                                else
                                    Rec.PostDirectFuelExpenseJournal();
                            end;
                            Rec.Posted := true;
                            Rec.Modify();
                            CurrPage.Update(false);
                            CurrPage.Close();
                        end;
                    end;

                }

                action("Send Approval Request")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send Approval Request';
                    // Promoted = true;
                    // PromotedCategory = Process;
                    // PromotedIsBig = true;
                    // PromotedOnly = true;
                    Image = SendApprovalRequest;
                    trigger OnAction()
                    var
                        myInt: Integer;
                    begin
                        //If (rec."Fuel Issue For" <> Rec."Fuel Issue For"::"Non-Trip") or (rec."Fuel Issue For" <> Rec."Fuel Issue For"::Trip) then
                        // Error('Please Select the Fuel Issue For'); 
                        Rec.TestField("Fuel Issue No.");
                        Rec.TestField("Issue Date");

                        Rec.TestField("Vehicle No.");

                        // Rec.TestField("Trailer No.");
                        // Rec.TestField("Tank Size");
                        Rec.TestField("Driver ID");
                        Rec.TestField(Pump);
                        Rec.TestField("Shortcut Dimension 6 Code");
                        Rec.TestField("Required Fuel In Litres");
                        Rec.TestField("Net Requirement in litres");
                        EventsHandler.OnSendFuelforApproval(Rec);
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
                            Fueliss: Record "Fuel Issue";
                        begin
                            Rec.TestField("Fuel Approval Status", Rec."Fuel Approval Status"::Approved);
                            Fueliss.Reset();
                            Fueliss.SetRange("Fuel Issue No.", Rec."Fuel Issue No.");
                            if Fueliss.FindFirst then
                                Report.RunModal(50126, true, false, Fueliss);
                        end;
                    }
                }
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
                                    Rec."Fuel Approval Status" := Rec."Fuel Approval Status"::Approved;
                                    Rec.Modify();
                                end;
                            end;
                        end;

                    }
                    action(Reopen)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Re&open';
                        Enabled = Rec."Fuel Approval Status" <> Rec."Fuel Approval Status"::Open;
                        Image = ReOpen;
                        ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed.';
                        trigger OnAction()
                        begin
                            if rec."Fuel Approval Status" <> Rec."Fuel Approval Status"::"Pending Approval" then begin
                                Rec."Fuel Approval Status" := Rec."Fuel Approval Status"::Open;
                                Rec.Modify();
                            end;
                        end;
                    }
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
            group(Category_Category9)
            {
                Caption = 'Request Approval', Comment = 'Generated from the PromotedActionCategories property index 8.';

                actionref(SendApprovalRequest_Promoted; "Send Approval Request")
                {
                }
                // actionref(CancelApprovalRequest_Promoted;"Cancel Approval Request")
                // {
                // }
            }
            group(Category_Category10)
            {
                Caption = 'Posting', Comment = 'Generated from the PromotedActionCategories property index 8.';

                actionref(PurchasePost_Promoted; PostReceipt)
                {
                }
                actionref(Post_Promoted; post)
                {
                }

                // actionref(CancelApprovalRequest_Promoted;"Cancel Approval Request")
                // {
                // }
            }
            group(Category_Category11)
            {
                Caption = 'Print', Comment = 'Generated from the PromotedActionCategories property index 10.';

                actionref(Print_Promoted; Print)
                {
                }
            }

        }
    }

    var
        EventsHandler: Codeunit "Unigroup Workflow Events";
        UnitCostEditable: Boolean;

    trigger OnOpenPage()
    begin

        SetDimensionsVisibility();
        SetFieldEditable();
        UnitCostEdit();

    end;

    trigger OnAfterGetRecord()
    begin

        SetDimensionsVisibility();
        SetFieldEditable();
        UnitCostEdit();
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
        ForTripEditable: Boolean;
        StyleExprTxt: Text;

    procedure SetFieldEditable()
    begin
        if Rec."Trip ID" = '' then
            ForTripEditable := true
        else
            ForTripEditable := false;
    end;

    procedure UnitCostEdit()
    begin
        if Rec."Fuel Source" = Rec."Fuel Source"::Internal then
            UnitCostEditable := false
        else
            UnitCostEditable := true;
    end;
}