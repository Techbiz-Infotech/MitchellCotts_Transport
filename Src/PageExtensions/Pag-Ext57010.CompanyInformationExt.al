pageextension 57010 CompanyInfoExt1 extends "Company Information"
{
    actions
    {
        //addafter("Bank Accounts")
        addbefore("General Ledger Setup")
        {
            // action("Test- Do not press")
            // {
            //     Caption = 'Test- Do not touch';
            //     ApplicationArea = All;
            //     AccessByPermission = tabledata "Dimension Set Entry" = rimd;
            //     trigger OnAction()
            //     var
            //         DimensionSetEntry: Record "Dimension Set Entry";
            //         VehiclefuelLog: Record "Vehicle Fuel Log";
            //         Trip: Record Trip;
            //         FuelIssue: Record "Fuel Issue";
            //     begin

            // IF UserId <> 'TI' then
            //     Error('you do not have permission');

            // VehiclefuelLog.Reset();
            // if VehiclefuelLog.FindFirst() then
            //     repeat
            //         Trip.Reset();
            //         Trip.SetRange("Trip ID", VehiclefuelLog."Trip Id");
            //         if Trip.FindFirst() then begin
            //             VehiclefuelLog."Global Dimension 1 Code" := Trip."Global Dimension 1 Code";
            //             VehiclefuelLog."Global Dimension 2 Code" := Trip."Global Dimension 2 Code";
            //             VehiclefuelLog."Shortcut Dimension 3 Code" := Trip."Shortcut Dimension 3 Code";
            //             VehiclefuelLog."Shortcut Dimension 4 Code" := Trip."Shortcut Dimension 4 Code";
            //             VehiclefuelLog."Shortcut Dimension 5 Code" := Trip."Shortcut Dimension 5 Code";
            //             VehiclefuelLog."Shortcut Dimension 6 Code" := Trip."Shortcut Dimension 6 Code";
            //             VehiclefuelLog.Modify();
            //         end;
            //     until VehiclefuelLog.Next() = 0;
            // VehiclefuelLog.Reset();
            // VehiclefuelLog.SetRange("Entry Type", VehiclefuelLog."Entry Type"::"Fuel Issue");
            // if VehiclefuelLog.FindFirst() then
            //     repeat
            //         FuelIssue.Reset();
            //         FuelIssue.SetRange("Trip ID", VehiclefuelLog."Trip Id");
            //         FuelIssue.SetRange("Net Requirement In Litres", VehiclefuelLog.Quantity);
            //         if FuelIssue.FindFirst() then begin
            //             VehiclefuelLog."Document No." := FuelIssue."Fuel Issue No.";
            //             VehiclefuelLog.Modify();
            //         end;

            //     until VehiclefuelLog.Next() = 0;
            // end;
            // }
            // action("Test- Do not press1")
            // {
            //     ApplicationArea = All;
            //     AccessByPermission = tabledata "Purch. Rcpt. Header" = rimd;
            //     trigger OnAction()
            //     var
            //         PurchOrder: Record "Purchase Header";
            //         Recpt: Record "Purch. Rcpt. Header";
            //     begin
            //         if Recpt.FindFirst() then
            //             repeat
            //                 if PurchOrder.get(PurchOrder."Document Type"::Order, Recpt."Order No.") then begin
            //                     Recpt."Fuel Issue No." := PurchOrder."Fuel Issue No.";
            //                     Recpt.Modify();
            //                 end;


            //             until Recpt.Next() = 0;
            //     end;

            // }
            action(UpdateShuntingdetails)
            {
                ApplicationArea = all;
                trigger OnAction()
                var
                    TripRec: Record Trip;
                    ShuntingRec: Record "Shunting Details";
                begin
                    // IF UserId <> 'TI' then
                    //     Error('you do not have permission');
                    ShuntingRec.Reset();
                    if ShuntingRec.FindFirst() then
                        repeat
                            TripRec.Reset();
                            TripRec.SetRange("Trip ID", ShuntingRec."Trip Id");
                            if TripRec.FindFirst() then begin
                                ShuntingRec."Global Dimension 1 Code" := TripRec."Global Dimension 1 Code";
                                ShuntingRec."Global Dimension 2 Code" := TripRec."Global Dimension 2 Code";
                                ShuntingRec."Shortcut Dimension 3 Code" := TripRec."Shortcut Dimension 3 Code";
                                ShuntingRec."Shortcut Dimension 4 Code" := TripRec."Shortcut Dimension 4 Code";
                                ShuntingRec."Shortcut Dimension 5 Code" := TripRec."Shortcut Dimension 5 Code";
                                ShuntingRec."Shortcut Dimension 6 Code" := TripRec."Shortcut Dimension 6 Code";
                                ShuntingRec."Shortcut Dimension 7 Code" := TripRec."Shortcut Dimension 7 Code";
                                ShuntingRec."Shortcut Dimension 8 Code" := TripRec."Shortcut Dimension 8 Code";
                                ShuntingRec.Modify();
                            end;
                        until ShuntingRec.Next() = 0;
                end;
            }

        }
    }
}
