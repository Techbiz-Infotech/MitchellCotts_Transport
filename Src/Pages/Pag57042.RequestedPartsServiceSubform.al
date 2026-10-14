page 57042 "Requested Parts/Service"
{
    ApplicationArea = All;
    Caption = 'Requested Parts/Services';
    PageType = ListPart;
    SourceTable = "Requested Parts/Service Line";
    UsageCategory = Lists;
    MultipleNewLines = true;
    AutoSplitKey = true;
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Job Card No."; Rec."Job Card No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.';
                    Visible = false;
                    Editable = LineEditable;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line No. field.';
                    Visible = false;
                    Editable = LineEditable;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
                    Editable = LineEditable;
                }
                field("No."; Rec."No.")
                {
                    Caption = 'No.';
                    ApplicationArea = All;
                    Editable = LineEditable;
                    ToolTip = 'Specifies the value of the No. field.';
                    TableRelation = Item;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                    Editable = LineEditable;
                }
                field("Request Quantity"; Rec."Request Quantity")
                {
                    ApplicationArea = All;
                    Editable = LineEditable;
                    ToolTip = 'Specifies the value of the Request Quantity field.';
                }
                field("Return Quantity"; Rec."Return Quantity")
                {
                    ApplicationArea = All;
                    // Editable = LineEditable;
                    ToolTip = 'Specifies the value of the Return Quantity field.';
                }
                field("Requested Date"; Rec."Requested Date")
                {
                    ApplicationArea = All;
                    
                    ToolTip = 'Specifies the value of the Requested Date field.';
                }
                field("Stock Request No."; Rec."Stock Request No.")
                {
                    ApplicationArea = All;
                    
                    ToolTip = 'Specifies the value of the Stock Request No. field.';
                }
                field("Stock Requested"; Rec."Stock Requested")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Stock Requested field.';
                }
                field("Stock Return";Rec."Stock Return")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Stock Return No field.';
                }
                field("Issued Quantity"; Rec."Issued Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Issued Quantity field.';
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        LineEdit;
    end;

    trigger OnAfterGetRecord()
    begin
        LineEdit;
    end;
    trigger OnAfterGetCurrRecord()
    begin
        LineEdit;
    end;

    var
        LineEditable: Boolean;

    procedure LineEdit()
    var
        myInt: Integer;
    begin
        if Rec."Stock Requested" then
            LineEditable := false
        else
            LineEditable := true;
    end;
}
