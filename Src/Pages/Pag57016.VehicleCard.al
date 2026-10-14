page 57016 "Vehicle Card"
{
    Caption = 'Vehicle';
    SourceTable = "Fixed Asset";
    PageType = Card;
    DeleteAllowed = false;
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    Caption = 'Vehicle No.';
                    ApplicationArea = All;
                    //Editable = false;
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field("Make Code"; Rec."Make Code")
                {
                    ApplicationArea = All;
                }
                field("Model Code"; Rec."Model Code")
                {
                    ApplicationArea = All;
                }
                field("Trailer No."; Rec."Trailer No.")
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

                field(Country; Rec.Country)
                {
                    ApplicationArea = All;
                }
                field(Station; Rec.Station)
                {
                    ApplicationArea = All;
                }
                field("Vehicle used for"; Rec."Vehicle used for")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Type"; Rec."Vehicle Type")
                {
                    ApplicationArea = All;
                }
                field("Body Type"; Rec."Body Type")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Status"; Rec."Vehicle Status")
                {
                    ApplicationArea = All;
                }
                field("Fuel Type"; Rec."Fuel Type")
                {
                    ApplicationArea = All;
                }
                field("Balance Fuel"; Rec."Balance Fuel")
                {
                    ApplicationArea = All;
                }
                field("Date Registered"; Rec."Date Registered")
                {
                    ApplicationArea = All;
                }
                field("Manf.Year"; Rec."Manf.Year")
                {
                    ApplicationArea = All;
                }
                field("Booking location code"; Rec."Booking location code")
                {
                    ApplicationArea = All;
                }
                field("Next Inspection Date"; Rec."Next Inspection Date")
                {
                    ApplicationArea = All;
                }
                field("Next Service Date"; Rec."Next Service Date")
                {
                    ApplicationArea = All;
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }
            }
            group("Basic")
            {
                Caption = 'Basic';
                field("Exterior Colour"; Rec."Exterior Colour")
                {
                    ApplicationArea = All;
                }
                field("Interior Colour"; Rec."Interior Colour")
                {
                    ApplicationArea = All;
                }
                field("Key No."; Rec."Key No.")
                {
                    ApplicationArea = All;
                }
                field
                ("Vehicle Phone No."; Rec."Vehicle Phone No.")
                {
                    ApplicationArea = All;
                }
                field("Gross Vehicle Weight"; Rec."Gross Vehicle Weight")
                {
                    ApplicationArea = All;
                }
                field("Gearbox Type"; Rec."Gearbox Type")
                {
                    ApplicationArea = All;
                }
                field("No Of Doors"; Rec."No Of Doors")
                {
                    ApplicationArea = All;
                }
                field("Chassis No."; Rec."Chassis No.")
                {
                    ApplicationArea = All;
                }
                field("Engine No."; Rec."Engine No.")
                {
                    ApplicationArea = All;
                }
                field("Enginee Cc"; Rec."Engine CC")
                {
                    ApplicationArea = All;
                }
                field("Tank Size"; Rec."Tank Size")
                {
                    ApplicationArea = All;
                }
                field("Distance home to work"; Rec."Distance home to work")
                {
                    ApplicationArea = All;
                }


            }
            group(Diary)
            {
                Caption = 'Diary';
                group("Warranty Data")
                {
                    Caption = 'Warranty Data';
                    field("Warranty Date"; Rec."Warranty Date")
                    {
                        ApplicationArea = All;
                    }
                    field("Warranty distance"; Rec."Warranty distance")
                    {
                        ApplicationArea = All;
                    }
                    field("Warranty End Date"; Rec."Warranty End Date")
                    {
                        ApplicationArea = All;
                    }

                    field("Vehicle Owner"; Rec."Vehicle Owner")
                    {
                        ApplicationArea = All;
                    }

                    field("Initial licence fee"; Rec."Initial licence fee")
                    {
                        ApplicationArea = All;
                    }
                }
                group("Transit Good License")
                {
                    Caption = 'Transit Good License';
                    field("Transit goods License Expiry"; Rec."Transit goods License Expiry")
                    {
                        ApplicationArea = All;
                    }

                }
                group("Insurance Data")
                {
                    Caption = 'Insurance Data';
                    field("Insurance Company"; Rec."Insurance Company")
                    {
                        ApplicationArea = All;
                    }
                    field("Insurance Expiry Date"; Rec."Insurance Expiry Date")
                    {
                        ApplicationArea = All;
                    }

                }
                group("Service Data")
                {
                    Caption = 'Service Data';
                    field("Service Date"; Rec."Service Date")
                    {
                        ApplicationArea = All;
                    }
                    field("Last Service Type"; Rec."Last Service Type")
                    {
                        ApplicationArea = All;
                    }
                    field("Service interval(KMS)"; Rec."Service interval(KMS)")
                    {
                        ApplicationArea = All;
                    }
                    field("Service Odometer"; Rec."Service Odometer")
                    {
                        ApplicationArea = all;
                    }
                    field("Next Service Type"; Rec."Next Service Type")
                    {
                        ApplicationArea = All;
                    }
                    field("Next Service By Distance"; Rec."Next Service By Distance")
                    {
                        ApplicationArea = All;
                    }
                }
                group("Inspection Data")
                {
                    Caption = 'Inspection Data';
                    field("Inspection Date"; Rec."Inspection Date")
                    {
                        ApplicationArea = All;
                    }
                    field("Inspection Odometer"; Rec."Inspection Odometer")
                    {
                        ApplicationArea = All;
                    }
                    field("Next Inspection By Distance"; Rec."Next Inspection By Distance")
                    {
                        ApplicationArea = All;
                    }
                    field("Inspection Certificate No"; Rec."Inspection Certificate No.")
                    {
                        ApplicationArea = All;
                    }
                    field("Inspection Interval(KMs)"; Rec."Inspection Interval(KMs)")
                    {
                        ApplicationArea = All;
                    }
                    field("Inspected by"; Rec."Inspected by")
                    {
                        ApplicationArea = All;
                    }

                }
                group("Wheel Alignment")
                {
                    Caption = 'Wheel Alignment';
                    field("Wheel Alignent date"; Rec."Wheel Alignent date")
                    {
                        ApplicationArea = All;
                    }
                    field("Alignment Odometer"; Rec."Alignment Odometer")
                    {
                        ApplicationArea = All;
                    }
                    field("Alignment type"; Rec."Alignment type")
                    {
                        ApplicationArea = All;
                    }
                    field("Alignent interval(Distance)"; Rec."Alignent interval(Distance)")
                    {
                        ApplicationArea = All;
                    }
                    field("Next Alignment By Distance"; Rec."Next Alignment By Distance")
                    {
                        ApplicationArea = All;
                    }
                    field("Next Alignment Date"; Rec."Next Alignment Date")
                    {
                        ApplicationArea = All;
                    }


                }
                group("Speed Governor")
                {
                    Caption = 'Speed Governor';
                    field("Speed Governor installation"; Rec."Speed Governor installation")
                    {
                        ApplicationArea = All;
                    }
                    field("Speed Governor Certification"; Rec."Speed Governor Certification")
                    {
                        ApplicationArea = All;
                    }
                    field("Speed Governor expiry date"; Rec."Speed Governor expiry date")
                    {
                        ApplicationArea = All;
                    }

                }
                group("Tracking System")
                {
                    Caption = 'Tracking System';
                    field("Tracking System installation"; Rec."Tracking System installation")
                    {
                        ApplicationArea = All;
                    }
                    field("Tracking Certificate No."; Rec."Tracking Certificate No.")
                    {
                        ApplicationArea = All;
                    }
                    field("Tracking System expiry date"; Rec."Tracking System expiry date")
                    {
                        ApplicationArea = All;
                    }

                }

                group("Major Components")
                {
                    Caption = 'Major Components';
                    field("Front Tyre Make"; Rec."Front Tyre Make")
                    {
                        ApplicationArea = All;
                    }
                    field("Rear Tyre Make"; Rec."Rear Tyre Make")
                    {
                        ApplicationArea = All;
                    }
                    field("Battery Make"; Rec."Battery Make")
                    {
                        ApplicationArea = All;
                    }
                    field("Body Make"; Rec."Body Make")
                    {
                        ApplicationArea = All;
                    }
                    field("Gearbox Make"; Rec."Gearbox Make")
                    {
                        ApplicationArea = All;
                    }
                    field("Speed Govenor Make"; Rec."Speed Govenor Make")
                    {
                        ApplicationArea = All;
                    }
                    field("Tail Lift"; Rec."Tail Lift")
                    {
                        ApplicationArea = All;
                    }
                    field("Axle Type"; Rec."Axle Type")
                    {
                        ApplicationArea = All;
                    }
                    field("No. Of wheels"; Rec."No. Of wheels")
                    {
                        ApplicationArea = All;
                    }
                    field("Front Tyre Size"; Rec."Front Tyre Size")
                    {
                        ApplicationArea = All;
                    }
                    field("Rear Tyre Size"; Rec."Rear Tyre Size")
                    {
                        ApplicationArea = All;
                    }
                    field("Battery Size"; Rec."Battery Size")
                    {
                        ApplicationArea = All;
                    }
                    field("Body Serial"; Rec."Body Serial")
                    {
                        ApplicationArea = All;
                    }
                    field("Gear Box Serial"; Rec."Gear Box Serial")
                    {
                        ApplicationArea = All;
                    }
                    field("Speed Limited No."; Rec."Speed Limited No.")
                    {
                        ApplicationArea = All;
                    }
                    field("Tail No."; Rec."Tail No.")
                    {
                        ApplicationArea = All;
                    }
                    field("Axle No."; Rec."Axle No.")
                    {
                        ApplicationArea = All;
                    }
                    field("Fork Lift Height"; Rec."Fork Lift Height")
                    {
                        ApplicationArea = All;
                    }
                    field("Front Tyre PSI"; Rec."Front Tyre PSI")
                    {
                        ApplicationArea = All;
                    }
                    field("Rear Tyre PSI"; Rec."Rear Tyre PSI")
                    {
                        ApplicationArea = All;
                    }
                    field("Battery Type"; Rec."Battery Type")
                    {
                        ApplicationArea = All;
                    }
                    field("Speed Limiter Expiry Date"; Rec."Speed Limiter Expiry Date")
                    {
                        ApplicationArea = All;
                    }
                    field("Tail SWL"; Rec."Tail SWL")
                    {
                        ApplicationArea = All;
                    }
                    field("Axle Ratio"; Rec."Axle Ratio")
                    {
                        ApplicationArea = All;
                    }


                }
                group(Procurement)
                {
                    Caption = 'Procurement';


                }



            }
            group(Lease)
            {
                Caption = 'Lease';
                field("Supply method"; Rec."Supply method")
                {
                    ApplicationArea = All;
                }
                field("Contract start date"; Rec."Contract start date")
                {
                    ApplicationArea = All;
                }
                field("Contract RV payment"; Rec."Contract RV payment")
                {
                    ApplicationArea = All;
                }
                field("Contract No."; Rec."Contract No.")
                {
                    ApplicationArea = All;
                }
                field("Contract duration"; Rec."Contract duration")
                {
                    ApplicationArea = All;
                }
                field("Contract distance"; Rec."Contract distance")
                {
                    ApplicationArea = All;
                }
                field("Excess Charge"; Rec."Excess Charge")
                {
                    ApplicationArea = All;
                }
                field("Non driver reimbursement"; Rec."Non driver reimbursement")
                {
                    ApplicationArea = All;
                }
                field("Contract Maintenance"; Rec."Contract Maintenance")
                {
                    ApplicationArea = All;
                }
                field("Replaceent vehicle charge"; Rec."Replaceent vehicle charge")
                {
                    ApplicationArea = All;
                }
                field("Road tax charge"; Rec."Road tax charge")
                {
                    ApplicationArea = All;
                }
                field("Insurance(TP) charge"; Rec."Insurance(TP) charge")
                {
                    ApplicationArea = All;
                }
                field("Interest charge"; Rec."Interest charge")
                {
                    ApplicationArea = All;
                }
                field("Contract option code"; Rec."Contract option code")
                {
                    ApplicationArea = All;
                }
                field("Finance Co."; Rec."Finance Co.")
                {
                    ApplicationArea = All;
                }
                field("Lease end date"; Rec."Lease end date")
                {
                    ApplicationArea = All;
                }
                field("Contract RV payment date"; Rec."Contract RV payment date")
                {
                    ApplicationArea = All;
                }
                field("Sale preparation date"; Rec."Sale preparation date")
                {
                    ApplicationArea = All;
                }
                field("Contract annual distance"; Rec."Contract annual distance")
                {
                    ApplicationArea = All;
                }
                field("Management charge"; Rec."Management charge")
                {
                    ApplicationArea = All;
                }
                field("Tyres charge"; Rec."Tyres charge")
                {
                    ApplicationArea = All;
                }
                field("Recovery service charge"; Rec."Recovery service charge")
                {
                    ApplicationArea = All;
                }
                field("Insurance(other) charge"; Rec."Insurance(other) charge")
                {
                    ApplicationArea = All;
                }
                field("Monthly instalment"; Rec."Monthly instalment")
                {
                    ApplicationArea = All;
                }
                field("Contract net charge"; Rec."Contract net charge")
                {
                    ApplicationArea = All;
                }
                field("Electronically invoiced"; Rec."Electronically invoiced")
                {
                    ApplicationArea = All;
                }
                field("Toyota contract no"; Rec."Toyota contract no")
                {
                    ApplicationArea = All;
                }
                field("Vehicle release date"; Rec."Vehicle release date")
                {
                    ApplicationArea = All;
                }
                field("Lease contract no"; Rec."Lease contract no")
                {
                    ApplicationArea = All;
                }
                field("Interest base rate"; Rec."Interest base rate")
                {
                    ApplicationArea = All;
                }
                field("Interest margin rate"; Rec."Interest margin rate")
                {
                    ApplicationArea = All;
                }
                field("Interest total rate"; Rec."Interest total rate")
                {
                    ApplicationArea = All;
                }
                field("Non recoverable tax charge"; Rec."Non recoverable tax charge")
                {
                    ApplicationArea = All;
                }
                field("Monthly charge"; Rec."Monthly charge")
                {
                    ApplicationArea = All;
                }
                field("Total service charge"; Rec."Total service charge")
                {
                    ApplicationArea = All;
                }
                field("Contract finance"; Rec."Contract finance")
                {
                    ApplicationArea = All;
                }
                field("Total lease charge"; Rec."Total lease charge")
                {
                    ApplicationArea = All;
                }

                field("Winter tyres"; Rec."Winter tyres")
                {
                    ApplicationArea = All;
                }
                field("Finance adjustment"; Rec."Finance adjustment")
                {
                    ApplicationArea = All;
                }
                field("Total monthly charge"; Rec."Total monthly charge")
                {
                    ApplicationArea = All;
                }
            }
            group(Disposal)
            {
                Caption = 'Disposal';
                field("Sales condition"; Rec."Sales condition")
                {
                    ApplicationArea = All;
                }
                field("Date sale agreed"; Rec."Date sale agreed")
                {
                    ApplicationArea = All;
                }
                field("Auction date"; Rec."Auction date")
                {
                    ApplicationArea = All;
                }
                field("Sold odometer"; Rec."Sold odometer")
                {
                    ApplicationArea = All;
                }
                field("Sales comments"; Rec."Sales comments")
                {
                    ApplicationArea = All;
                }
                field("Payment date"; Rec."Payment date")
                {
                    ApplicationArea = All;
                }
                field("Sold reference"; Rec."Sold reference")
                {
                    ApplicationArea = All;
                }
                field("Sale reason"; Rec."Sale reason")
                {
                    ApplicationArea = All;
                }
                field("Vehicle sale price"; Rec."Vehicle sale price")
                {
                    ApplicationArea = All;
                }
                field("Sold Recipient"; Rec."Sold Recipient")
                {
                    ApplicationArea = All;
                }
                field("Recipient ID No."; Rec."Recipient ID No.")
                {
                    ApplicationArea = All;
                }
            }
            group(Note)
            {
                Caption = 'Note';
                field("Note 1"; Rec."Note 1")
                {
                    ApplicationArea = All;
                }
                field("Note 2"; Rec."Note 2")
                {
                    ApplicationArea = All;
                }
                field("Note 3"; Rec."Note 3")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.get(UserId);
        if not UserSetup."Vehicle Edit" then
            CurrPage.Editable := false
        else
            CurrPage.Editable := true;
    end;
    trigger OnAfterGetRecord()
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.get(UserId);
        if not UserSetup."Vehicle Edit" then
            CurrPage.Editable := false
        else
            CurrPage.Editable := true;
    end;
}