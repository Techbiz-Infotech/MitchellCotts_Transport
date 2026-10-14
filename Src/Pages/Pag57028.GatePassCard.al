page 57028 "Gatepass Card"
{
    Caption = 'Gatepass';
    PageType = Card;
    SourceTable = "Gatepass";
    SourceTableView = where(Posted = const(false));
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Gatepass No."; Rec."Gatepass No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field("Gatepass Date"; Rec."Gatepass Date")
                {
                    ApplicationArea = All;
                }
                field("Created time"; Rec."Created time")
                {
                    ApplicationArea = All;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                }
                field("Gatepass Type"; Rec."Gatepass Type")
                {
                    ApplicationArea = All;
                }
                field("Temp Gatepass Expiry Date"; Rec."Temp Gatepass Expiry Date")
                {
                    ApplicationArea = All;
                    Visible = TempGPEdit;
                }
                field("Temp Gatepass Expiry Time"; Rec."Temp Gatepass Expiry Time")
                {
                    ApplicationArea = All;
                    Visible = TempGPEdit;
                }
                field("Requested By"; Rec."Requested By")
                {
                    ApplicationArea = All;
                }
                field("Trip ID"; Rec."Trip ID")
                {
                    ApplicationArea = All;
                }
                field("Driver ID"; Rec."Driver ID")
                {
                    ApplicationArea = All;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = All;
                }

                field("From(Source)"; Rec."From(Source)")
                {
                    ApplicationArea = All;
                }
                field("To (Destination)"; Rec."To (Destination)")
                {
                    ApplicationArea = All;
                }
                field("Expected No Of Trips"; Rec."Expected No Of Trips")
                {
                    ApplicationArea = All;
                    Visible = false;
                }

                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = All;
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ApplicationArea = All;
                }
                field("Trailer No."; Rec."Trailer No.")
                {
                    ApplicationArea = All;
                }
                field("Departure Odometer(Km)"; Rec."Departure Odometer(Km)")
                {
                    ApplicationArea = All;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }
                field("Purpose/Description"; Rec."Purpose/Description")
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }

            }
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
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Post)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.Post();
                    CurrPage.Update(false);
                end;
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
                    EventsHandler.OnSendGatePassforApproval(Rec);

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
                                Rec."Approval Status" := Rec."Approval Status"::Approved;
                                Rec.Modify();
                            end;
                        end;
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Re&open';
                    Enabled = Rec."Approval Status" <> Rec."Approval Status"::Open;
                    Image = ReOpen;
                    ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed.';
                    trigger OnAction()
                    begin
                        if rec."Approval Status" <> Rec."Approval Status"::"Pending Approval" then begin
                            Rec."Approval Status" := Rec."Approval Status"::Open;
                            Rec.Modify();
                        end;
                    end;
                }
            }
            group(Contr)
            {
                Caption = 'Convert';
                action(Convert)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Convert to Permanent';
                    Enabled = Rec."Gatepass Type" <> Rec."Gatepass Type"::Permanent;
                    Image = CopyBOMVersion;
                    ToolTip = 'Convert to Permanent';
                    //Visible = false;
                    trigger OnAction()
                    begin
                        if rec."Gatepass Type" <> Rec."Gatepass Type"::Permanent then begin
                            Rec."Gatepass Type" := Rec."Gatepass Type"::Permanent;
                            Rec.Modify();
                        end;
                    end;
                }
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
                        Gatepass: Record Gatepass;
                    begin
                        Rec.testfield("Approval Status", Rec."Approval Status"::Approved);
                        Gatepass.Reset();
                        Gatepass.SetRange("Gatepass No.", Rec."Gatepass No.");
                        if Gatepass.FindFirst then
                            Report.RunModal(57008, true, false, Gatepass);
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
            group(Category_Category10)
            {
                Caption = 'Posting', Comment = 'Generated from the PromotedActionCategories property index 8.';

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

    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        GPVisible;
    end;

    trigger OnAfterGetCurrRecord()
    var
        myInt: Integer;
    begin
        GPVisible;
    end;

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        GPVisible;
    end;

    var
        PermGPEdit, TempGPEdit : Boolean;

    procedure GPVisible()
    var
        myInt: Integer;
    begin
        if Rec."Gatepass Type" = Rec."Gatepass Type"::Temporary then
            TempGPEdit := true;

        if Rec."Gatepass Type" = Rec."Gatepass Type"::Permanent then
            PermGPEdit := true;
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
}
