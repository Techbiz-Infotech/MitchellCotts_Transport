page 57071 "Phys. Inventory Journallist"
{
    PageType = List;
    SourceTable = "Phys. Inv. Approval Logs";
    ApplicationArea = All;
    Caption = 'Physical Inventory Approval List';
    DeleteAllowed = false;
    InsertAllowed = false;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Journal Template Name"; Rec."Journal Template Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Journal Template Name field.';
                }
                field("Journal Batch Name"; Rec."Journal Batch Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Journal Batch Name field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Requested By"; Rec."Requested By")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Requested By field.';
                }
                field("Approved By"; Rec."Approved By")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Approved By field.';
                }
                field("Approval DateTime"; Rec."Approval DateTime")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Approval DateTime field.';
                }

            }
        }
    }

    actions
    {
        area(processing)
        {
            // action("Approve")
            // {
            //     Caption = 'Approve';
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     //  Visible = TermActionVisible;
            //     trigger OnAction()
            //     var
            //         ItemJnlLineRec: Record "Item Journal Line";
            //         ApproveCount: Integer;
            //     begin
            //         ItemJnlLineRec.SetRange("Journal Template Name", Rec."Journal Template Name");
            //         ItemJnlLineRec.SetRange("Journal Batch Name", Rec."Journal Batch Name");
            //         if ItemJnlLineRec.FindSet() then
            //             repeat
            //                 if ItemJnlLineRec."Approval Status Inv" = ItemJnlLineRec."Approval Status Inv"::"Pending Approval" then begin
            //                     ItemJnlLineRec."Approval Status Inv" := ItemJnlLineRec."Approval Status Inv"::Approved;
            //                     ItemJnlLineRec.Modify(true);
            //                 end;
            //             until ItemJnlLineRec.Next() = 0;
            //         CurrPage.Update(true);
            //         Message('Batch %1 approved.', Rec."Journal Batch Name");
            //     end;
            // }

            // action("Reject")
            // {
            //     Caption = 'Reject';
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     //   Visible = TermActionVisible;
            //     trigger OnAction()
            //     var
            //         ItemJnlLineRec: Record "Item Journal Line";
            //         ApproveCount: Integer;
            //     begin
            //         ItemJnlLineRec.SetRange("Journal Template Name", Rec."Journal Template Name");
            //         ItemJnlLineRec.SetRange("Journal Batch Name", Rec."Journal Batch Name");
            //         if ItemJnlLineRec.FindSet() then
            //             repeat
            //                 if ItemJnlLineRec."Approval Status Inv" = ItemJnlLineRec."Approval Status Inv"::"Pending Approval" then begin
            //                     ItemJnlLineRec.Modify(true);
            //                 end;
            //             until ItemJnlLineRec.Next() = 0;
            //         CurrPage.Update(true);
            //         Message('Batch %1 rejected.', Rec."Journal Batch Name");
            //     end;
            // }
            action("Open")
            {
                Caption = 'Open Record';
                Promoted = true;
                PromotedCategory = Process;
                //     Visible = TermActionVisible;
                trigger OnAction()
                var
                    ItemJnlLine: Record "Item Journal Line";
                    PhysInvLog: Record "Phys. Inv. Approval Logs";
                    PhysInvJournalPage: Page "Phys. Inventory Journal";
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
                                ItemJnlLine.Modify(true);
                                PhysInvLog.Init();
                                EntryNo := PhysInvLog.GetNextEntryNo();
                                PhysInvLog."Entry No." := EntryNo;
                                PhysInvLog."Journal Template Name" := ItemJnlLine."Journal Template Name";
                                PhysInvLog."Journal Batch Name" := ItemJnlLine."Journal Batch Name";
                                PhysInvLog."Approval Status" := PhysInvLog."Approval Status"::"Pending Approval";
                                PhysInvLog."Requested By" := UserId();
                                PhysInvLog."Document No." := ItemJnlLine."Document No.";
                                PhysInvLog.Insert();
                            end;
                        until ItemJnlLine.Next() = 0;
                        CurrPage.Update(false);
                        PAGE.Run(PAGE::"Phys. Inventory Journal", ItemJnlLine);
                    end else
                        Message('No lines found to send for approval.');
                end;


            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.SetRange("Journal Template Name", 'PHYS. INVE');
        Rec.SetFilter("Approval Status", '%1|%2', "Approval Status Inv"::"Pending Approval", "Approval Status Inv"::Approved);
    end;

    // procedure ActionVisibleFunction()
    // var
    //     UserSetup: Record "User Setup";
    // begin
    //     UserSetup.get(userid);
    //     if UserSetup."Phys. Inv Joural" <> true then
    //         TermActionVisible := false
    //     else
    //         TermActionVisible := true;
    // end;

    // var
    //     TermActionVisible: Boolean;
}

