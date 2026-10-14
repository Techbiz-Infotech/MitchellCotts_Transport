page 57081 FuelAllocations
{
    PageType = API;
    APIPublisher = 'Techbizinfotech';
    APIGroup = 'apiGroup';
    APIVersion = 'v1.0';
    EntityName = 'FuelAPI';
    EntitySetName = 'FuelAPI';
    SourceTable = "Fuel Issue";
    ODataKeyFields = SystemId;
    DelayedInsert = true;
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = true;

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                // Keys / system - read only
                field(systemId; Rec.SystemId) { Editable = false; }
                field(FuelIssueNo; Rec."Fuel Issue No.") { Editable = false; }
                field(Posted; Rec.Posted) { Editable = false; }
                field(DriverName; Rec."Driver Name") { Editable = false; }

                // Updatable fields
                field(DriverID; Rec."Driver ID") { }
                field(ExternalFuelLocation; Rec."External Fuel Location") { }
                field(ForClosedTrip; Rec."For Closed Trip?") { }
                field(FuelApprovalStatus; Rec."Fuel Approval Status") { }
                field(FuelIssueFor; Rec."Fuel Issue For") { }
                field(FuelReturnNo; Rec."Fuel Return No.") { }
                field(FuelReversed; Rec."Fuel Reversed") { }
                field(FuelSource; Rec."Fuel Source") { }
                field(FuelType; Rec."Fuel Type") { }
                field(PONo; Rec."PO No.") { }
                field(Pump; Rec.Pump) { }
                field(ShortcutDimension3Code; Rec."Shortcut Dimension 3 Code") { }
                field(ShortcutDimension4Code; Rec."Shortcut Dimension 4 Code") { }
                field(UnitCost; Rec."Unit Cost") { }
                field(Unitofmeasure; Rec."Unit of measure") { }
                field(VehicleNo; Rec."Vehicle No.") { }
                field(TripID; Rec."Trip ID") { }
                field(TrailerNo; Rec."Trailer No.") { }
                field(TankSize; Rec."Tank Size") { }
                field(PurchaseOrderNo; Rec."Purchase Order No.") { }
                field(GlobalDimension1Code; Rec."Global Dimension 1 Code") { }
                field(GlobalDimension2Code; Rec."Global Dimension 2 Code") { }
                field(BalanceFuelinTruck; Rec."Balance Fuel in Truck") { }
                field(IssueDate; Rec."Issue Date") { }
                field(NetRequirementInLitres; Rec."Net Requirement In Litres") { }
                field(RequiredFuelInLitres; Rec."Required Fuel In Litres") { }
                field(Remarks; Rec.Remarks) { }
                field(SalesPerson; Rec."Sales Person") { }
                field(ShortageReason; Rec."Shortage Reason") { }
                field(ShortageinLitersIfAny; Rec."Shortage in Liters(If Any)") { }
                field(PurchaseReceiptNo; Rec."Purchase Receipt No.") { }
            }
        }
    }
}