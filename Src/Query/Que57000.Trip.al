query 57000 Trip
{
    APIGroup = 'apiGroup';
    APIPublisher = 'Techbizinfotech';
    APIVersion = 'v1.0';
    EntityName = 'TripAPI';
    EntitySetName = 'TripAPI';
    QueryType = API;

    elements
    {
        dataitem(trip; Trip)
        {

            column(tripID; "Trip ID")
            {
            }
            column(vehicleNo; "Vehicle No.")
            {
            }
            column(allocatedTrailerNo; "Allocated Trailer No.")
            {
            }
            column(systemDeliveryDate; "System Delivery Date")
            {
            }
            column(consignmentType; "Consignment Type")
            {
            }
            column(tripDate; "Trip Date")
            {
            }
            column(vehicleType; "Vehicle Type")
            {
            }
            column(driverName; "Driver Name")
            {
            }
            column(mobileNo; "Mobile No.")
            {
            }
            column(nextInspectionDate; "Next Inspection Date")
            {
            }
            column(nextServiceDate; "Next Service Date")
            {
            }
            column(driverLicenseExpiry; "Driver License Expiry")
            {
            }
            column(vehicleFuelType; "Vehicle Fuel Type")
            {
            }
            column(tripStatus; "Trip Status")
            {
            }
            column(insuranceExpiryDate; "Insurance Expiry Date")
            {
            }
            column(transitGoodsExpiry; "Transit Goods Expiry")
            {
            }
            column(departureDate; "Departure Date")
            {
            }
            column(departureTime; "Departure Time")
            {
            }
            column(departureOdometerKm; "Departure Odometer(Km)")
            {
            }
            column(deliveryOdometerKm; "Delivery Odometer(Km)")
            {
            }
            column(fromSource; "From(Source)")
            {
            }
            column(toDestination; "To (Destination)")
            {
            }
            column(clientName; "Client Name")
            {
            }
            column(containerCharge; "Container Charge")
            {
            }
            column(looseCargoCharge; "Loose Cargo Charge")
            {
            }
            column(totalCharge; "Total Charge")
            {
            }
            column(expectedNoOfTrips; "Expected No Of Trips")
            {
            }
            column(registeredShuntingTrips; "Registered Shunting trips")
            {
            }
            column(containerNo; "Container No.")
            {
            }
            column(goodsDesc; "Goods desc")
            {
            }
            column(containerStatus; "Container Status")
            {
            }
            column(postedInvoices; "Posted Invoices")
            {
            }
            column(sealNo; "Seal No.")
            {
            }
            column(remarks; Remarks)
            {
            }
            column(driverID; "Driver ID")
            {
            }
            column(noSeries; "No. Series")
            {
            }
            column(invoiced; Invoiced)
            {
            }
            column(alternateTripID; "Alternate Trip ID")
            {
            }
            column(mileageIn; "Mileage In")
            {
            }
            column(mileageOut; "Mileage Out")
            {
            }
            column(kmTravelled; "KM Travelled")
            {
            }
            column(sealNo2; "Seal No. 2")
            {
            }
            column(routeCode; "Route Code")
            {
            }
            column(standardRoutePrice; "Standard Route Price")
            {
            }
            column(offeredRoutePrice; "Offered Route Price")
            {
            }
            column(routePriceDeviation; "Route Price Deviation")
            {
            }
            column(routeDriversAllowance; "Route Drivers Allowance")
            {
            }
            column(actualDriversAllowance; "Actual Drivers Allowance")
            {
            }
            column(routeAllowanceDeviation; "Route Allowance Deviation")
            {
            }
            column(delivered; Delivered)
            {
            }
            column(totalFuelExpected; "Total Fuel Expected")
            {
            }
            column(shuntingFuelBalance; "Shunting Fuel Balance")
            {
            }
            column(overdueTATInDays; "Overdue TAT In Days")
            {
            }
            column(detentionReason; "Detention Reason")
            {
            }
            column(alternateTrip; "Alternate Trip?")
            {
            }
            column(detentionDays; "Detention Days")
            {
            }
            column(actualDeliveryDate; "Actual Delivery Date")
            {
            }
            column(deliveryTime; "Delivery Time")
            {
            }
            column(clientNo; "Client No.")
            {
            }
            column(tatInDays; "TAT In Days")
            {
            }
            column(actualTripDays; "Actual Trip Days")
            {
            }
            column(dueDate; "Due Date")
            {
            }
            column(routeKm; "Route Km")
            {
            }
            column(weighBridgeChargesAppl; "Weigh Bridge Charges Appl")
            {
            }
            column(weighBridgeCharges; "WeighBridge charges")
            {
            }
            column(includeDepartureDay; "Include Departure Day")
            {
            }
            column(gatepassNo; "Gatepass No.")
            {
            }
            column(fuelPosted; "Fuel Posted")
            {
            }
            column(inspectionNo; "Inspection No.")
            {
            }
            column(inspectionCompleted; "Inspection Completed")
            {
            }
            column(containerSize2; "Container Size 2")
            {
            }
            column(containerType2; "Container Type 2")
            {
            }
            column(containerNo2; "Container No. 2")
            {
            }
            column(goodsDescription2; "Goods description 2")
            {
            }
            column(containerStatus2; "Container Status 2")
            {
            }
            column(remarks2; "Remarks 2")
            {
            }
            column(containerType; "Container Type")
            {
            }
            column(containerSize; "Container Size")
            {
            }
            column(deliveryNoteNo; "Delivery Note No")
            {
            }
            column(interchangeNo; "Interchange No")
            {
            }
            column(bookingNo; "Booking No")
            {
            }
            column(additionalRemarks; "Additional Remarks")
            {
            }
            column(truck; "Global Dimension 1 Code")
            {
            }
            column(triptype; "Global Dimension 2 Code")
            {
            }
            column(tripidDim; "Shortcut Dimension 3 Code")
            {
            }
            column(driverDim; "Shortcut Dimension 4 Code")
            {
            }
            column(salespersonDim; "Shortcut Dimension 5 Code")
            {
            }
            column(locationDim; "Shortcut Dimension 6 Code")
            {
            }
            
            column(consumedFuelInLitres; "Consumed Fuel In Litres")
            {
            }
            column(consumedPettyCash; "Consumed Petty Cash")
            {
            }
            column(terminationDate; "Termination Date")
            {
            }
            column(totalFuelIssued; "Total Fuel Issued")
            {
            }
            column(tripTerminated; "Trip Terminated?")
            {
            }
            column(tripStage; "Trip Stage")
            {
            }
            column(balanceFuelInTruck; "Balance Fuel in Truck")
            {
            }
            column(balanceToTranferAfterTerm; "Balance to Tranfer after Term")
            {
            }
            column(transferFuelToAlternTrip; "Transfer fuel to altern Trip?")
            {
            }
            column(fuelReturnAfterTermination; "Fuel Return after Termination?")
            {
            }
            column(tripCategory; "Trip Category")
            {
            }
            column(postedTripInvoices; "Posted Trip Invoices")
            {
            }
            column(postedTripCreditMemos; "Posted Trip Credit Memos")
            {
            }

        }
    }




    trigger OnBeforeOpen()
    begin

    end;
}
