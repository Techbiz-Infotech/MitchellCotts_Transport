tableextension 57007 SalesHeadExt extends "Sales Header"
{
    fields
    {
        field(60100; "Trip Invoice"; Boolean)
        {
            Caption = 'Trip Invoice';
            DataClassification = ToBeClassified;
        }
        field(60101; "CU Number"; Code[50])
        {
            Caption = 'CU Number';
            DataClassification = ToBeClassified;
        }
        field(60102; "Global Dimension 2 Code_T"; Code[20])
        {
            Caption = 'Global Dimension 2 Code';
            DataClassification = ToBeClassified;
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(60103; "Route Code"; Code[20])
        {
            Caption = 'Route Code';
            DataClassification = ToBeClassified;
            TableRelation = Route where("Route Approval Status" = const(Approved));
        }
        field(60104; "Trip Type"; code[100])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('TRIP TYPE'),
                                                 "Dimension Value Type" = CONST(Standard),
                                                 Blocked = CONST(false));
        }
    }
    procedure CopyTripDocument()
    var
        CopySalesDocument: Report "Copy Trip Document";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        if IsHandled then
            exit;
        CopySalesDocument.SetSalesHeader(Rec);
        CopySalesDocument.RunModal();
    end;
}
