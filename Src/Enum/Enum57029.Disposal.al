enum 57029 "Disposal Need"
{
    Extensible = true;
    Caption = 'Disposal Need';

    value(0; " ") { Caption = ' '; }
    value(1; "Obsolete Asset") { Caption = 'Obsolete Asset'; }
    value(2; "Damaged Inventory") { Caption = 'Damaged Inventory'; }
    value(3; "Contaminated Oil/Fuel") { Caption = 'Contaminated/Used Oil/Fuel'; }
}

enum 57064 "Disposal Type"
{
    Extensible = true;
    Caption = 'Disposal Type';

    value(0; " ") { Caption = ' '; }
    value(1; Asset) { Caption = 'Asset'; }
    value(2; Item) { Caption = 'Item'; }
}

enum 57065 "Disposal Status"
{
    Extensible = true;
    Caption = 'Disposal Status';

    value(0; Open) { Caption = 'Open'; }                                  // 10.1 - 10.2
    value(1; "Technical Inspection") { Caption = 'Technical Inspection'; } // 10.3 - 10.4
    value(2; "Inventory Verification") { Caption = 'Inventory Verification'; } // 10.5
    value(3; "Financial Assessment") { Caption = 'Financial Assessment'; } // 10.6
    value(4; "Pending Approval") { Caption = 'Pending Approval'; }         // 10.7 - 10.8
    value(5; Approved) { Caption = 'Approved'; }                           // 10.9 - 10.13
    value(6; Executed) { Caption = 'Executed'; }                           // 10.14
    value(7; "System Updated") { Caption = 'System Updated'; }             // 10.15 - 10.16
    value(8; Closed) { Caption = 'Closed'; }
}

enum 57066 "Disposal Method"
{
    Extensible = true;
    Caption = 'Disposal Method';

    value(0; " ") { Caption = ' '; }
    // Assets (10.10)
    value(1; Auction) { Caption = 'Auction'; }
    value(2; Tender) { Caption = 'Tender'; }
    value(3; Scrap) { Caption = 'Scrap'; }
    value(4; "Trade-in") { Caption = 'Trade-in'; }
    // Inventory (10.11) / Fuel (10.12)
    value(5; "Supplier Return") { Caption = 'Supplier Return'; }
    value(6; "Write Off") { Caption = 'Write Off'; }
    value(7; "Controlled Draining") { Caption = 'Controlled Draining'; }
}



enum 57067 "Disposal Recommendation"
{
    Extensible = true;
    Caption = 'Disposal Recommendation';

    value(0; " ") { Caption = ' '; }
    value(1; Scrap) { Caption = 'Scrap'; }
    value(2; Reusable) { Caption = 'Reusable'; }
}
enum 57068 "Disposal Category"
{
    Extensible = true;
    Caption = 'Disposal Category';

    value(0; " ") { Caption = ' '; }
    value(1; Asset) { Caption = 'Asset'; }
    value(2; Inventory) { Caption = 'Inventory'; }
    value(3; Fuel) { Caption = 'Fuel'; }
}

