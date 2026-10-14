table 57057 "Unigroup Setup"
{
    Caption = 'Transport Primary Setup';
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            Caption = 'Primary Key';
            DataClassification = ToBeClassified;
        }
        field(2; "Trip No."; Code[20])
        {
            Caption = 'Trip No.';
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(3; "WorkShop Code"; Code[20])
        {
            Caption = 'WorkShop Code';
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(4; "Route Code"; Code[20])
        {
            Caption = 'Route Code';
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(5; "Trailer Code"; Code[20])
        {
            Caption = 'Trailer Code';
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(6; "Voucher No."; Code[20])
        {
            Caption = 'Voucher No.';
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(7; "Fuel Issue No."; Code[20])
        {
            Caption = 'Fuel Issue No.';
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(8; "Fine No."; Code[20])
        {
            Caption = 'Fine No.';
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(9; "Allocation No."; Code[20])
        {
            Caption = 'Allocation No.';
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(10; "Mobility No."; Code[20])
        {
            Caption = 'Mobility No.';
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(11; "Reallocation No."; Code[20])
        {
            Caption = 'Reallocation No.';
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(12; "Gatepass No."; Code[20])
        {
            Caption = 'Gatepass No.';
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(13; "Accident Details No."; Code[20])
        {
            Caption = 'Accident Details No.';
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(14; "Injured Party No."; Code[20])
        {
            Caption = 'Injured Party No.';
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(15; "Job Card No."; Code[20])
        {
            Caption = 'Job Card No.';
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(16; "Fitter No."; Code[20])
        {
            Caption = 'Fitter No.';
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(17; "Fuel Card No."; Code[20])
        {
            Caption = 'Fuel Card No.';
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(18; "Accident No."; Code[20])
        {
            Caption = 'Accident No.';
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(19; "Def. Petty Cash Payment Method"; Code[20])
        {
            Caption = 'Default Petty Cash Payment Method';
            TableRelation = "Bank Account";
            DataClassification = ToBeClassified;
        }
        field(20; "Witness No."; Code[20])
        {
            Caption = 'Witness No.';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(23; "Weigh bridge Charge"; Code[20])
        {
            Caption = 'Weigh bridge Charge';
            DataClassification = ToBeClassified;
            TableRelation = Item where(Type = const(Service));
        }
        field(24; "Third Party No."; Code[20])
        {
            Caption = 'Third Party No.';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(25; "Inspection No."; Code[20])
        {
            Caption = 'Inspection No.';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(26; "Stock Request No."; Code[20])
        {
            Caption = 'Stock Request No.';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(27; "Truck Detention Charge"; Code[20])
        {
            Caption = 'Truck Detention Charge';
            DataClassification = ToBeClassified;
            TableRelation = Item where(Type = const(Service));
        }
        field(28; "Detention Amount Per Day"; Decimal)
        {
            Caption = 'Detention Amount Per Day';
            DataClassification = ToBeClassified;
        }
        field(29; "Shunting Trip No."; Code[20])
        {
            Caption = 'Shunting Trip No.';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(30; "Fuel Consumption Template Name"; Code[20])
        {
            Caption = 'Fuel Consumption Template Name';
            DataClassification = ToBeClassified;
            TableRelation = "Item Journal Template";
        }
        field(31; "Fuel Consumption Batch Name"; Code[20])
        {
            Caption = 'Fuel Consumption Batch Name';
            DataClassification = ToBeClassified;
            TableRelation = "Item Journal Batch".Name where("Journal Template Name" = field("Fuel Consumption Template Name"));
        }
        field(32; "Stock Issue No."; Code[20])
        {
            Caption = 'Stock Issue No.';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(33; "Fuel Shortage Driver Account"; Code[20])
        {
            Caption = 'Fuel Shortage Driver Account';
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
        }
        field(34; "Fuel Shortage Company Account"; Code[20])
        {
            Caption = 'Fuel Shortage Company Account';
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
        }
        field(35; "Default Shunting Trip Type"; Code[20])
        {
            Caption = 'Default Shunting Trip Type';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Dimension Code" = filter('Trip Type'));
        }
        field(36; "Default Scrap Location"; Code[20])
        {
            Caption = 'Default Scrap Location';
            DataClassification = ToBeClassified;
            TableRelation = Location where("Use As In-Transit" = const(false));
        }
        field(37; "Vehicle Temp Fuel Location"; Code[20])
        {
            Caption = 'Vehicle Temporary Fuel Location';
            DataClassification = ToBeClassified;
            TableRelation = Location where("Use As In-Transit" = const(false));
        }
        field(38; "Default Item for Diesel"; Code[20])
        {
            Caption = 'Default Item for Diesel';
            DataClassification = ToBeClassified;
            TableRelation = Item;
        }

        field(39; "Default Item for Petrol"; Code[20])
        {
            Caption = 'Default Item for Petrol';
            DataClassification = ToBeClassified;
            TableRelation = Item;
        }
        field(40; "Default Ext. Fuel Location"; Code[20])
        {
            Caption = 'Default External Fuel Location';
            DataClassification = ToBeClassified;
            TableRelation = Location where("Use As In-Transit" = const(false));
        }
        field(41; "Petty Cash Template Name"; Code[20])
        {
            Caption = 'Petty Cash Template Name';
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Template";
        }
        field(58; "Disposal FA Jnl. Template"; Code[20])
        {
            Caption = 'Disposal FA Jnl. Template';
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Template";
        }
        field(42; "Disposal FA Jnl. Batch"; Code[20])
        {
            Caption = 'Disposal FA Jnl. Batch';
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Disposal FA Jnl. Template"));
        }
        field(57; "Petty Cash Batch Name"; Code[20])
        {
            Caption = 'Petty Cash Batch Name';
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Petty Cash Template Name"));
        }

        field(43; "Trip Prepayment From"; Code[20])
        {
            Caption = 'Trip Prepayment From';
            TableRelation = "G/L Account";
            DataClassification = ToBeClassified;
        }
        field(44; "Trip Prepayment To"; Code[20])
        {
            Caption = 'Trip Prepayment To';
            TableRelation = "G/L Account";
            DataClassification = ToBeClassified;
        }
        field(45; "Stock Return No."; Code[20])
        {
            Caption = 'Stock Return No.';
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(46; "Prod Group for Non Trip Fuel"; Code[20])
        {
            Caption = 'Prod Group for Non Trip Fuel';
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Product Posting Group";
        }
        field(47; "Prod Group for Trip Fuel"; Code[20])
        {
            Caption = 'Prod Group for Trip Fuel';
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Product Posting Group";
        }
        field(48; "Default HS Code Exempted"; Code[20])
        {
            Caption = 'Default HS Code Exempted';
            DataClassification = ToBeClassified;
        }
        field(49; "Default HS Code Zero rated"; Code[20])
        {
            Caption = 'Default HS Code Zero rated';
            DataClassification = ToBeClassified;
        }
        field(50; "Fuel Return No."; Code[20])
        {
            Caption = 'Fuel Return No.';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(51; "Default Var Fuel Location"; Code[20])
        {
            Caption = 'Default Var Fuel Location';
            DataClassification = ToBeClassified;
            TableRelation = Location where("Use As In-Transit" = const(false));
        }
        field(52; "Prod Group Closed Trip Fuel"; Code[20])
        {
            Caption = 'Prod Group for Closed Trip Fuel';
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Product Posting Group";
        }
        field(53; "Petty Cash Return No."; Code[20])
        {
            Caption = 'Petty Cash Return No.';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(54; "Request For Transport Nos"; code[100])
        {
            TableRelation = "No. Series";
        }
        field(55; "Driver No"; code[100])
        {
            TableRelation = "No. Series";
        }
        field(56; "Disposal Nos."; code[100])
        {
            TableRelation = "No. Series";
        }

    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
    procedure InsertIfNotExist()
    begin
        if not Get() then begin
            Init();
            Insert(true);
        end;
    end;
}
