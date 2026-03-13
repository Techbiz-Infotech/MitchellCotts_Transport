pageextension 50130 "Phys. Inventory Journal_Ext" extends "Phys. Inventory Journal"
{
    layout
    {

        addafter(CurrentJnlBatchName)
        {
            // field("Phys. Inv. Status"; Rec."Phys. Inv. Status")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'Status';
            //     ToolTip = 'Indicates the status of the physical inventory journal line.';
            //     Editable = false;
            // }
            field("Approval Status Inv"; Rec."Approval Status Inv")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Approval Status';
                ToolTip = 'Indicates the approval status of the physical inventory journal line.';
                Editable = false;
            }

        }

    }
    actions
    {
        modify("P&ost")
        {
            trigger OnBeforeAction()
            var
                ItemJnlLine: Record "Item Journal Line";
            begin
                if Rec."Journal Template Name" = 'PHYS. INVE' then begin
                    ItemJnlLine.SetRange("Journal Template Name", Rec."Journal Template Name");
                    ItemJnlLine.SetRange("Journal Batch Name", Rec."Journal Batch Name");
                    if ItemJnlLine.FindSet() then
                        repeat
                            if ItemJnlLine."Approval Status Inv" <> ItemJnlLine."Approval Status Inv"::Approved then
                                Error('You can only post when the Physical Inventory Journal is approved.');
                        until ItemJnlLine.Next() = 0;
                end;
            end;
        }

        modify("Post and &Print")
        {
            trigger OnBeforeAction()
            var
                ItemJnlLine: Record "Item Journal Line";
            begin
                if Rec."Journal Template Name" = 'PHYS. INVE' then begin
                    ItemJnlLine.SetRange("Journal Template Name", Rec."Journal Template Name");
                    ItemJnlLine.SetRange("Journal Batch Name", Rec."Journal Batch Name");
                    if ItemJnlLine.FindSet() then
                        repeat
                            if ItemJnlLine."Approval Status Inv" <> ItemJnlLine."Approval Status Inv"::Approved then
                                Error('You can only post when the Physical Inventory Journal is approved.');
                        until ItemJnlLine.Next() = 0;
                end;
            end;
        }
        addlast(Processing)
        {
            action("Send Phys.Inventory Approval Request")
            {
                ApplicationArea = All;
                Caption = 'Send Phys.Inventory Approval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Send the Physical Inventory Journal for approval.';
                Visible = SendApprovalVisible;
                trigger OnAction()
                var
                    ItemJnlLine: Record "Item Journal Line";
                    PhysInvLog: Record "Phys. Inv. Approval Logs";
                    EntryNo: Integer;
                begin
                    if Rec."Journal Template Name" <> 'PHYS. INVE' then
                        Error('Approval can only be sent for Physical Inventory Journals (PHYS. INVE).');
                    ItemJnlLine.SetRange("Journal Template Name", Rec."Journal Template Name");
                    ItemJnlLine.SetRange("Journal Batch Name", Rec."Journal Batch Name");
                    if ItemJnlLine.FindSet() then begin
                        repeat
                            if ItemJnlLine."Approval Status Inv" = ItemJnlLine."Approval Status Inv"::Open then begin
                                ItemJnlLine."Approval Status Inv" := ItemJnlLine."Approval Status Inv"::"Pending Approval";
                                // if ItemJnlLine."Journal Template Name" = 'PHYS. INVE' then
                                //     ItemJnlLine."Phys. Inv Journal for Approval" := true;
                                ItemJnlLine.Modify(true);
                                PhysInvLog.Reset();
                                PhysInvLog.SetRange("Journal Template Name", ItemJnlLine."Journal Template Name");
                                PhysInvLog.SetRange("Journal Batch Name", ItemJnlLine."Journal Batch Name");
                                PhysInvLog.SetRange("Document No.", ItemJnlLine."Document No.");
                                if not PhysInvLog.FindFirst() then begin
                                    PhysInvLog.Init();
                                    EntryNo := PhysInvLog.GetNextEntryNo();
                                    PhysInvLog."Entry No." := EntryNo;
                                    PhysInvLog."Journal Template Name" := ItemJnlLine."Journal Template Name";
                                    PhysInvLog."Journal Batch Name" := ItemJnlLine."Journal Batch Name";
                                    PhysInvLog."Approval Status" := PhysInvLog."Approval Status"::"Pending Approval";
                                    PhysInvLog."Requested By" := UserId();
                                    PhysInvLog."Approval DateTime" := CurrentDateTime();
                                    PhysInvLog."Document No." := ItemJnlLine."Document No.";
                                    PhysInvLog.Insert();
                                end
                            end;
                        until ItemJnlLine.Next() = 0;
                        CurrPage.Update(false);
                    end;
                end;
            }
            action("Approve Phys.Inventory")
            {
                ApplicationArea = All;
                Caption = 'Approve Phys.Inventory';
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Approve the Physical Inventory Journal.';
                Visible = ShowApproveRejectActions;
                trigger OnAction()
                var
                    ItemJnlLine: Record "Item Journal Line";
                    PhysInvLog: Record "Phys. Inv. Approval Logs";
                begin
                    ItemJnlLine.SetRange("Journal Template Name", Rec."Journal Template Name");
                    ItemJnlLine.SetRange("Journal Batch Name", Rec."Journal Batch Name");
                    if ItemJnlLine.FindSet() then begin
                        repeat
                            if ItemJnlLine."Approval Status Inv" = ItemJnlLine."Approval Status Inv"::"Pending Approval" then begin
                                ItemJnlLine."Approval Status Inv" := ItemJnlLine."Approval Status Inv"::Approved;
                                ItemJnlLine.Modify(true);
                                PhysInvLog.SetRange("Document No.", ItemJnlLine."Document No.");
                                if PhysInvLog.FindFirst() then begin
                                    PhysInvLog.Validate("Approval Status", PhysInvLog."Approval Status"::Approved);
                                    PhysInvLog."Approved By" := UserId();
                                    PhysInvLog."Approval DateTime" := CurrentDateTime();
                                    PhysInvLog.Modify();
                                end;
                            end else
                                Error('Record %1 is not pending approval.', ItemJnlLine."Line No.");
                        until ItemJnlLine.Next() = 0;
                        Message('Physical Inventory has been approved.');
                        CurrPage.Update(true);
                    end;
                end;
            }
            action("Reject Phys.Inventory")
            {
                ApplicationArea = All;
                Caption = 'Reject Phys.Inventory';
                Image = Reject;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Reject the Physical Inventory Journal.';
                Visible = ShowApproveRejectActions;
                trigger OnAction()
                var
                    ItemJnlLine: Record "Item Journal Line";
                begin
                    ItemJnlLine.SetRange("Journal Template Name", Rec."Journal Template Name");
                    ItemJnlLine.SetRange("Journal Batch Name", Rec."Journal Batch Name");
                    if ItemJnlLine.FindSet() then begin
                        repeat
                            if ItemJnlLine."Approval Status Inv" = ItemJnlLine."Approval Status Inv"::"Pending Approval" then begin
                                ItemJnlLine.Validate("Approval Status Inv", ItemJnlLine."Approval Status Inv"::Open);
                                ItemJnlLine.Modify(true);
                            end else
                                Error('Record %1 is not pending approval.', ItemJnlLine."Line No.");
                        until ItemJnlLine.Next() = 0;
                        Message('Physical Inventory has been rejected.');
                        CurrPage.Update(true);
                    end;

                end;
            }
            group(Status)
            {
                Caption = 'Status';
                Image = Process;
                action(Release)
                {
                    Caption = 'Release';
                    Image = ReleaseDoc;
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Process;
                    Enabled = (Rec."Phys. Inv. Status" = Rec."Phys. Inv. Status"::Open);
                    ToolTip = 'Release the journal to lock editing.';

                    trigger OnAction()
                    var
                        ItemJnlLine: Record "Item Journal Line";
                    begin
                        // if ItemJnlLine.FindSet() then begin
                        if Confirm('Do you want to release the Inventory?', false) then begin
                            Rec."Phys. Inv. Status" := Rec."Phys. Inv. Status"::Released;
                            Rec.Modify();
                            ItemJnlLine.SetRange("Journal Template Name", Rec."Journal Template Name");
                            ItemJnlLine.SetRange("Journal Batch Name", Rec."Journal Batch Name");
                            if ItemJnlLine.FindSet() then begin
                                repeat
                                    ItemJnlLine."Phys. Inv. Status" := ItemJnlLine."Phys. Inv. Status"::Released;
                                    ItemJnlLine.Modify(true);
                                until ItemJnlLine.Next() = 0;
                            end;
                            Message('Status released.');
                            CurrPage.Update(true);
                        end;
                    end;
                }

                action(Reopen)
                {
                    Caption = 'Reopen';
                    Image = ReOpen;
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Process;
                    Enabled = (Rec."Phys. Inv. Status" = Rec."Phys. Inv. Status"::Released);
                    ToolTip = 'Reopen the journal to allow editing.';
                    trigger OnAction()
                    var
                        ItemJnlLine: Record "Item Journal Line";
                    begin

                        if ItemJnlLine.FindSet() then begin
                            if Confirm('Do you want to release the Inventory?', false) then begin
                                repeat
                                    ItemJnlLine."Phys. Inv. Status" := ItemJnlLine."Phys. Inv. Status"::Open;
                                    ItemJnlLine.Modify(true);
                                until ItemJnlLine.Next() = 0;
                                Message('Reopened.');
                                CurrPage.Update(false);

                            end;
                        end;
                    end;
                }
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        SendApprovalVisible := (Rec."Approval Status Inv" = Rec."Approval Status Inv"::Open);
        ShowApproveRejectActions := (Rec."Approval Status Inv" = Rec."Approval Status Inv"::"Pending Approval");
    end;

    trigger OnAfterGetCurrRecord()
    begin
        ActionVisibleFunction();
        CurrPage.Editable := (Rec."Phys. Inv. Status" <> Rec."Phys. Inv. Status"::Released);
    end;

    procedure ActionVisibleFunction()
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.get(userid);
        if UserSetup."Phys. Inv Joural" <> true then
            TermActionVisible := false
        else
            TermActionVisible := true;

    end;

    var
        TermActionVisible: Boolean;
        // ShowSendApproval: Boolean;
        ShowApproveReject: Boolean;
        // IsApprovalView: Boolean;
        SendApprovalVisible, ShowApproveRejectActions : Boolean;

}



