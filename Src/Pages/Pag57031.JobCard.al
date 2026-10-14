page 57031 "Workshop Jobs Card"
{
    Caption = 'Workshop Job';
    PageType = Document;
    SourceTable = "Workshop Jobs";
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Job Card No."; Rec."Job Card No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field("Job Date"; Rec."Job Date")
                {
                    ApplicationArea = All;
                }
                field("Time In"; Rec."Time In")
                {
                    ApplicationArea = All;
                }
                field("Job Status"; Rec."Job Status")
                {
                    ApplicationArea = All;
                    Editable = GroupAdminEditable;
                }
                field("Job Type"; Rec."Job Type")
                {
                    ApplicationArea = All;
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ApplicationArea = All;
                }
                field("Make Code"; Rec."Make Code")
                {
                    ApplicationArea = All;
                }
                field("Model Code"; Rec."Model Code")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Type"; Rec."Vehicle Type")
                {
                    ApplicationArea = All;
                }
                field("Chassis No."; Rec."Chassis No.")
                {
                    ApplicationArea = All;
                }
                field("Engine Number"; Rec."Engine Number")
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
                field("Date Registered"; Rec."Date Registered")
                {
                    ApplicationArea = All;
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = All;
                }
                field("Job End Date"; Rec."Job End Date")
                {
                    ApplicationArea = All;
                }
                field("Time Out"; Rec."Time Out")
                {
                    ApplicationArea = All;
                }
                field("Created By(Code)"; Rec."Created By(Code)")
                {
                    ApplicationArea = All;
                }
                field("Created By(Name)"; Rec."Created By Name")
                {
                    ApplicationArea = All;
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }
                field("Closing Comments"; Rec."Closing Comments")
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }
                field("Next Service Date";Rec."Next Service Date")
                {
                    ApplicationArea = All;
                }


            }
            part(RequestedParts; "Requested Parts/Service")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "Job Card No." = field("Job Card No.");
            }
            group(Description)
            {
                Caption = 'Description';
                field("Odometer In"; Rec."Odometer In")
                {
                    ApplicationArea = All;
                }
                field("Odometer Out"; Rec."Odometer Out")
                {
                    ApplicationArea = All;
                }
                field("Mileage In"; Rec."Mileage In")
                {
                    ApplicationArea = All;
                }
                field(Fitter; Rec.Fitter)
                {
                    ApplicationArea = All;
                }
                field("Appointed Mechanic"; Rec."Appointed Mechanic")
                {
                    ApplicationArea = All;
                }
                field("Appointed Mechanic Name"; Rec."Appointed Mechanic Name")
                {
                    ApplicationArea = All;
                }
                field("Appointed welder"; Rec."Appointed welder")
                {
                    ApplicationArea = All;
                }
                field("Appointed Welder Name"; Rec."Appointed Welder Name")
                {
                    ApplicationArea = All;
                }
                field("Appointed Tyreman"; Rec."Appointed Tyreman")
                {
                    ApplicationArea = All;
                }
                field("Appointed Tyreman Name"; Rec."Appointed Tyreman Name")
                {
                    ApplicationArea = All;
                }
                field("Appointed Electrician"; Rec."Appointed Electrician")
                {
                    ApplicationArea = All;
                }
                field("Appointed Electrician Name"; Rec."Appointed Electrician Name")
                {
                    ApplicationArea = All;
                }
                field("Appointed Panel beater"; Rec."Appointed Panel beater")
                {
                    ApplicationArea = All;
                }
                field("Appointed Panel Beater Name"; Rec."Appointed Panel Beater Name")
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
    }
    actions
    {
        area(Processing)
        {
            action("Create Stock Request")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Create Stock Request';
                Image = Create;
                trigger OnAction()
                begin
                    If (rec."Job Status" <> rec."Job Status"::"Work in Progress") and (rec."Job Status" <> rec."Job Status"::"Pending Stock Issue") then
                        Error('Job Status must not be as %1', Rec."Job Status")
                    else
                        Rec.CreateStockRequest();

                end;
            }
            action("Create Stock Return")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Create Stock Return';
                Image = Create;
                trigger OnAction()
                begin
                    // If (rec."Job Status" <> rec."Job Status"::"Work in Progress") and (rec."Job Status" <> rec."Job Status"::"Parts on Order") then
                    //     Error('Job Status must not be as %1', Rec."Job Status")
                    // else
                    Rec.CreateStockReturn();
                end;
            }
            action("Start Job")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Start or Resume Job';
                Image = Create;
                trigger OnAction()
                var
                    Vehicle: Record "Fixed Asset";
                begin
                    if (Rec."Job Status" <> Rec."Job Status"::Open) and (Rec."Job Status" <> Rec."Job Status"::"Pending Stock Issue") then
                        Error('Job Status must not be %1', Rec."Job Status")
                    else begin
                        if Rec."Job Status" = Rec."Job Status"::Open then begin
                            if confirm('Do you want to start the Job?', true) then begin
                                Rec."Job Status" := Rec."Job Status"::"Work in Progress";
                                Rec.Modify();
                                if Vehicle.get(Rec."Vehicle No.") then begin
                                    Vehicle."Vehicle Status" := Vehicle."Vehicle Status"::"Under Maintenance";
                                    Vehicle.Modify();
                                end;
                            end;
                        end;
                        if rec."Job Status" = rec."Job Status"::"Pending Stock Issue" then begin
                            if confirm('Do you want to Resume the Job?', true) then begin
                                if Vehicle.get(Rec."Vehicle No.") then begin
                                    if Vehicle."Vehicle Status" = Vehicle."Vehicle Status"::Allocated then
                                        Error('Vehichle is allocated to a trip. Vehicle status should be Available to Resume the Job..!!')
                                    else
                                        if vehicle."Vehicle Status" = Vehicle."Vehicle Status"::Available then begin
                                            Vehicle."Vehicle Status" := Vehicle."Vehicle Status"::"Under Maintenance";
                                            Vehicle.Modify();

                                        end;
                                end;
                                Rec."Job Status" := Rec."Job Status"::"Work in Progress";
                                Rec.Modify();
                            end;
                        end;
                    end;
                end;
            }
            action("Close Job Card")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Close Job Card';
                Image = Create;
                trigger OnAction()
                var
                    Vehicle: Record "Fixed Asset";
                begin
                    Rec.TestField("Next Service Date");
                    if (rec."Job Status" = rec."Job Status"::"Work in Progress") or (rec."Job Status" = rec."Job Status"::Open) then begin
                        if confirm('Do you want to close the Job?', true) then begin
                            Rec."Job Status" := Rec."Job Status"::Closed;
                            Rec."Job End Date" := WorkDate();
                            Rec."Closed By" := UserId;
                            Rec.Modify();
                            if Vehicle.get(Rec."Vehicle No.") then begin
                                Vehicle."Vehicle Status" := Vehicle."Vehicle Status"::Available;
                                Vehicle."Next Service Date" := Rec."Next Service Date";
                                Vehicle.Modify();
                            end;
                        end;
                    end else
                        Error('Job Status must not be %1', Rec."Job Status");
                end;
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
                        Workshop: Record "Workshop Jobs";
                    begin
                        // Workshop.Reset();
                        // Workshop.SetRange("Job Card No.", Rec."Job Card No.");
                        // if Workshop.FindFirst() then begin
                        //     if Rec."Job Status" = Rec."Job Status"::Closed then begin
                        //         if confirm('Do you want to Print Job Card?', true) then
                        //             Report.RunModal(50100, true, false, Workshop);
                        //     end else
                        //         Error('You can not print Job card until it is closed');
                        // end;

                        Workshop.Reset();
                        Workshop.SetRange("Job Card No.", Rec."Job Card No.");
                        if Workshop.FindFirst() then begin
                            if rec."Job Status" <> rec."Job Status"::Closed then begin
                                if confirm('Do you want to Print?', true) then begin
                                    if Workshop.FindFirst() then
                                        Report.RunModal(50106, true, false, Workshop);
                                end;
                            end else begin
                                if Rec."Job Status" = Rec."Job Status"::Closed then begin
                                    if confirm('Do you want to Print?', true) then begin
                                        if Workshop.FindFirst() then
                                            Report.RunModal(50100, true, false, Workshop);
                                    end;
                                end;
                            end;
                        end;
                    end;
                }
            }
        }
        area(Navigation)
        {
            action(StockRequests)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Stock Requests';
                Image = OrderList;
                RunObject = page "Stock Request list";
                RunPageLink = "Job Card No." = field("Job Card No.");
            }
            action(StockIssues)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Stock Issues';
                Image = PostedReceipts;
                RunObject = page "Stock Issue list";
                RunPageLink = "Job Card No." = field("Job Card No.");
            }
            action(StockReturn)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Stock Returns';
                Image = PostedReceipts;
                RunObject = page "Stock Return List";
                RunPageLink = "Job Card No." = field("Job Card No.");
            }
            action(PostedStockReturn)
            {
                ApplicationArea = All;
                Caption = 'Posted Stock Returns';
                Image = Navigate;
                RunObject = page "Posted Stock Return List";
                RunPageLink = "Job Card No." = field("Job Card No.");
            }
        }
        area(Promoted)
        {
            group(Category_Category5)
            {
                Caption = 'Stock Related', Comment = 'Generated from the PromotedActionCategories property index 4.';
                ShowAs = Standard;
                actionref(StockRequest_Promoted; StockRequests)
                {
                }
                actionref(StockIssues_Promoted; StockIssues)
                {
                }
                actionref(StockReturn_Promoted; StockReturn)
                {
                }
                actionref(StockReturn1_Promoted; PostedStockReturn)
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
    trigger OnOpenPage()
    begin

        SetDimensionsVisibility();
        GroupAuditEdit();

    end;

    var
        GroupAdminEditable: Boolean;
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
}