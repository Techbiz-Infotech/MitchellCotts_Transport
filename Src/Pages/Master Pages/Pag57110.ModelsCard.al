page 57110 "Models Card"
{
    Caption = 'Models';
    PageType = Card;
    SourceTable = Models;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Make Code"; Rec."Make Code")
                {
                    ApplicationArea = All;
                }
                field("Model Code"; Rec."Model Code")
                {
                    ApplicationArea = All;
                }
                field(Derivative;Rec.Derivative)
                {
                    ApplicationArea = All;
                }
                field("Vehicle Type"; Rec."Vehicle Type")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Tax Class"; Rec."Tax Class")
                {
                    ApplicationArea = All;
                }
                field("Fuel Type"; Rec."Fuel Type")
                {
                    ApplicationArea = All;
                }
                field(Co2gKm; Rec.Co2gKm)
                {
                    ApplicationArea = All;
                }
                field(BHP; Rec.BHP)
                {
                    ApplicationArea = All;
                }
                field("Fiscal hp"; Rec."Fiscal hp")
                {
                    ApplicationArea = All;
                }
                field("Gearbox Type"; Rec."Gearbox Type")
                {
                    ApplicationArea = All;
                }
                field("Target Fuel"; Rec."Target Fuel")
                {
                    ApplicationArea = All;
                }
                field("Target Fuel (Urban)"; Rec."Target Fuel (Urban)")
                {
                    ApplicationArea = All;
                }
                field("Target Cost"; Rec."Target Cost")
                {
                    ApplicationArea = All;
                }
                field("Service interval(Weeks)"; Rec."Service interval(Weeks)")
                {
                    ApplicationArea = All;
                }
                field("Service Schedule"; Rec."Service Schedule")
                {
                    ApplicationArea = All;
                }
                field("Employee Grade"; Rec."Employee Grade")
                {
                    ApplicationArea = All;
                }
                field("Tank Size"; Rec."Tank Size")
                {
                    ApplicationArea = All;
                }
                field("P11D Class"; Rec."P11D Class")
                {
                    ApplicationArea = All;
                }
                field("Engine Cc"; Rec."Engine Cc")
                {
                    ApplicationArea = All;
                }
                field("Gearbox Speed"; Rec."Gearbox Speed")
                {
                    ApplicationArea = All;
                }
                field("Variance fuel"; Rec."Variance fuel")
                {
                    ApplicationArea = All;
                }
                field("Target fuel (Extra urban)"; Rec."Target fuel (Extra urban)")
                {
                    ApplicationArea = All;
                }
                field("Variance Cost"; Rec."Variance Cost")
                {
                    ApplicationArea = All;
                }
                field("Service Int(KMS)"; Rec."Service Int(KMS)")
                {
                    ApplicationArea = All;
                }
            }
            group(Data)
            {
                Caption = 'Data';
                field(Country; Rec.Country)
                {
                    ApplicationArea = All;
                }
                field("CAP Code"; Rec."CAP Code")
                {
                    ApplicationArea = All;
                }
                field("Glass/ICME Code"; Rec."Glass/ICME Code")
                {
                    ApplicationArea = All;
                }
                field("CAP No.";Rec."CAP No.")
                {
                    ApplicationArea = All;
                }
                field("Glass/ICME ID"; Rec."Glass/ICME ID")
                {
                    ApplicationArea = All;
                }

            }
            group(Procurement)

            {
                Caption = 'Procurement';
                field("Date Registered"; Rec."Date Registered")
                {
                    ApplicationArea = All;
                }
                field("Date Purchased"; Rec."Date Purchased")
                {
                    ApplicationArea = All;
                }
                field("In Service date"; Rec."In Service date")
                {
                    ApplicationArea = All;
                }
                field("Odometer on fleet"; Rec."Odometer on fleet")
                {
                    ApplicationArea = All;
                }
                field("Manf.List Price"; Rec."Manf.List Price")
                {
                    ApplicationArea = All;
                }
                field("Total Options"; Rec."Total Options")
                {
                    ApplicationArea = All;
                }
                field(Delivery; Rec.Delivery)
                {
                    ApplicationArea = All;
                }
                field("Total Cost"; Rec."Total Cost")
                {
                    ApplicationArea = All;
                }
                field("Car Tax"; Rec."Car Tax")
                {
                    ApplicationArea = All;
                }
                field("Initial registration fee"; Rec."Initial registration fee")
                {
                    ApplicationArea = All;
                }
                field("Initial licence fee"; Rec."Initial licence fee")
                {
                    ApplicationArea = All;
                }
                field("Registration Received"; Rec."Registration Received")
                {
                    ApplicationArea = All;
                }
                field("Order No.";Rec."Order No.")
                {
                    ApplicationArea = All;
                }
                field("Order Reference"; Rec."Order Reference")
                {
                    ApplicationArea = All;
                }
                field(Supplier; Rec.Supplier)
                {
                    ApplicationArea = All;
                }
                field("List price tax"; Rec."List price tax")
                {
                    ApplicationArea = All;
                }
                field("Total extras"; Rec."Total extras")
                {
                    ApplicationArea = All;
                }
                field("Extras tax"; Rec."Extras tax")
                {
                    ApplicationArea = All;
                }
                field("Manufacturer Discount/Rebate"; Rec."Manufacturer Discount/Rebate")
                {
                    ApplicationArea = All;
                }
                field("Delivery VAT"; Rec."Delivery VAT")
                {
                    ApplicationArea = All;
                }
                field("Other tax"; Rec."Other tax")
                {
                    ApplicationArea = All;
                }
                field("Total tax"; Rec."Total tax")
                {
                    ApplicationArea = All;
                }
            }
            group(Lease)
            {
                Caption = 'Lease';
                field("Supply Method"; Rec."Supply Method")
                {
                    ApplicationArea = All;
                }
                field("Contract Duration"; Rec."Contract Duration")
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
                field("Contrat Maintenance"; Rec."Contrat Maintenance")
                {
                    ApplicationArea = All;
                }
                field("Replacement Vehicle Charge"; Rec."Replacement Vehicle Charge")
                {
                    ApplicationArea = All;
                }
                field("Road Tax Charge"; Rec."Road Tax Charge")
                {
                    ApplicationArea = All;
                }
                field("Insurance (TP) Charge"; Rec."Insurance (TP) Charge")
                {
                    ApplicationArea = All;
                }
                field("Contract CPK"; Rec."Contract CPK")
                {
                    ApplicationArea = All;
                }
                field("Other replacement vehicle"; Rec."Other replacement vehicle")
                {
                    ApplicationArea = All;
                }
                field("Other road tax"; Rec."Other road tax")
                {
                    ApplicationArea = All;
                }
                field("Other Insurance(TP)"; Rec."Other Insurance(TP)")
                {
                    ApplicationArea = All;
                }
                field("Other services"; Rec."Other services")
                {
                    ApplicationArea = All;
                }
                field("Drive private use payment"; Rec."Drive private use payment")
                {
                    ApplicationArea = All;
                }
                field("Finance Co"; Rec."Finance Co")
                {
                    ApplicationArea = All;
                }
                field("Contract distance"; Rec."Contract distance")
                {
                    ApplicationArea = All;
                }
                field("Target distance"; Rec."Target distance")
                {
                    ApplicationArea = All;
                }
                field(Penality; Rec.Penality)
                {
                    ApplicationArea = All;
                }
                field("Management Charge"; Rec."Management Charge")
                {
                    ApplicationArea = All;
                }
                field("Type Charge"; Rec."Type Charge")
                {
                    ApplicationArea = All;
                }
                field("Recovery service charge"; Rec."Recovery service charge")
                {
                    ApplicationArea = All;
                }
                field("Insurance (Other) Chage"; Rec."Insurance (Other) Chage")
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
                field("Winter Tyres"; Rec."Winter Tyres")
                {
                    ApplicationArea = All;
                }
                field("Other recovery"; Rec."Other recovery")
                {
                    ApplicationArea = All;
                }
                field("Other Insurance"; Rec."Other Insurance")
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
                field("Electronically Invoiced"; Rec."Electronically Invoiced")
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
                field("Recoverable tax charge"; Rec."Recoverable tax charge")
                {
                    ApplicationArea = All;
                }
                field("Total service charge"; Rec."Total service charge")
                {
                    ApplicationArea = All;
                }
                field("Contract Finance"; Rec."Contract Finance")
                {
                    ApplicationArea = All;
                }
                field("Total lease charge"; Rec."Total lease charge")
                {
                    ApplicationArea = All;
                }
                field("Other maintenance"; Rec."Other maintenance")
                {
                    ApplicationArea = All;
                }
                field("Other employer costs"; Rec."Other employer costs")
                {
                    ApplicationArea = All;
                }
                field("Other management"; Rec."Other management")
                {
                    ApplicationArea = All;
                }
                field("Total other services"; Rec."Total other services")
                {
                    ApplicationArea = All;
                }


            }
            group(Plating)
            {
                Caption = 'Plating';
                field(Weightax1; Rec.Weightax1)
                {
                    ApplicationArea = All;
                }
                field(Weightax2; Rec.Weightax2)
                {
                    ApplicationArea = All;
                }
                field(Weightax3; Rec.Weightax3)
                {
                    ApplicationArea = All;
                }
                field(Weightax4; Rec.Weightax4)
                {
                    ApplicationArea = All;
                }
                field("Weightax gvw"; Rec."Weightax gvw")
                {
                    ApplicationArea = All;
                }
                field("Weightax ulw"; Rec."Weightax ulw")
                {
                    ApplicationArea = All;
                }
                field(Train; Rec.Train)
                {
                    ApplicationArea = All;
                }
                field("Cab to Rear"; Rec."Cab to Rear")
                {
                    ApplicationArea = All;
                }
                field("Wheel span"; Rec."Wheel span")
                {
                    ApplicationArea = All;
                }
                field("Between centres"; Rec."Between centres")
                {
                    ApplicationArea = All;
                }
                field(Overall; Rec.Overall)
                {
                    ApplicationArea = All;
                }
                field("Cab to Axle"; Rec."Cab to Axle")
                {
                    ApplicationArea = All;
                }

            }
            group(Auditing)
            {
                Caption = 'Auditing';
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = All;
                }
                field("Last Modified by"; Rec."Last Modified by")
                {
                    ApplicationArea = All;
                }
                field("Last Modified Date"; Rec."Last Modified Date")
                {
                    ApplicationArea = All;
                }

            }



        }
    }

    actions
    {
        area(Navigation)
        {
            action("Model Options")
            {
                Caption = 'Model Options';
                ApplicationArea = All;
                RunObject = page "Model Code List";
            }
        }
    }

    var
        myInt: Integer;
}