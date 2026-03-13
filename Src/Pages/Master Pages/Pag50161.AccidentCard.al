page 50161 "Accident Card"
{
    Caption = 'Accident';
    PageType = Card;
    SourceTable = Accidents;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Accident No."; Rec."Accident No.")
                {
                    ApplicationArea = All;
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field("Accident ref."; Rec."Accident ref.")
                {
                    ApplicationArea = All;
                }
                field("Accident Status"; Rec."Accident Status")
                {
                    ApplicationArea = All;
                }
                field("Liability Flag"; Rec."Liability Flag")
                {
                    ApplicationArea = All;
                }
                field("Party To Blame"; Rec."Party To Blame")
                {
                    ApplicationArea = All;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                }
                field("Date Accident Report For Rec"; Rec."Date Accident Report For Rec")
                {
                    ApplicationArea = All;
                }
                field("Insurance Company No."; Rec."Insurance Company No.")
                {
                    ApplicationArea = All;
                }
                field("Insurance Company"; Rec."Insurance Company")
                {
                    ApplicationArea = All;
                }
                field("Insurers Reference"; Rec."Insurers Reference")
                {
                    ApplicationArea = All;
                }
                field("Brokers Name"; Rec."Brokers Name")
                {
                    ApplicationArea = All;
                }
                field("Brokers Reference"; Rec."Brokers Reference")
                {
                    ApplicationArea = All;
                }
                field("Claim Handler"; Rec."Claim Handler")
                {
                    ApplicationArea = All;
                }
                field("Date Claim Completed"; Rec."Date Claim Completed")
                {
                    ApplicationArea = All;
                }
                field("Solicitors Name"; Rec."Solicitors Name")
                {
                    ApplicationArea = All;
                }
                field("Solicitors Reference"; Rec."Solicitors Reference")
                {
                    ApplicationArea = All;
                }

            }
            group(Driver)
            {
                Caption = 'Driver';
                field(Drivers; Rec.Driver)
                {
                    ApplicationArea = All;
                }
                field("Driver Id"; Rec."Driver Id")
                {
                    ApplicationArea = All;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = All;
                }
                field("Driver Date of Birth"; Rec."Driver Date of Birth")
                {
                    ApplicationArea = All;
                }
                field("Licence No.";Rec."Licence No.")
                {
                    ApplicationArea = All;
                }
                field("Phone No.";Rec."Phone No.")
                {
                    ApplicationArea = All;
                }
                field("Home Address"; Rec."Home Address")
                {
                    ApplicationArea = All;
                }

            }
            group(Vehicle)
            {
                Caption = 'Vehicle';
                field("Other Vehicle Involved"; Rec."Other Vehicle Involved")
                {
                    ApplicationArea = All;
                }
             
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ApplicationArea = All;
                }
                field("Car/Commercial"; Rec."Car/Commercial")
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
                field("Engine Cc"; Rec."Engine Cc")
                {
                    ApplicationArea = All;
                }
                field("Fuel Type"; Rec."Fuel Type")
                {
                    ApplicationArea = All;
                }
                field("Current Mileage"; Rec."Current Mileage")
                {
                    ApplicationArea = All;
                }
            }
            group("Hire Vehicle")
            {
                Caption = 'Hire Vehicle';
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
                field("Hire Vehicle Make"; Rec."Hire Vehicle Make")
                {
                    ApplicationArea = All;
                }
                field("Hire vehicle model"; Rec."Hire vehicle model")
                {
                    ApplicationArea = All;
                }
                field(Cc; Rec.Cc)
                {
                    ApplicationArea = All;
                }
                field("Fuel Type1"; Rec."Fuel Type")
                {
                    ApplicationArea = All;
                }

            }
            group(Incident)
            {
                Caption = 'Incident';
                field("Incident Type"; Rec."Incident Type")
                {
                    ApplicationArea = All;
                }
                field("Public Liability Claim rec by"; Rec."Public Liability Claim rec by")
                {
                    ApplicationArea = All;
                }
                field("Full Incident Description"; Rec."Full Incident Description")
                {
                    ApplicationArea = All;
                }
                field("Exact Location"; Rec."Exact Location")
                {
                    ApplicationArea = All;
                }
                field(Weather; Rec.Weather)
                {
                    ApplicationArea = All;
                }
                field("Speed at Time of Incident"; Rec."Speed at Time of Incident")
                {
                    ApplicationArea = All;
                }
                field("Speed Limit"; Rec."Speed Limit")
                {
                    ApplicationArea = All;
                }
                field("Street Lights"; Rec."Street Lights")
                {
                    ApplicationArea = All;
                }
                field("Road Type"; Rec."Road Type")
                {
                    ApplicationArea = All;
                }
                field("Road Conditions"; Rec."Road Conditions")
                {
                    ApplicationArea = All;
                }
                field("Use of Vehicle at time of Inc"; Rec."Use of Vehicle at time of Inc")
                {
                    ApplicationArea = All;
                }
                field("Current location"; Rec."Current location")
                {
                    ApplicationArea = All;
                }
                field("Damage to our vehicle"; Rec."Damage to our vehicle")
                {
                    ApplicationArea = All;
                }
                field(Damage; Rec.Damage)
                {
                    ApplicationArea = All;
                }
                field("Accident Date"; Rec."Accident Date")
                {
                    ApplicationArea = All;
                }
                field("Time of incident"; Rec."Time of incident")
                {
                    ApplicationArea = All;
                }
                field("Incident time range"; Rec."Incident time range")
                {
                    ApplicationArea = All;
                }
                group("Your Vehicle")
                {
                    Caption = 'Your Vehicle';
                    field(Lights; Rec.Lights)
                    {
                        ApplicationArea = All;
                    }
                    field(Signalling; Rec.Signalling)
                    {
                        ApplicationArea = All;
                    }

                }
                group("Other Vehicle")
                {
                    Caption = 'Other Vehicle';
                    field(Light; Rec.Lights)
                    {
                        ApplicationArea = All;
                    }
                    field(Signallings; Rec.Signalling)
                    {
                        ApplicationArea = All;
                    }


                }
            }
            group("Corrective Action taken to prevent re-occurrence")
            {
                Caption = 'Corrective Action taken to prevent re-occurrence';
                field("Corrective Action"; Rec."Corrective Action")
                {
                    ApplicationArea = All;
                }

                field("Hsse Review"; Rec."Hsse Review")
                {
                    ApplicationArea = All;
                }

            }
            group(Theft)
            {
                Caption = 'Theft';
                field("Vehicle Broken Into"; Rec."Vehicle Broken Into")
                {
                    ApplicationArea = All;
                }
                field("Were all Doors Locked?"; Rec."Were all Doors Locked?")
                {
                    ApplicationArea = All;
                }
                field("How was Entry Gained?"; Rec."How was Entry Gained?")
                {
                    ApplicationArea = All;
                }
                field("Where was Entry Gained?"; Rec."Where was Entry Gained?")
                {
                    ApplicationArea = All;
                }
                field("Has the vehicle been Rec"; Rec."Has the vehicle been Rec")
                {
                    ApplicationArea = All;
                }
            }
            group(VRO)
            {
                Caption = 'VRO';
                group(Repairs)
                {
                    Caption = 'Repairs';
                    field("Garage Name"; Rec."Garage Name")
                    {
                        ApplicationArea = All;
                    }
                    field("Garage Telephone No.";Rec."Garage Telephone No.")
                    {
                        ApplicationArea = All;
                    }
                    field("Vehicle Booking Date"; Rec."Vehicle Booking Date")
                    {
                        ApplicationArea = All;
                    }
                  
                    field("Date Engineer Notified"; Rec."Date Engineer Notified")
                    {
                        ApplicationArea = All;
                    }
                    field("Completion Date"; Rec."Completion Date")
                    {
                        ApplicationArea = All;
                    }
                    group("Total Loss")
                    {
                        Caption = 'Total Loss';
                        field("Write Off"; Rec."Write Off")
                        {
                            ApplicationArea = All;
                        }
                        field("Write Off Category"; Rec."Write Off Category")
                        {
                            ApplicationArea = All;
                        }
                        field("Total Loss Confirmed"; Rec."Total Loss Confirmed")
                        {
                            ApplicationArea = All;
                        }
                        field("Settlement Figure Requested"; Rec."Settlement Figure Requested")
                        {
                            ApplicationArea = All;
                        }
                        field("Settlement Invoice Received"; Rec."Settlement Invoice Received")
                        {
                            ApplicationArea = All;
                        }
                        field("Salvage Offer Received"; Rec."Salvage Offer Received")
                        {
                            ApplicationArea = All;
                        }
                        field("Salvage Cheque Received"; Rec."Salvage Cheque Received")
                        {
                            ApplicationArea = All;
                        }
                        group(Hire)
                        {
                            Caption = 'Hire';
                            
                            field("Vehicle Hired From"; Rec."Vehicle Hired From")
                            {
                                ApplicationArea = All;
                            }
                            field("Vehicle Hired To"; Rec."Vehicle Hired To")
                            {
                                ApplicationArea = All;
                            }
                            field("Repair Review Date"; Rec."Repair Review Date")
                            {
                                ApplicationArea = All;
                            }
                        }
                    }
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
        area(Navigation)
        {
            action("Third Party Details")
            {
                Caption = 'Third Party Details';
                ApplicationArea = All;
                RunObject = page "Third Party List";

            }
            action(Costs)
            {
                Caption = 'Costs';
                ApplicationArea = All;
                RunObject = page Cost;

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
}
