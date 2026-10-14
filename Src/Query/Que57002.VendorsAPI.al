query 57002 VendorsAPI
{
    APIGroup = 'apiGroup';
    APIPublisher = 'Techbizinfotech';
    APIVersion = 'v1.0';
    EntityName = 'VendorsAPI';
    EntitySetName = 'VendorsAPI';
    QueryType = API;

    elements
    {
        dataitem(vendor; Vendor)
        {
            column(no; "No.")
            {
            }
            column(mobilePhoneNo; "Mobile Phone No.")
            {
            }
            column(name; Name)
            {
            }
            column(balance; Balance)
            {
            }
            column(balanceLCY; "Balance (LCY)")
            {
            }
            column(balanceDue; "Balance Due")
            {
            }
            column(balanceDueLCY; "Balance Due (LCY)")
            {
            }
            column(blocked; Blocked)
            {
            }
            column(creditAmount; "Credit Amount")
            {
            }
            column(crMemoAmounts; "Cr. Memo Amounts")
            {
            }
            column(genBusPostingGroup; "Gen. Bus. Posting Group")
            {
            }
            column(invAmountsLCY; "Inv. Amounts (LCY)")
            {
            }
            column(lastDateModified; "Last Date Modified")
            {
            }
            column(lastModifiedDateTime; "Last Modified Date Time")
            {
            }
            column(noOfOrders; "No. of Orders")
            {
            }
            column(paymentTermsCode; "Payment Terms Code")
            {
            }
            column(phoneNo; "Phone No.")
            {
            }
            column(pricesIncludingVAT; "Prices Including VAT")
            {
            }
            column(vatRegistrationNo; "VAT Registration No.")
            {
                Caption = 'KRA PIN';
            }
            column(vendorPostingGroup; "Vendor Posting Group")
            {
            }
            column(payments; Payments)
            {
            }
            column(paymentMethodCode; "Payment Method Code")
            {
            }
            column(eMail; "E-Mail")
            {
            }
            column(countryRegionCode; "Country/Region Code")
            {
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
