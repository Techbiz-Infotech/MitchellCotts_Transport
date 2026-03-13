page 50239 "Vehicle Fuel Log list"
{
    ApplicationArea = All;
    Caption = 'Vehicle Fuel Log';
    PageType = List;
    SourceTable = "Vehicle Fuel Log";
    UsageCategory = Lists;
    //Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                    Editable = FieldsEditable;
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date field.';
                    Editable = FieldsEditable;
                }
                field("Entry Type"; Rec."Entry Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Entry Type field.';
                    Editable = FieldsEditable;
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vehicle No. field.';
                    Editable = FieldsEditable;
                }
                field("Driver ID."; Rec."Driver ID.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Driver ID. field.';
                    Editable = FieldsEditable;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.';
                    Editable = FieldsEditable;
                }
                field("Trip Id"; Rec."Trip Id")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Trip Id field.';
                    Editable = FieldsEditable;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity field.';
                    Editable = FieldsEditable;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Remarks field.';
                    Editable = FieldsEditable;
                }
                field("System Created"; Rec."System Created")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the System Created field.';
                    Editable = FieldsEditable;
                }
                field("Global Dimension 1 Code1"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type of Trip field.';
                    Visible = DimVisible1;
                    Editable = FieldsEditable;

                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                    Visible = DimVisible2;
                    Editable = FieldsEditable;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                    Visible = DimVisible3;
                    Editable = FieldsEditable;
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.';
                    Visible = DimVisible4;
                    Editable = FieldsEditable;
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 5 Code field.';
                    Visible = DimVisible5;
                    Editable = FieldsEditable;
                }
                field("Shortcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 6 Code field.';
                    Visible = DimVisible6;
                    Editable = FieldsEditable;
                }
                field("Shortcut Dimension 7 Code"; Rec."Shortcut Dimension 7 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 7 Code field.';
                    Visible = DimVisible7;
                    Editable = FieldsEditable;
                }
                field("Shortcut Dimension 8 Code"; Rec."Shortcut Dimension 8 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 8 Code field.';
                    Visible = DimVisible8;
                    Editable = FieldsEditable;
                }
            }
        }
    }
    var
        FieldsEditable: Boolean;
        DimVisible1: Boolean;
        DimVisible2: Boolean;
        DimVisible3: Boolean;
        DimVisible4: Boolean;
        DimVisible5: Boolean;
        DimVisible6: Boolean;
        DimVisible7: Boolean;
        DimVisible8: Boolean;

    local procedure SetDimensionsVisibility()
    var
        DimMgt: Codeunit DimensionManagement;
    begin
        DimVisible1 := false;
        DimVisible2 := false;
        DimVisible3 := false;
        DimVisible4 := false;
        DimVisible5 := false;
        DimVisible6 := false;
        DimVisible7 := false;
        DimVisible8 := false;
        //FieldsEditable := false;
        DimMgt.UseShortcutDims(
          DimVisible1, DimVisible2, DimVisible3, DimVisible4, DimVisible5, DimVisible6, DimVisible7, DimVisible8);

        Clear(DimMgt);

    end;

    trigger OnOpenPage()
    var
        UserSetup: Record "User Setup";
    begin
        Editfields();
        SetDimensionsVisibility();
    end;

    trigger OnAfterGetCurrRecord()
    var
        UserSetup: Record "User Setup";
    begin
        Editfields();
        //SetDimensionsVisibility();
    end;

    procedure Editfields()
    var
        UserSetup: Record "User Setup";
    begin
        if UserSetup.get(UserId) then begin
            if not UserSetup."Fuel Log Edit" then
                FieldsEditable := false
            else
                FieldsEditable := true;
        end;
    end;
}
