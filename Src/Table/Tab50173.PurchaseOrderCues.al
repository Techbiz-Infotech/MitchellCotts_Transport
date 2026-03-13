table 50173 "Purchase Order Cues"
{
    Caption = 'Purchase Order Cues';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary key"; Code[20])
        {
            Caption = 'Primary key';
        }
        field(2; "Open Purchase Order"; Integer)
        {
            Caption = 'Open Purchase Orders';
            FieldClass = FlowField;
            CalcFormula = count("Purchase Header" where("Document Type" = filter(Order), Status = const(Open)));
        }
        field(3; "Released Purchase Orders"; Integer)
        {
            Caption = 'Released Purchase Orders';
            FieldClass = FlowField;
            CalcFormula = count("Purchase Header" where("Document Type" = filter(Order), "Status" = filter(Released), "Quantity Received" = const(0)));
        }
        field(4; "Received Not Invoiced"; Integer)
        {
            Caption = 'Received Not Invoiced';
            FieldClass = FlowField;
            CalcFormula = Count("Purchase Header" where("Document Type" = filter(Order), "Status" = filter(Released), "Quantity Not Invoiced" = filter(true)));
        }
        field(5; "Invoiced Purchase Orders"; Integer)
        {
            Caption = 'Invoiced Purchase Orders';
            FieldClass = FlowField;
            CalcFormula = count("Purchase Header" where("Document Type" = filter(Order), "Status" = filter(Released), "Completely Invoiced" = filter(true)));
        }
    }
    keys
    {
        key(PK; "Primary key")
        {
            Clustered = true;
        }
    }

    procedure CalculatingQty()
    var
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
    begin
        PurchaseHeader.Reset();
        PurchaseHeader.SetRange("Document Type", PurchaseHeader."Document Type"::Order);
        if PurchaseHeader.FindFirst() then
            repeat
                PurchaseHeader."Quantity Not Invoiced" := false;
                PurchaseHeader."Completely Invoiced" := false;
                PurchaseHeader.Modify();
            until PurchaseHeader.Next() = 0;
        PurchaseHeader.Reset();
        PurchaseHeader.SetRange("Document Type", PurchaseHeader."Document Type"::Order);
        if PurchaseHeader.FindFirst() then
            repeat
                PurchaseHeader.CalcFields("Quantity Invoiced", "Quantity Received", "Quantity Ordered");
                if (PurchaseHeader."Quantity Received" > 0) or (PurchaseHeader."Quantity Invoiced" < PurchaseHeader."Quantity Received") then
                    PurchaseHeader."Quantity Not Invoiced" := true;

                if PurchaseHeader."Quantity Ordered" = PurchaseHeader."Quantity Invoiced" then
                    PurchaseHeader."Completely Invoiced" := true;
                PurchaseHeader.Modify();
            until PurchaseHeader.Next() = 0;


    end;

}
