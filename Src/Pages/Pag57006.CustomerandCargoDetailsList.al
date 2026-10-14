page 57006 "Customer and Cargo Detail List"
{
    //ApplicationArea = All;
    Caption = 'Customer and Cargo Details';
    PageType = List;
    CardPageId = "Customer and Cargo Detail card";
    SourceTable = "Customer and Cargo Details";
    //UsageCategory = Lists;
    InsertAllowed = false;
    ModifyAllowed = false;
    Editable = false;
    DeleteAllowed = false;


    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;

                }
                field("Trip ID"; Rec."Trip ID")
                {
                    ApplicationArea = All;
                }
                field("D/Note No."; Rec."D/Note No.")
                {
                    ApplicationArea = All;
                }
                field(Number; Rec.Number)
                {
                    ApplicationArea = All;
                }
                field("Departure Date"; Rec."Departure Date")
                {
                    ApplicationArea = All;
                }
                field("Departure Time"; Rec."Departure Time")
                {
                    ApplicationArea = All;
                }
                field("Departure Odometer"; Rec."Departure Odometer")
                {
                    ApplicationArea = All;
                }
                field("Route Name"; Rec."Route Name")
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
                field("Loading Date"; Rec."Loading Date")
                {
                    ApplicationArea = All;
                }
                field("Loading File No."; Rec."Loading File No.")
                {
                    ApplicationArea = All;
                }
                field("Loading InterCharge No."; Rec."Loading InterCharge No.")
                {
                    ApplicationArea = All;
                }
                field("Loading Comments"; Rec."Loading Comments")
                {
                    ApplicationArea = All;
                }
                field("Loading Checklist No."; Rec."Loading Checklist No.")
                {
                    ApplicationArea = All;
                }
                field("Clearing Agent Name"; Rec."Clearing Agent Name")
                {
                    ApplicationArea = All;
                }
                field("Clearing Agent Address"; Rec."Clearing Agent Address")
                {
                    ApplicationArea = All;
                }
                field("Consignee Name"; Rec."Consignee Name")
                {
                    ApplicationArea = All;
                }
                field("Consignee Address"; Rec."Consignee Address")
                {
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Arrival Date(Customer)"; Rec."Arrival Date(Customer)")
                {
                    ApplicationArea = All;
                }
                field("Arrival Time(Customer)"; Rec."Arrival Time(Customer)")
                {
                    ApplicationArea = All;
                }
                field("Client arrival odometer"; Rec."Client arrival odometer")
                {
                    ApplicationArea = All;
                }
                field("Departure Date(Customer)"; Rec."Departure Date(Customer)")
                {
                    ApplicationArea = All;
                }
                field("Departure Time(Customer)"; Rec."Departure Time(Customer)")
                {
                    ApplicationArea = All;
                }
                field("Offloading Date"; Rec."Offloading Date")
                {
                    ApplicationArea = All;
                }
                field("Offloading Time"; Rec."Offloading Time")
                {
                    ApplicationArea = All;
                }
                field("Offloading delay (Days)"; Rec."Offloading delay (Days)")
                {
                    ApplicationArea = All;
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;
                }
                field("Trailer Type"; Rec."Trailer Type")
                {
                    ApplicationArea = All;
                }
                field("Cargo Type"; Rec."Cargo Type")
                {
                    ApplicationArea = All;
                }
                field("Vessel No."; Rec."Vessel No.")
                {
                    ApplicationArea = All;
                }
                field("Container Size"; Rec."Container Size")
                {
                    ApplicationArea = All;
                }
                field("Container Type"; Rec."Container Type")
                {
                    ApplicationArea = All;
                }
                field("Container No."; Rec."Container No.")
                {
                    ApplicationArea = All;
                }
                field("Goods desc"; Rec."Goods desc")
                {
                    ApplicationArea = All;
                }
                field("Container Status"; Rec."Container Status")
                {
                    ApplicationArea = All;
                }
                field("Marks & No."; Rec."Marks & No.")
                {
                    ApplicationArea = All;
                }
                field("Tare Weight"; Rec."Tare Weight")
                {
                    ApplicationArea = All;
                }
                field("Seal No."; Rec."Seal No.")
                {
                    ApplicationArea = All;
                }
                field(Weight; Rec.Weight)
                {
                    ApplicationArea = All;
                }
                field("Shipping Line"; Rec."Shipping Line")
                {
                    ApplicationArea = All;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                }
                field("Container Size 2"; Rec."Container Size 2")
                {
                    ApplicationArea = All;
                }
                field("Container Type 2"; Rec."Container Type 2")
                {
                    ApplicationArea = All;
                }
                field("Container No. 2"; Rec."Container No. 2")
                {
                    ApplicationArea = All;
                }
                field("Goods description 2"; Rec."Goods description 2")
                {
                    ApplicationArea = All;
                }
                field("Container Status 2"; Rec."Container Status 2")
                {
                    ApplicationArea = All;
                }
                field("Marks & No.2"; Rec."Marks & No.2")
                {
                    ApplicationArea = All;
                }
                field("Tare Weight 2"; Rec."Tare Weight 2")
                {
                    ApplicationArea = All;
                }
                field("Seal No. 2"; Rec."Seal No. 2")
                {
                    ApplicationArea = All;
                }
                field("Weight 2"; Rec."Weight 2")
                {
                    ApplicationArea = All;
                }
                field("Shipping Line 2"; Rec."Shipping Line 2")
                {
                    ApplicationArea = All;
                }
                field("Remarks 2"; Rec."Remarks 2")
                {
                    ApplicationArea = All;
                }
                field("Loose Cargo Charge"; Rec."Loose Cargo Charge")
                {
                    ApplicationArea = All;
                }
                field("Total Charge"; Rec."Total Charge")
                {
                    ApplicationArea = All;
                }


            }
        }
    }

}