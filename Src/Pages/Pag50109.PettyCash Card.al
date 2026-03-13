page 50109 "Petty Cash Voucher"
{
    Caption = 'Petty Cash Voucher';
    PageType = Card;
    SourceTable = "Petty Cash Expenses Detail";
    SourceTableView = where(Posted = filter(false));
    DeleteAllowed = false;
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Voucher No."; Rec."Voucher No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field("Expense date"; Rec."Creation date")
                {
                    ApplicationArea = All;
                }
                field("Petty Cash For"; Rec."Petty Cash For")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        SetFieldEditable();
                    end;
                }
                field("For Closed Trip?"; Rec."For Closed Trip?")
                {
                    ApplicationArea = All;
                }
                field("Trip ID"; Rec."Trip ID")
                {
                    ApplicationArea = All;
                    Editable = ForTripEditable;
                    trigger OnValidate()
                    begin
                        //SetFieldEditable();
                    end;
                }
                field("Expense Type"; Rec."Expense Type")
                {
                    ApplicationArea = All;
                    Editable = ForTripEditable;
                    trigger OnValidate()
                    var
                    begin

                    end;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = All;

                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = All;

                }
                field("Bal. Account Type"; Rec."Bal. Account Type")
                {
                    ApplicationArea = All;
                    //Editable = ForTripEditable;
                }
                field("Bal. Account No."; Rec."Bal. Account No.")
                {
                    ApplicationArea = All;
                    //Editable = ForTripEditable;
                }
                field("Transaction Reference No."; Rec."Transaction Reference No.")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Petty Cash Amount"; Rec."Petty Cash Amount")
                {
                    ApplicationArea = All;
                }
                field("Petty Cash Approval Status"; Rec."Petty Cash Approval Status")
                {
                    ApplicationArea = All;
                }

                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ApplicationArea = All;
                    Editable = ForTripEditable;
                }
                field("Driver ID"; Rec."Driver ID")
                {
                    ApplicationArea = All;
                    Editable = ForTripEditable;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = All;
                    Editable = ForTripEditable;
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Trip Direction"; Rec."Trip Direction")
                {
                    ApplicationArea = All;
                    Editable = ForTripEditable;
                }
                field(From; Rec.From)
                {
                    ApplicationArea = All;
                    Editable = ForTripEditable;
                }
                field(Destination; Rec.Destination)
                {
                    ApplicationArea = All;
                    Editable = ForTripEditable;
                }
                field("Remarks/Comments"; Rec."Remarks/Comments")
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }
                field("Reason For Rejection"; Rec."Reason For Rejection")
                {
                    ApplicationArea = All;
                    MultiLine = true;
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
                    Editable = ForTripEditable;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                    Visible = DimVisible2;
                    Editable = ForTripEditable;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                    Editable = ForTripEditable;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                    Visible = DimVisible3;
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = All;
                    Editable = ForTripEditable;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.';
                    Visible = DimVisible4;
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = All;
                    Editable = ForTripEditable;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 5 Code field.';
                    Visible = DimVisible5;
                }
                field("Shortcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
                {
                    ApplicationArea = All;
                    Editable = ForTripEditable;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 6 Code field.';
                    Visible = DimVisible6;
                }
                field("Shortcut Dimension 7 Code"; Rec."Shortcut Dimension 7 Code")
                {
                    ApplicationArea = All;
                    Editable = ForTripEditable;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 7 Code field.';
                    Visible = DimVisible7;
                }
                field("Shortcut Dimension 8 Code"; Rec."Shortcut Dimension 8 Code")
                {
                    ApplicationArea = All;
                    Editable = ForTripEditable;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 8 Code field.';
                    Visible = DimVisible8;
                }
            }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(Database::"Petty Cash Expenses Detail"),
                              "No." = FIELD("Voucher No.");
            }
        }
    }
    actions
    {
        area(Processing)
        {
            group("P&osting")
            {
                action(Post)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Post';
                    Image = Document;
                    trigger OnAction()
                    begin
                        Rec.PostPettycashJournals();
                        Rec.Posted := true;
                        Rec.Modify();
                        CurrPage.Update(false);
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
                        Pettycashexp: Record "Petty Cash Expenses Detail";
                    begin
                        Rec.TestField("Petty Cash Approval Status", Rec."Petty Cash Approval Status"::Approved);
                        Pettycashexp.Reset();
                        Pettycashexp.SetRange("Voucher No.", Rec."Voucher No.");
                        if Pettycashexp.FindFirst then
                            Report.RunModal(50109, true, false, Pettycashexp);

                    end;
                }
            }

            action("Send Approval Request")
            {
                ApplicationArea = all;
                Caption = 'Send Approval Request';
                Image = SendApprovalRequest;
                trigger OnAction()
                var
                    myInt: Integer;
                begin
                    EventsHandler.OnSendPettyCashExpensesforApproval(Rec);

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
            //    end
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
                                Rec."Petty Cash Approval Status" := Rec."Petty Cash Approval Status"::Approved;
                                Rec.Modify();
                            end;
                        end;
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Re&open';
                    Enabled = Rec."Petty Cash Approval Status" <> Rec."Petty Cash Approval Status"::Open;
                    Image = ReOpen;
                    ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed.';
                    trigger OnAction()
                    begin
                        if rec."Petty Cash Approval Status" <> Rec."Petty Cash Approval Status"::"Pending Approval" then begin
                            Rec."Petty Cash Approval Status" := Rec."Petty Cash Approval Status"::Open;
                            Rec.Modify();
                        end;
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
            group(Category_Category9)
            {
                Caption = 'Request Approval', Comment = 'Generated from the PromotedActionCategories property index 8.';
                ShowAs = Standard;

                actionref(SendApprovalRequest_Promoted; "Send Approval Request")
                {
                }
                // actionref(CancelApprovalRequest_Promoted;"Cancel Approval Request")
                // {
                // }
            }
            group(Category_Category10)
            {
                Caption = 'Post', Comment = 'Generated from the PromotedActionCategories property index 8.';

                actionref(Post_Promoted; Post)
                {
                }
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
    begin

        SetDimensionsVisibility();
        SetFieldEditable();

    end;

    trigger OnAfterGetRecord()
    begin

        SetDimensionsVisibility();
        SetFieldEditable();
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
        if Rec."Petty Cash For" = Rec."Petty Cash For"::"Non-Trip" then
            ForTripEditable := false
        else
            ForTripEditable := true;
    end;

}


