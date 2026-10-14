page 57019 "Disposal Request"
{
    Caption = 'Disposal Request';
    PageType = Document;
    SourceTable = Disposal;
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'Disposal Request';
                Editable = IsOpen;

                field("No."; Rec."No.") { ApplicationArea = All; }
                field("Disposal Need"; Rec."Disposal Need")
                {
                    ApplicationArea = All;
                    ToolTip = 'Why the disposal is needed: obsolete asset, damaged inventory, or contaminated/used oil or fuel.';
                    trigger OnValidate()
                    begin
                        SetControls();
                        CurrPage.Update();
                    end;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    ToolTip = 'Select Asset to pick a fixed asset, or Item to pick an inventory item.';
                    trigger OnValidate()
                    begin
                        SetControls();
                        CurrPage.Update();
                    end;
                }
                field("Asset/Item No."; Rec."Asset/Item No.")
                {
                    ApplicationArea = All;
                    CaptionClass = AssetItemCaption;
                    ToolTip = 'Look-up shows Fixed Assets or Items depending on Type.';
                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
                }
                field(Description; Rec.Description) { ApplicationArea = All; }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    Editable = IsItem;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                    Visible = IsItem;
                }
                field("Location Code"; Rec."Location Code") { ApplicationArea = All; }
                field("Reason for Disposal"; Rec."Reason for Disposal")
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }
                field("Request Date"; Rec."Request Date") { ApplicationArea = All; }
                field("Requested By"; Rec."Requested By") { ApplicationArea = All; }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    StyleExpr = StatusStyle;
                }
            }
            group(Inspection)
            {
                Caption = 'Technical Inspection';
                Editable = IsInspection;

                field("Condition Assessment"; Rec."Condition Assessment") { ApplicationArea = All; MultiLine = true; }
                field("Repair vs Replace Analysis"; Rec."Repair vs Replace Analysis") { ApplicationArea = All; MultiLine = true; }
                field(Recommendation; Rec.Recommendation) { ApplicationArea = All; }
                field("Technical Report"; Rec."Technical Report") { ApplicationArea = All; MultiLine = true; }
                field("Inspected By"; Rec."Inspected By") { ApplicationArea = All; }
                field("Inspection Date"; Rec."Inspection Date") { ApplicationArea = All; }
            }
            group(Verification)
            {
                Caption = 'Inventory Verification';
                Editable = IsVerification;

                field("Quantity Confirmed"; Rec."Quantity Confirmed") { ApplicationArea = All; }
                field("Asset Register Validated"; Rec."Asset Register Validated") { ApplicationArea = All; }
                field("Ownership Confirmed"; Rec."Ownership Confirmed") { ApplicationArea = All; }
                field("Verified By"; Rec."Verified By") { ApplicationArea = All; }
                field("Verification Date"; Rec."Verification Date") { ApplicationArea = All; }
            }
            group(Financial)
            {
                Caption = 'Financial Assessment';
                Editable = IsFinancial;

                field("Net Book Value"; Rec."Net Book Value") { ApplicationArea = All; }
                field("Residual Value Estimate"; Rec."Residual Value Estimate") { ApplicationArea = All; }
                field("Impairment Review"; Rec."Impairment Review") { ApplicationArea = All; MultiLine = true; }
                field("Assessed By"; Rec."Assessed By") { ApplicationArea = All; }
            }
            group(Approval)
            {
                Caption = 'Approval';
                Editable = IsPendingApproval;

                field("Rejection Comment"; Rec."Rejection Comment") { ApplicationArea = All; MultiLine = true; }
                field("Rejection Count"; Rec."Rejection Count") { ApplicationArea = All; }
                field("Approved By"; Rec."Approved By") { ApplicationArea = All; }
                field("Approval Date"; Rec."Approval Date") { ApplicationArea = All; }
            }
            group(Execution)
            {
                Caption = 'Disposal Execution';
                Editable = IsApproved;

                field("Disposal Method"; Rec."Disposal Method")
                {
                    ApplicationArea = All;
                    ToolTip = 'Assets: Auction, Tender, Scrap, Trade-in. Inventory: Scrap, Supplier Return, Write Off. Fuel: Controlled Draining, Supplier Return, Write Off.';
                }
                field("Execution Date"; Rec."Execution Date") { ApplicationArea = All; }
                field("Operations Witness"; Rec."Operations Witness") { ApplicationArea = All; }
                field("Finance Witness"; Rec."Finance Witness") { ApplicationArea = All; }
                field("Proceeds Amount"; Rec."Proceeds Amount") { ApplicationArea = All; }
                field("Receipt No."; Rec."Receipt No.") { ApplicationArea = All; }
            }
            group(SystemUpdate)
            {
                Caption = 'System Update & Accounting';
                Editable = false;

                field("Gain/Loss Amount"; Rec."Gain/Loss Amount") { ApplicationArea = All; }
                field("System Updated By"; Rec."System Updated By") { ApplicationArea = All; }
                field("System Update Date"; Rec."System Update Date") { ApplicationArea = All; }
            }
            group(Review)
            {
                Caption = 'Post-Disposal Review';
                Editable = IsSystemUpdated;

                field("Review Notes"; Rec."Review Notes") { ApplicationArea = All; MultiLine = true; }
                field("Reviewed By"; Rec."Reviewed By") { ApplicationArea = All; }
                field("Review Date"; Rec."Review Date") { ApplicationArea = All; }
            }
        }
        area(FactBoxes)
        {
            systempart(Links; Links) { ApplicationArea = RecordLinks; }
            systempart(Notes; Notes) { ApplicationArea = Notes; }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Submit)
            {
                ApplicationArea = All;
                Caption = 'Submit for Inspection';
                Image = SendTo;
                Enabled = IsOpen;
                trigger OnAction()
                begin
                    DisposalMgt.SubmitRequest(Rec);
                    RefreshPage();
                end;
            }
            action(CompleteInspection)
            {
                ApplicationArea = All;
                Caption = 'Complete Inspection';
                Image = Completed;
                Enabled = IsInspection;
                trigger OnAction()
                begin
                    DisposalMgt.CompleteInspection(Rec);
                    RefreshPage();
                end;
            }
            action(Verify)
            {
                ApplicationArea = All;
                Caption = 'Verify Inventory Records';
                Image = CheckList;
                Enabled = IsVerification;
                trigger OnAction()
                begin
                    DisposalMgt.VerifyInventory(Rec);
                    RefreshPage();
                end;
            }
            action(CompleteFinancial)
            {
                ApplicationArea = All;
                Caption = 'Complete Financial Assessment';
                Image = CalculateBalanceAccount;
                Enabled = IsFinancial;
                trigger OnAction()
                begin
                    DisposalMgt.CompleteFinancialAssessment(Rec);
                    RefreshPage();
                end;
            }
            action(Approve)
            {
                ApplicationArea = All;
                Caption = 'Approve';
                Image = Approve;
                Enabled = IsPendingApproval;
                trigger OnAction()
                begin
                    DisposalMgt.Approve(Rec);
                    RefreshPage();
                end;
            }
            action(Reject)
            {
                ApplicationArea = All;
                Caption = 'Reject';
                Image = Reject;
                Enabled = IsPendingApproval;
                trigger OnAction()
                begin
                    DisposalMgt.Reject(Rec);
                    RefreshPage();
                end;
            }
            action(Execute)
            {
                ApplicationArea = All;
                Caption = 'Confirm Disposal Executed';
                Image = ReleaseDoc;
                Enabled = IsApproved;
                trigger OnAction()
                begin
                    DisposalMgt.ExecuteDisposal(Rec);
                    RefreshPage();
                end;
            }
            action(UpdateSystem)
            {
                ApplicationArea = All;
                Caption = 'Update System / Post';
                Image = Post;
                Enabled = IsExecuted;
                trigger OnAction()
                begin
                    DisposalMgt.UpdateSystem(Rec);
                    RefreshPage();
                end;
            }
            action(CompleteReview)
            {
                ApplicationArea = All;
                Caption = 'Complete Audit Review';
                Image = Close;
                Enabled = IsSystemUpdated;
                trigger OnAction()
                begin
                    DisposalMgt.CompleteReview(Rec);
                    RefreshPage();
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process';
                actionref(Submit_Promoted; Submit) { }
                actionref(CompleteInspection_Promoted; CompleteInspection) { }
                actionref(Verify_Promoted; Verify) { }
                actionref(CompleteFinancial_Promoted; CompleteFinancial) { }
                actionref(Execute_Promoted; Execute) { }
                actionref(UpdateSystem_Promoted; UpdateSystem) { }
                actionref(CompleteReview_Promoted; CompleteReview) { }
            }
            group(Category_Approve)
            {
                Caption = 'Approve';
                actionref(Approve_Promoted; Approve) { }
                actionref(Reject_Promoted; Reject) { }
            }
        }
    }

    var
        DisposalMgt: Codeunit "Disposal Management";
        IsOpen, IsInspection, IsVerification, IsFinancial, IsPendingApproval : Boolean;
        IsApproved, IsExecuted, IsSystemUpdated, IsItem : Boolean;
        AssetItemCaption: Text;
        StatusStyle: Text;

    trigger OnAfterGetCurrRecord()
    begin
        SetControls();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        IsOpen := true;
    end;

    local procedure RefreshPage()
    begin
        CurrPage.Update(false);
        SetControls();
    end;

    local procedure SetControls()
    begin
        IsOpen := Rec.Status = Rec.Status::Open;
        IsInspection := Rec.Status = Rec.Status::"Technical Inspection";
        IsVerification := Rec.Status = Rec.Status::"Inventory Verification";
        IsFinancial := Rec.Status = Rec.Status::"Financial Assessment";
        IsPendingApproval := Rec.Status = Rec.Status::"Pending Approval";
        IsApproved := Rec.Status = Rec.Status::Approved;
        IsExecuted := Rec.Status = Rec.Status::Executed;
        IsSystemUpdated := Rec.Status = Rec.Status::"System Updated";
        IsItem := Rec.Type = Rec.Type::Item;

        case Rec.Type of
            Rec.Type::Asset:
                AssetItemCaption := '3,Fixed Asset No.';
            Rec.Type::Item:
                AssetItemCaption := '3,Item No.';
            else
                AssetItemCaption := '3,Asset/Item No.';
        end;

        case Rec.Status of
            Rec.Status::Closed, Rec.Status::"System Updated":
                StatusStyle := 'Favorable';
            Rec.Status::"Pending Approval":
                StatusStyle := 'Ambiguous';
            Rec.Status::Open:
                StatusStyle := 'Standard';
            else
                StatusStyle := 'StrongAccent';
        end;
    end;
}

