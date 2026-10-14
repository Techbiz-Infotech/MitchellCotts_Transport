page 57055 "Disposal Request List"
{
    ApplicationArea = All;
    Caption = 'Disposal Request List';
    PageType = List;
    Editable = false;
    SourceTable = Disposal;
    CardPageId = "Disposal Request";
    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("No."; Rec."No.") { ApplicationArea = All; }
                field("Disposal Need"; Rec."Disposal Need") { ApplicationArea = All; }
                field(Type; Rec.Type) { ApplicationArea = All; }
                field("Asset/Item No."; Rec."Asset/Item No.") { ApplicationArea = All; }
                field(Description; Rec.Description) { ApplicationArea = All; }
                field(Quantity; Rec.Quantity) { ApplicationArea = All; }
                field("Location Code"; Rec."Location Code") { ApplicationArea = All; }
                field("Net Book Value"; Rec."Net Book Value") { ApplicationArea = All; }
                field("Disposal Method"; Rec."Disposal Method") { ApplicationArea = All; }
                field(Status; Rec.Status) { ApplicationArea = All; }
                field("Request Date"; Rec."Request Date") { ApplicationArea = All; }
                field("Requested By"; Rec."Requested By") { ApplicationArea = All; }
            }
        }
    }
}
