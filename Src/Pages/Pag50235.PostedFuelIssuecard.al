page 50235 "Posted Fuel Issue card"
{
    Caption = 'Posted Fuel Issue card';
    PageType = Card;
    SourceTable = "Fuel Issue";
    SourceTableView = where(Posted = filter(true));
    Editable = false;
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Fuel Issue No."; Rec."Fuel Issue No.")
                {
                    ApplicationArea = All;
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field("Issue Date"; Rec."Issue Date")
                {
                    ApplicationArea = All;
                }
                field("Fuel Type"; Rec."Fuel Type")
                {
                    ApplicationArea = All;
                }
                field("Fuel Issue For"; Rec."Fuel Issue For")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Fuel Source"; Rec."Fuel Source")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    trigger OnValidate()
                    begin
                        //UnitCostEdit();
                        CurrPage.Update(false);
                    end;
                }
                field("For Closed Trip?"; Rec."For Closed Trip?")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Trip ID"; Rec."Trip ID")
                {
                    ApplicationArea = All;
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ApplicationArea = All;
                }
                field("Trailer No."; Rec."Trailer No.")
                {
                    ApplicationArea = All;
                }
                field("Tank Size"; Rec."Tank Size")
                {
                    ApplicationArea = All;
                }
                field("Driver ID"; Rec."Driver ID")
                {
                    ApplicationArea = All;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = All;
                }
                field(Pump; Rec.Pump)
                {
                    ApplicationArea = All;
                }
                field("Fueling Station Name"; Rec."Fueling Station Name")
                {
                    ApplicationArea = All;
                }
                field(Odometer; Rec.Odometer)
                {
                    ApplicationArea = All;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Editable = false;
                }
                field("Shortcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
                {
                    ApplicationArea = All;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                }
                field("Unit of measure"; Rec."Unit of measure")
                {
                    ApplicationArea = All;
                }

                field("Fuel Approval Status"; Rec."Fuel Approval Status")
                {
                    ApplicationArea = All;
                }
                group("Fuel Required")
                {
                    Caption = 'Fuel Required';
                    field("Required Fuel In Litres"; Rec."Required Fuel In Litres")
                    {
                        ApplicationArea = All;
                    }
                    field("Balance Fuel in Vehicle"; Rec."Balance Fuel in Truck")
                    {
                        ApplicationArea = All;
                    }
                    field("Shortage in liters(If Any)"; Rec."Shortage in liters(If Any)")
                    {
                        ApplicationArea = All;
                    }
                    field("Net Requirement in litres"; Rec."Net Requirement in litres")
                    {
                        ApplicationArea = All;
                    }
                    field(Posted; Rec.Posted)
                    {
                        ApplicationArea = All;
                    }
                    field("Fuel Reversed"; Rec."Fuel Reversed")
                    {
                        ApplicationArea = All;
                    }
                    field("Fuel Return No."; Rec."Fuel Return No.")
                    {
                        ApplicationArea = All;
                    }
                }

            }
            group(Dimensions)
            {
                Caption = 'Dimensions';
                field("Global Dimension 1 Code1"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type of Trip field.';
                    Visible = DimVisible1;
                    Editable = false;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                    Visible = DimVisible2;
                    Editable = false;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                    Visible = DimVisible3;
                    Editable = false;
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.';
                    Visible = DimVisible4;
                    Editable = false;
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 5 Code field.';
                    Visible = DimVisible5;
                    Editable = false;
                }
                field("Shortcut Dimension 6 Code1"; Rec."Shortcut Dimension 6 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 6 Code field.';
                    Visible = DimVisible6;
                    Editable = false;
                }
                field("Shortcut Dimension 7 Code"; Rec."Shortcut Dimension 7 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 7 Code field.';
                    Visible = DimVisible7;
                    Editable = false;
                }
                field("Shortcut Dimension 8 Code"; Rec."Shortcut Dimension 8 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 8 Code field.';
                    Visible = DimVisible8;
                    Editable = false;
                }
                field("Purchase Receipt No."; Rec."Purchase Receipt No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Purchase Receipt No. field.';
                    Editable = false;
                }
                field("PO No."; Rec."PO No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PO No. field.';
                    Editable = false;
                }
            }
        }
    }

    actions

    {
        area(Processing)
        {
            group("&Print")
            {
                Caption = '&Print';
                Image = Print;
                action(Print)
                {
                    ApplicationArea = Suite;
                    Caption = 'Print';
                    Ellipsis = true;
                    Image = PostPrint;
                    trigger OnAction()
                    var
                        Fueliss: Record "Fuel Issue";
                    begin
                        Rec.TestField("Fuel Approval Status", Rec."Fuel Approval Status"::Approved);
                        Fueliss.Reset();
                        Fueliss.SetRange("Fuel Issue No.", Rec."Fuel Issue No.");
                        if Fueliss.FindFirst then
                            Report.RunModal(50126, true, false, Fueliss);
                    end;
                }
                action(FuelReturn)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Return fuel';
                    Image = Document;
                    //Visible = false;
                    trigger OnAction()
                    var
                        FuelReturn: Record "Fuel Return";
                        Vehicle: Record "Fixed Asset";
                    begin
                        if not Confirm('Do you want to post Fuel Return?', false) then
                            exit else begin
                            If not Rec."Fuel Reversed" then begin
                                if Vehicle.Get(Rec."Vehicle No.") then begin
                                    Vehicle.CalcFields("Balance Fuel");
                                    if Vehicle."Balance Fuel" < Rec."Net Requirement In Litres" then
                                        Error('You do not have enough Fuel in vehicle to return. Balance in vehicle is %1 and Fuel Return Quantity is %2', Vehicle."Balance Fuel", Rec."Net Requirement In Litres");
                                    CreateFuelReturn();
                                    if Rec."Fuel Issue For" = Rec."Fuel Issue For"::"Non-Trip" then
                                        Rec.PostDirectFuelReturnJournal()
                                    else begin
                                        if not Rec."For Closed Trip?" then
                                            Rec.TransferOrderForFuelReturn(FuelReturn)
                                        else
                                            Rec.PostDirectFuelReturnJournal();
                                    end;
                                    Rec."Fuel Reversed" := true;
                                    Rec."Fuel Return No." := Rec."Fuel Issue No." + '-R';
                                    Rec.Modify();
                                end;
                            end else
                                Error('This fuel issue is already reversed');
                            CurrPage.Update(false);
                            CurrPage.Close();
                        end;
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Category09)
            {
                Caption = 'Print', Comment = 'Generated from the PromotedActionCategories property index 8.';
                actionref(FuelPrint_Promoted; Print)
                {
                }
            }
            group(Category_Category10)
            {
                Caption = 'Return', Comment = 'Generated from the PromotedActionCategories property index 8.';
                actionref(FuelReturn_Promoted; FuelReturn)
                {
                }
            }
        }
    }
    var
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

        DimMgt.UseShortcutDims(
          DimVisible1, DimVisible2, DimVisible3, DimVisible4, DimVisible5, DimVisible6, DimVisible7, DimVisible8);

        Clear(DimMgt);

    end;

    trigger OnOpenPage()
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.get(UserId);
        if not UserSetup."COA Access" then
            CurrPage.Editable := false
        else
            CurrPage.Editable := true;

        SetDimensionsVisibility();
    end;

    trigger OnAfterGetRecord()
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.get(UserId);
        if not UserSetup."COA Access" then
            CurrPage.Editable := false
        else
            CurrPage.Editable := true;
    end;

    procedure CreateFuelReturn()
    var
        FuelReturn: Record "Fuel Return";
        UnigroupSetup: Record "Unigroup Setup";
        NoSeriesMgt: Codeunit "No. Series";
    begin
        UnigroupSetup.Get();
        FuelReturn.Init();
        //FuelReturn."Fuel Return No." := NoSeriesMgt.GetNextNo(UnigroupSetup."Fuel Return No.", Today, true);
        FuelReturn."Fuel Return No." := Rec."Fuel Issue No." + '-R';
        FuelReturn."Return Date" := WorkDate();
        FuelReturn."Fuel Type" := Rec."Fuel Type";
        FuelReturn."Trip ID" := Rec."Trip ID";
        FuelReturn."Vehicle No." := Rec."Vehicle No.";
        FuelReturn."Trailer No." := Rec."Trailer No.";
        FuelReturn."Tank Size" := Rec."Tank Size";
        FuelReturn."Driver ID" := Rec."Driver ID";
        FuelReturn."Driver Name" := Rec."Driver Name";
        FuelReturn.Pump := Rec.Pump;
        FuelReturn."Fueling Station Name" := Rec."Fueling Station Name";
        FuelReturn.Odometer := Rec.Odometer;
        FuelReturn."Shortcut Dimension 6 Code" := Rec."Shortcut Dimension 6 Code";
        FuelReturn."Fuel Approval Status" := Rec."Fuel Approval Status";
        FuelReturn."Required Fuel In Litres" := Rec."Required Fuel In Litres";
        FuelReturn."Balance Fuel in Truck" := Rec."Balance Fuel in Truck";
        FuelReturn."Shortage in Liters(If Any)" := Rec."Shortage in Liters(If Any)";
        FuelReturn."Net Requirement In Litres" := Rec."Net Requirement In Litres";
        FuelReturn."Fuel Issue No." := Rec."Fuel Issue No.";
        FuelReturn.Insert();
        Rec.Modify();
    end;
}