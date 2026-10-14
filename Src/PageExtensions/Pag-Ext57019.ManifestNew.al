pageextension 57019 "Manifest New" extends "Manifests New"
{
    actions
    {
        addlast(Processing)
        {
            action("Transport Request")
            {
                Caption = 'Transport Request';
                ApplicationArea = All;
                trigger OnAction()
                var
                    Email: Codeunit Email;
                    EmailMsg: Codeunit "Email Message";
                    ShippingAgent: Record "Shipping Agent";
                    SelectedLines: Record "Manifest Line";
                    TransportRequest, TR : record "Transport Request Header";
                    TransportRequestLines, TRL : record "Transport Request Lines";
                    AgentCodes: List of [Code[20]];
                    AgentCode: Code[20];
                    NoSeriesMgt: Codeunit "No. Series";
                    PrimarySetup: Record "Unigroup Setup";
                    LineNo: Integer;

                begin
                    PrimarySetup.Get();
                    PrimarySetup.TestField("Request For Transport Nos");
                    // Step 1: Get selected lines
                    CurrPage.SetSelectionFilter(SelectedLines);
                    if not SelectedLines.FindSet() then
                        Error('Please select at least one line.')
                    else
                        repeat
                            TRL.reset;
                            TRL.setrange("Container No", SelectedLines."Shortcut Dimension 4 Code");
                            if TRL.FindFirst() then
                                Error('This container already exists in the transport request')
                            else
                                TransportRequest.Init();
                            TransportRequest.validate(" RFT No", NoSeriesMgt.GetNextNo(PrimarySetup."Request For Transport Nos", WorkDate(), true));
                            TransportRequest.Validate("B/L No", SelectedLines."BL No.");
                            TransportRequest.Validate("Client No. ", SelectedLines."Clearing Agent");
                            TransportRequest.validate("Consignee No", SelectedLines."Consignee No.");
                            TransportRequest.Validate("Vessel Name", SelectedLines."Vessel Name");
                            TransportRequest.validate("Vessel ETA", SelectedLines."Vessel Arrival Date");
                            TransportRequest.validate("Application Date", Today);
                            TransportRequest.Validate(Status, TransportRequest.status::Open);
                            TransportRequest.Validate("Shipping Line", SelectedLines."Shipping Agent Name");
                            TransportRequest.Insert();
                            TransportRequestLines.init();
                            TransportRequestLines." RFT No" := TransportRequest." RFT No";
                            TransportRequestLines.validate("Container No", SelectedLines."Shortcut Dimension 4 Code");
                            Evaluate(TransportRequestLines."Cargo Type  ", SelectedLines."Shortcut Dimension 3 Code");
                            TransportRequestLines.Validate("Truck No", SelectedLines.Vehicle);
                            evaluate(TransportRequestLines.size, SelectedLines."Container Size");
                            TransportRequestLines.Validate(Description, SelectedLines.Description);
                            TransportRequestLines.Insert();







                        until SelectedLines.Next = 0;
                    Message('Transport Request Created Successfully');
                end;

            }
        }
    }
}
