report 57039 "MN-KRA HVO Per Vessel"
{
    ApplicationArea = All;
    Caption = 'MN-KRA HVO Per Vessel';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Reports/layout/HVOPerVessel.rdlc';
    dataset
    {
        dataitem(ManifestLine; "Manifest Line")
        {
            column(JobFileNo; "Job File No.")
            {
            }
            column(VesselName; "Vessel Name")
            {
            }
            column(VoyageNo; "Voyage No.")
            {
            }
            column(VesselArrivalDate; "Vessel Arrival Date")
            {
            }
            column(BLNo; "BL No.")
            {
            }
            column(ContainerChassisNo; "Container/Chassis No.")
            {
            }
            column(ShortcutDimension4Code; "Shortcut Dimension 4 Code")
            {
            }
            column(NoofBags; "No. of Bags")
            {
            }
            column(Weight; Weight)
            {
            }
            column(CBMTonage; "CBM Tonage")
            {
            }
            column(ConsigneeName; "Consignee Name")
            {
            }
            column(ConsigneeNo; "Consignee No.")
            {
            }
            column(Description; Description)
            {
            }
            column(ShippingAgent; "Shipping Agent")
            {
            }
            column(ShippingAgentName; "Shipping Agent Name")
            {
            }
            column(SealEngineNo; "Seal/Engine No.")
            {
            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
}
