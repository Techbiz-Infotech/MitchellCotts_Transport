page 50224 "Inspection Worksheet"
{
    Caption = 'Inspection Worksheet';
    PageType = Document;
    SourceTable = "Inspection Header";
    DeleteAllowed = true;
    SourceTableView = where(Posted = filter(false));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Inspection No."; Rec."Inspection No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inspection No. field.';
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field("Inspection Date"; Rec."Inspection Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inspection Date field.';
                }
                field("Inspection Time"; Rec."Inspection Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inspection Time field.';
                }
                field("Trip ID"; Rec."Trip ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Trip ID field.';
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vehicle No. field.';
                }
                field("Trailer No."; Rec."Trailer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Trailer No. field.';
                    Editable = false;
                }
                field("Driver ID"; Rec."Driver ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Driver ID field.';
                    Editable = false;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Driver Name field.';
                    Editable = false;
                }
                field(Mileage; Rec.Mileage)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mileage field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted field.';
                    Visible = false;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
            }
            part(InspectionLine; "Inspection Subform")
            {
                Caption = 'Lines';
                ApplicationArea = Basic, Suite;
                SubPageLink = "Inspection No." = field("Inspection No.");
            }

        }
area(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(Database::"Inspection Header"),
                              "No." = FIELD("Inspection No.");
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(LoadCheckList)
            {
                Caption = 'Load Check List';
                Image = WorkCenterLoad;
                ApplicationArea = All;
                trigger OnAction()

                begin
                    Rec.TestField("Vehicle No.");
                    Rec.LoadTemplate();
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Post';
                Image = Document;
                trigger OnAction()
                var
                    Trip: Record Trip;
                    VehicleRec: Record "Fixed Asset";
                    NextInspectiondate: date;
                begin
                    if not Confirm('Do you want to post?', true) then
                        exit else begin
                        // Trip.Reset();
                        // Trip.SetRange("Trip ID", Rec."Trip ID");
                        // Trip.SetFilter("Trip Status", '<>%1', Trip."Trip Status"::Completed);
                        // if Trip.FindFirst() then begin
                        //     Trip."Inspection No." := Rec."Inspection No.";
                        //     Trip."Inspection Completed" := true;
                        // end else
                        //     error('Trip not Found..!!');
                        Rec.Posted := true;
                        Rec.Modify();
                        VehicleRec.Reset();
                        VehicleRec.SetRange("No.", Rec."Vehicle No.");
                        if VehicleRec.FindFirst() then begin
                            NextInspectiondate := CalcDate('30D', Rec."Inspection Date");
                            VehicleRec."Next Inspection Date" := NextInspectiondate;
                            VehicleRec.Modify();
                        end;
                        CurrPage.Update(false);
                        Message('Successfully posted');
                        CurrPage.Close();
                    end;
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
                        Inspection: Record "Inspection Header";
                    begin
                        Inspection.Reset();
                        Inspection.SetRange("Inspection No.", Rec."Inspection No.");
                        Report.RunModal(50113, true, true, Inspection);
                    end;
                }
            }
        }
        area(Promoted)
        {
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
    // procedure LoadingTemplates()
    // var
    //     Inspectionchklst: Record "Inspection Check List Template";
    //     Inspetionline: Record "Inspection Line";
    //     InspectionHeader: Record "Inspection Header";
    //     LineNo: Integer;
    //     EntryNo: Integer;
    // begin
    //     Inspectionchklst.Reset();
    //     if Inspectionchklst.FindFirst() then begin
    //         repeat
    //             LineNo += 10000;
    //             Inspetionline.Init();
    //             Inspetionline."Inspection No." := InspectionHeader."Inspection No.";
    //             Inspetionline."Line No." := LineNo;
    //             Inspetionline."Check List" := Inspectionchklst."Check List";
    //             Inspetionline."Inspection Category" := Inspectionchklst."Inspection Category";
    //             Inspetionline.Insert();
    //             Inspectionchklst.Modify();
    //         until Inspectionchklst.Next() = 0;
    //     end;
    // end;
}