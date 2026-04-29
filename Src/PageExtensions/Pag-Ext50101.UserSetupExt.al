pageextension 50101 UserSetupExt extends "User Setup"
{
    layout
    {
        addafter("Allow Posting To")
        {
            field("Manual Release"; Rec."Manual Release")
            {
                ApplicationArea = All;
            }
            field("Master Access"; Rec."Master Access")
            {
                ApplicationArea = All;
            }
            field("Modify Trip"; Rec."Modify Trip")
            {
                ApplicationArea = All;
            }
            field("Modify Fuel"; Rec."Modify Fuel")
            {
                ApplicationArea = all;
            }
            field("All Setup Access"; Rec."All Setup Access")
            {
                ApplicationArea = all;
            }
            field("Item and COA Access"; Rec."Item and COA Access")
            {
                ApplicationArea = all;
            }
            field("COA Access"; Rec."COA Access")
            {
                ApplicationArea = all;
            }
            field("Close Trip"; Rec."Close Trip")
            {
                ApplicationArea = all;
            }
            field("Terminate Trip"; Rec."Terminate Trip")
            {
                ApplicationArea = all;
            }
            field("Vehicle Edit"; Rec."Vehicle Edit")
            {
                ApplicationArea = all;
            }
            field(Workflow; Rec.Workflow)
            {
                ApplicationArea = all;
            }
            field("Fuel Log Edit"; Rec."Fuel Log Edit")
            {
                ApplicationArea = all;
            }
            field("Phys. Inv Joural"; Rec."Phys. Inv Joural")
            {
                ApplicationArea = all;
            }
        }
        modify("Register Time")
        {
            Visible = false;
        }
        modify("Salespers./Purch. Code")
        {
            Visible = false;
        }
        modify("Sales Resp. Ctr. Filter")
        {
            Visible = false;
        }
        modify("Purchase Resp. Ctr. Filter")
        {
            Visible = false;
        }
        modify("Service Resp. Ctr. Filter")
        {
            Visible = false;
        }
        modify("Time Sheet Admin.")
        {
            Visible = false;
        }
        modify(Email)
        {
            Visible = false;
        }
        modify(PhoneNo)
        {
            Visible = false;
        }
        modify("Allow Deferral Posting From")
        {
            Visible = false;
        }
        modify("Allow Deferral Posting To")
        {
            Visible = false;
        }

    }
    trigger OnOpenPage()
    begin
        if (UserId <> 'GROUPAUDIT') and (UserId <> 'TI') and (UserId <> 'SHILLAH') then
            CurrPage.Editable := false
        else
            CurrPage.Editable := true;
    end;

    trigger OnAfterGetRecord()
    var
        UserSetup: Record "User Setup";
    begin
        if (UserId <> 'GROUPAUDIT') and (UserId <> 'TI') and (UserId <> 'MARWANA') and (UserId <> 'SHILLAH') then
            CurrPage.Editable := false
        else
            CurrPage.Editable := true;
    end;
}
