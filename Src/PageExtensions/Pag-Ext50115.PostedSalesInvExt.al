pageextension 50115 PostedSalesInvExt extends "Posted Sales Invoice"
{
    layout
    {
        addafter("Posting Date")
        {
            field("Global Dimension 2 Code";Rec."Global Dimension 2 Code")
            {
                ApplicationArea = all;
            }
            field("Route Code";Rec."Route Code")
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {
        //addafter("Bank Accounts")
        addAfter(Print)
        {
            action("Shunting Invoice - Print")
            {
                Caption = 'Shunting Invoice - Print';
                ApplicationArea = All;
                trigger OnAction()
                var
                    SalesInvHead: Record "Sales Invoice Header";
                begin
                    SalesInvHead.Reset();
                    SalesInvHead.SetRange("No.", Rec."No.");
                    If SalesInvHead.FindFirst() then
                        Report.RunModal(50128, true, true, SalesInvHead);
                end;
            }
        }
        addAfter(Print)
        {
            action("Local Invoice - Print")
            {
                Caption = 'Local Invoice - Print';
                ApplicationArea = All;
                trigger OnAction()
                var
                    SalesInvHead: Record "Sales Invoice Header";
                begin
                    SalesInvHead.Reset();
                    SalesInvHead.SetRange("No.", Rec."No.");
                    If SalesInvHead.FindFirst() then
                        Report.RunModal(50127, true, true, SalesInvHead);
                end;
            }
        }
    }
}

