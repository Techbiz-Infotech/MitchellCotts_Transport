enum 50144 "Billing Status"
{
    Extensible = true;

    value(0; " ")
    {
        Caption = ' ';
    }
    value(1; Open)
    {
        Caption = 'Open';
    }
    value(2; "Pending for Invoice")
    {
        Caption = 'Pending for Invoice';
    }
    value(3; Invoiced)
    {
        Caption = 'Invoiced';
    }
}
