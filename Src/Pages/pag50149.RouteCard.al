page 50149 "Routes Card"
{
    PageType = Card;
    Caption = 'Route';
    SourceTable = Route;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Route Code"; Rec."Route Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;

                }
                field("Route From"; Rec."Route From")
                {
                    ApplicationArea = All;
                }
                field("Route To"; Rec."Route To")
                {
                    ApplicationArea = All;
                }
                field(KM; Rec."Route KM")
                {
                    ApplicationArea = All;
                }
                field("Standard Route Price"; Rec."Standard Route Price")
                {
                    ApplicationArea = All;
                }
                field("Fuel Allocation"; Rec."Fuel Allocation")
                {
                    ApplicationArea = All;
                }
                field("Allowance Per Day"; Rec."Allowance Per Day")
                {
                    ApplicationArea = All;
                }
                field("TAT In Days"; Rec."TAT In Days")
                {
                    ApplicationArea = All;
                }
                field("Route Type"; Rec."Route Type")
                {
                    ApplicationArea = All;
                }
                field("Route Approval Status"; Rec."Route Approval Status")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions

    {
        area(Processing)
        {
            action("Send Approval Request")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Send Approval Request';
                Image = SendApprovalRequest;
                trigger OnAction()
                var
                    myInt: Integer;
                begin
                    EventsHandler.OnSendRouteforApproval(Rec);

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
                                Rec."Route Approval Status" := Rec."Route Approval Status"::Approved;
                                Rec.Modify();
                            end;
                        end;
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Re&open';
                    Enabled = Rec."Route Approval Status" <> Rec."Route Approval Status"::Open;
                    Image = ReOpen;
                    ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed.';
                    trigger OnAction()
                    begin
                        if rec."Route Approval Status" <> Rec."Route Approval Status"::Open then begin
                            Rec."Route Approval Status" := Rec."Route Approval Status"::Open;
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
                ShowAs = SplitButton;

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

        }
    }
    var
        EventsHandler: Codeunit "Unigroup Workflow Events";

}