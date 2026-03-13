page 50225 "Shunting Details List"
{
    Caption = 'Shunting Details';
    PageType = List;
    SourceTable = "Shunting Details";
    // ApplicationArea = all;
    // UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Trip Id"; Rec."Trip Id")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Trip Id field.';
                    Visible = false;
                    Editable = false;
                }
                field("Trip Date"; Rec."Trip Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Trip Date field.';
                    Visible = false;
                    Editable = false;
                }
                field("Shunting Trip Date"; Rec."Shunting Trip Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shunting Trip Date field.';
                    Editable = PostedEdit;
                }
                field("Shunting Trip ID"; Rec."Shunting Trip ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shunting Trip No. field.';
                    Editable = false;
                }

                field("Litres Per Trip"; Rec."Litres Per Trip")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Litres Per Trip field.';
                    Editable = PostedEdit;
                }
                field("Billing Status"; Rec."Billing Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Billing Status field.';
                    Editable = false;
                }
                field("Container No."; Rec."Container No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Container No. field.';
                    Editable = PostedEdit2;
                }

                field("Cargo type"; Rec."Cargo type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cargo Type field.';
                    Editable = PostedEdit2;
                }
                field("Container Size"; Rec."Container Size")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Container Size field.';
                    Editable = PostedEdit2;
                }
                field("Container Charge"; Rec."Container Charge")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Container Charge field.';
                    Editable = PostedEdit2;
                }

                field("Delivery Note No"; Rec."Delivery Note No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Delivery Note No field.';
                    ShowMandatory = true;
                    Editable = PostedEdit2;
                }
                field("Interchange No"; Rec."Interchange No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Interchange No field.';
                    Editable = PostedEdit2;
                }
                field("Booking No"; Rec."Booking No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Booking No field.';
                    Editable = PostedEdit2;
                }
                field("Additional Remarks"; Rec."Additional Remarks")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Additional Remarks field.';
                    Editable = PostedEdit2;
                }
                field("Trip Completed"; Rec."Trip Completed")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Trip Completed field.';
                    Editable = PostedEdit;
                }
                field("Posted Invoice No."; Rec."Posted Invoice No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted Invoice No. field.';
                    Editable = false;
                }
            }
        }
    }
    var
        PostedEdit, PostedEdit2 : Boolean;

    trigger OnAfterGetCurrRecord()
    begin
        Rec.UpdateFuel();
        PostedEditable();
        InvoicedTripEditable();
    end;

    trigger OnOpenPage()
    begin
        PostedEditable();
        InvoicedTripEditable();
    end;

    trigger OnAfterGetRecord()
    begin
        Rec.UpdateFuel();
        PostedEditable();
        InvoicedTripEditable();
    end;

    trigger OnClosePage()
    begin
        Rec.UpdateFuel();
    end;

    procedure PostedEditable()
    var
        UserSetup: Record "User Setup";
        trip: Record Trip;
    begin
        UserSetup.Get(UserId);
        if trip.get(Rec."Trip Id") then begin
            if (Trip."Trip Status" = Trip."Trip Status"::Invoiced) or (Trip."Trip Status" = Trip."Trip Status"::Completed) then begin
                PostedEdit := false;
            end else
                PostedEdit := true;
        end;
        if trip.get(Rec."Trip Id") then begin
            if Trip."Trip Status" = Trip."Trip Status"::Completed then begin
                if not UserSetup."Modify Trip" then
                    PostedEdit2 := false
                else
                    PostedEdit2 := true;
            end;
        end;
        if trip.get(Rec."Trip Id") then begin
            if Trip."Trip Status" = Trip."Trip Status"::Invoiced then
                PostedEdit2 := false
            else
                PostedEdit2 := true;
        end;
    end;

    procedure InvoicedTripEditable()
    var
        UserSetup: Record "User Setup";
        Trip: Record trip;
    begin
        if trip.get(Rec."Trip Id") then begin
            UserSetup.get(userid);
            if (Trip."Trip Status" = Trip."Trip Status"::Invoiced) or (Trip."Trip Status" = Trip."Trip Status"::Completed) then begin
                if UserSetup."Modify Trip" then
                    CurrPage.Editable := true
                else
                    CurrPage.Editable := false;
            end else
                CurrPage.Editable := true;
        end;
    end;
}
