page 50244 "Posted Petty Cash Card"
{
    Caption = 'Posted Petty Cash Expenses';
    PageType = Card;
    SourceTable = "Petty Cash Expenses Detail";
    Editable = false;
    SourceTableView = where(Posted = filter(true));
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
                }
                field("Petty Cash For"; Rec."Petty Cash For")
                {
                    ApplicationArea = All;
                }
                field("Expense date"; Rec."Creation date")
                {
                    ApplicationArea = All;
                }
                field("Petty Cash Approval Status"; Rec."Petty Cash Approval Status")
                {
                    ApplicationArea = All;
                }
                field("Transaction Reference No."; Rec."Transaction Reference No.")
                {
                    ApplicationArea = All;
                }
                field("Petty Cash Amount"; Rec."Petty Cash Amount")
                {
                    ApplicationArea = All;
                }
                field("Trip ID"; Rec."Trip ID")
                {
                    ApplicationArea = All;
                }
                field("Vehicle No."; Rec."Vehicle No.")
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
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = All;
                }
                field("Expense Type"; Rec."Expense Type")
                {
                    ApplicationArea = All;
                }
                field("Trip Direction"; Rec."Trip Direction")
                {
                    ApplicationArea = All;
                }
                field(From; Rec.From)
                {
                    ApplicationArea = All;
                }
                field(Destination; Rec.Destination)
                {
                    ApplicationArea = All;
                }
                field("Remarks/Comments"; Rec."Remarks/Comments")
                {
                    ApplicationArea = All;
                }
                field("Reason For Rejection"; Rec."Reason For Rejection")
                {
                    ApplicationArea = All;
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

            action(PettyCashReturn)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Petty Cash Return';
                Image = Document;
                //Visible = false;
                trigger OnAction()
                var
                    FuelReturn: Record "Fuel Return";
                    Vehicle: Record "Fixed Asset";
                begin
                    if not Confirm('Do you want to post Petty Cash Return?', false) then
                        exit else begin
                        If not Rec."Petty Cash Reversed" then begin
                            CreatePettyCashReturn();
                            if Rec."Petty Cash For" = Rec."Petty Cash For"::"Non-Trip" then
                                Rec.PostDirectPettyCashReturnJournal()
                            else begin
                                if not Rec."For Closed Trip?" then
                                    Rec.PostPrepaidPettyCashReturn()
                                else
                                    Rec.PostDirectPettyCashReturnJournal();
                            end;
                            Rec."Petty Cash Reversed" := true;
                            Rec."Petty Cash Return No." := Rec."Voucher No." + '-R';
                            Rec.Modify();

                        end else
                            Error('This Petty Cash is already reversed');
                        CurrPage.Update(false);
                        CurrPage.Close();
                    end;
                end;

            }
        }
    }
    trigger OnOpenPage()
    begin

        SetDimensionsVisibility();

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
        GroupAdminEditable: Boolean;

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

    procedure CreatePettyCashReturn()
    var
        PettyCashReturn: Record "Petty Cash Return";
        UnigroupSetup: Record "Unigroup Setup";
        NoSeriesMgt: Codeunit "No. Series";
    begin
        UnigroupSetup.Get();
        PettyCashReturn.Init();
        PettyCashReturn."Petty Cash Return No." := Rec."Voucher No." + '-R';
        PettyCashReturn."Return Date" := WorkDate();
        PettyCashReturn."Trip ID" := Rec."Trip ID";
        PettyCashReturn."Vehicle No." := Rec."Vehicle No.";
        PettyCashReturn."Driver ID" := Rec."Driver ID";
        PettyCashReturn."Driver Name" := Rec."Driver Name";
        PettyCashReturn."Shortcut Dimension 6 Code" := Rec."Shortcut Dimension 6 Code";
        PettyCashReturn."Expense Type" := Rec."Expense Type";
        PettyCashReturn."Transaction Reference No." := Rec."Transaction Reference No.";
        PettyCashReturn."Petty Cash Amount" := Rec."Petty Cash Amount";
        PettyCashReturn."Voucher No." := Rec."Voucher No.";
        PettyCashReturn."Petty Cash For" := Rec."Petty Cash For";
        PettyCashReturn."Account Name" := Rec."Account Name";
        PettyCashReturn."Account No." := Rec."Account No.";
        PettyCashReturn."For Closed Trip?" := Rec."For Closed Trip?";
        PettyCashReturn."Bal. Account No." := Rec."Bal. Account No.";
        PettyCashReturn."Bal. Account Type" := Rec."Bal. Account Type";
        PettyCashReturn."Petty Cash Approval Status" := Rec."Petty Cash Approval Status";
        PettyCashReturn."Petty Cash Status" := Rec."Petty Cash Status";
        PettyCashReturn."Mobile Phone No." := Rec."Mobile Phone No.";
        PettyCashReturn.Insert();
        Rec.Modify();
    end;

}
