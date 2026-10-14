pageextension 57022 "Purchase Orders Ext" extends "Purchase Order list"
{
    layout
    {
        addbefore(Amount)
        {
            field("Quantity Ordered";Rec."Quantity Ordered")
            {
                ApplicationArea=all;
                ToolTip = 'Specifies the value of the Quantity Ordered field.';
            }
            field("Quantity Invoiced";Rec."Quantity Invoiced")
            {
                ApplicationArea=all;
                ToolTip = 'Specifies the value of the Quantity Invoiced field.';
            }
            field("Quantity Received";Rec."Quantity Received")
            {
                ApplicationArea=all;
                ToolTip = 'Specifies the value of the Quantity Received field.';
            }
            field("Fuel Issue No.";Rec."Fuel Issue No.")
            {
                ApplicationArea=all;
                ToolTip = 'Specifies the value of the Fuel Issue No. field. if this is External fuel LPO';
            }

        }
    }
}
