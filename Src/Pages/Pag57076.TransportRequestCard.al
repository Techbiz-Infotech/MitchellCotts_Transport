page 57076 "Request For Transport"
{
    ApplicationArea = All;
    Caption = 'Transport Request';
    PageType = Card;
    SourceTable = "Transport Request Header";
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(" RFT No"; Rec." RFT No")
                {
                    ToolTip = 'Specifies the value of the RFT No field.', Comment = '%';
                    Caption = 'File No';
                }
                field("Application Date"; Rec."Application Date")
                {
                    Caption = 'File Date';

                }
                FIELD("B/L No"; Rec."B/L No")
                {

                }
                field("Shipping Line"; Rec."Shipping Line")
                {
                    ToolTip = 'Specifies the value of the Shipping Line field.', Comment = '%';
                }
                field("Vessel Name"; Rec."Vessel Name")
                {

                }
                field("Vessel ETA"; Rec."Vessel ETA")
                {

                }
                field(Shipment; Rec.Shipment)
                {

                }
                field("EIR Depot"; Rec."EIR Depot")
                {

                }
                field("No of Containers"; Rec."No of Containers")
                {
                    Caption = 'No. of Units';
                }
                field("Line Count"; Rec."Line Count")
                {
                    ApplicationArea = ALL;
                }

                field(Status; Rec.Status)
                {

                }
                field("Client Ref No"; Rec."Client Ref No")
                {
                    ApplicationArea = All;
                }
                field("Client No. "; Rec."Client No. ")
                {

                }

                field("Client Name "; Rec."Client Name ")
                {
                    ToolTip = 'Specifies the value of the Client Name field.', Comment = '%';
                }
                field("Consignee No"; Rec."Consignee No")
                {

                }
                field("Consignee Name"; Rec."Consignee Name")
                {
                    Editable = False;
                }
                field("CNF File Ref"; Rec."CNF File Ref")
                {

                }
                field("Entry No"; Rec."Entry No")
                {

                }
                field("Free Days"; Rec."Free Days")
                {
                    ToolTip = 'Specifies the value of the Free Days field.', Comment = '%';
                }
                field("Validity Date"; Rec."Validity Date")
                {
                    ToolTip = 'Specifies the value of the Validity Date field.', Comment = '%';
                    visible = false;
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    ApplicationArea = ALL;
                }


            }
            part(Control3; "Transport Request Lines")
            {
                Editable = Editreq;

                ApplicationArea = Basic;
                Caption = 'Add Unit';
                SubPageLink = " RFT No" = FIELD(" RFT No");
            }
        }
        area(FactBoxes)
        {
            part("Attached Documents"; "Doc. Attachment List Factbox")
            {
                ApplicationArea = basic;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(57052),
                "No." = field(" RFT No");

            }
        }

    }
    actions
    {
        area(Processing)
        {
            action("Send Approval Request")
            {
                ApplicationArea = all;
                Caption = 'Send Approval Request';
                Image = SendApprovalRequest;
                trigger OnAction()
                var
                    EventsHandler: Codeunit "Unigroup Workflow Events";

                    myInt: Integer;
                begin
                    EventsHandler.OnSendTransportRequestforApproval(Rec);

                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        // editablebasedonunits
    end;

    trigger OnAfterGetRecord()
    begin
        editablebasedonunits
    end;

    trigger OnAfterGetCurrRecord()
    begin
        editablebasedonunits
    end;

    procedure editablebasedonunits()
    var
        ReqLines: record "Transport Request Lines";
        ct: integer;
    begin

        if rec."No of Containers" <> 0 then begin
            if rec."Line Count" >= rec."No of Containers"
            then
                Editreq := False
            else
                Editreq := True;
        END;
    end;





    var
        Editreq: Boolean;
}

