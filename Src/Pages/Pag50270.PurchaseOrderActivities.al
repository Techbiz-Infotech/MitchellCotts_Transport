page 50270 "IMS PurchaseOrderActivities"
{
    ApplicationArea = All;
    Caption = 'PO Activities';
    SourceTable = "Purchase Order Cues";
    PageType = CardPart;

    layout
    {
        area(content)
        {
            cuegroup(Trip)
            {
                Caption = 'Purchase Orders';

                field("Open Purchase Order"; Rec."Open Purchase Order")
                {
                    DrillDownPageId = "Purchase Order List";
                    ApplicationArea = all;
                }
                field("Released Purchase Orders"; Rec."Released Purchase Orders")
                {
                    DrillDownPageId = "Purchase Order List";
                    ApplicationArea = all;
                }
                field("Received Not Invoiced"; Rec."Received Not Invoiced")
                {
                    DrillDownPageId = "Purchase Order List";
                    ApplicationArea = all;
                }
                field("Invoiced Purchase Orders"; Rec."Invoiced Purchase Orders")
                {
                    DrillDownPageId = "Purchase Order List";
                    ApplicationArea = all;
                }
            }
        }
    }
    trigger OnOpenPage()
    var

    begin
        Rec.CalculatingQty();
        rec.Reset;
        if not rec.Get then begin
            rec.Init;
            rec.Insert;
        end;
        Rec.CalculatingQty();
    end;

}
