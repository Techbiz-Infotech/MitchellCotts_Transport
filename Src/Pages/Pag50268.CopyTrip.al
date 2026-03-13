page 50268 "Copy Trip"
{
    Extensible = false;
    PageType = StandardDialog;
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'Copy Trip';
                field(NewVehNo; NewVehNo)
                {
                    ApplicationArea = All;
                    TableRelation = "Fixed Asset";
                    Caption = 'New Vehicle No.';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        FA: Record "Fixed Asset";
                    begin
                        FA.SetRange("Is trailer", false);
                        FA.SetRange("Vehicle Status", FA."Vehicle Status"::Available);
                        FA.SetFilter("Next Inspection Date", '>=%1', Today);
                        FA.SetFilter("Next Service Date", '>=%1', Today);
                        if PAGE.RunModal(PAGE::"Vehicle List", FA) = ACTION::LookupOK then
                            NewVehNo := FA."No.";
                    end;
                }
            }
        }
    }
    var
        OldTrip: Record Trip;
        NewTripId: Code[20];
        NewRouteCode, NewVehNo : Code[20];

    procedure CopyTrip(Trip1: Record Trip)
    var
    begin
        OldTrip := Trip1;
    end;

    trigger OnOpenPage()
    begin
        NewVehNo := OldTrip."Vehicle No.";
        NewRouteCode := OldTrip."Route Code";
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        NewTrip: Record Trip;
        NoSeriesMgt: Codeunit "No. Series";
        UnigroupSetup: Record "Unigroup Setup";
    begin
        if CloseAction = CloseAction::OK then begin
            UnigroupSetup.Get();
            NewTrip.Init();
            NewTrip."Trip ID" := NoSeriesMgt.GetNextNo(UnigroupSetup."Trip No.", WorkDate(), true);
            NewTrip.Validate("Trip Date", WorkDate());
            NewTrip.Validate("Global Dimension 2 Code", OldTrip."Global Dimension 2 Code");
            NewTrip.Validate("Consignment Type", OldTrip."Consignment Type");
            NewTrip.Validate("Global Dimension 1 Code", NewVehNo);
            NewTrip.Validate("Global Dimension 2 Code", OldTrip."Global Dimension 2 Code");
            NewTrip.Validate("Shortcut Dimension 3 Code", OldTrip."Shortcut Dimension 3 Code");
            NewTrip.Validate("Shortcut Dimension 4 Code", OldTrip."Shortcut Dimension 4 Code");
            NewTrip.Validate("Shortcut Dimension 5 Code", OldTrip."Shortcut Dimension 5 Code");
            NewTrip.Validate("Shortcut Dimension 6 Code", OldTrip."Shortcut Dimension 6 Code");
            NewTrip.Validate("Shortcut Dimension 7 Code", OldTrip."Shortcut Dimension 7 Code");
            NewTrip.Validate("Shortcut Dimension 8 Code", OldTrip."Shortcut Dimension 8 Code");
            NewTrip.Validate("Client No.", OldTrip."Client No.");
            NewTrip.Validate("Trip Stage", NewTrip."Trip Stage"::Created);
            NewTrip.Validate("Trip Status", NewTrip."Trip Status"::Open);
            NewTrip.Validate("Vehicle No.", NewVehNo);
            NewTrip.Validate("Route Code", OldTrip."Route Code");
            NewTrip.Insert();
            OldTrip."Alternate Trip?" := true;
            OldTrip."Alternate Trip ID" := NewTrip."Trip ID";
            OldTrip.Modify();
            Message('Alternate Trip %1 is created', NewTrip."Trip ID");
        end;
    end;

}
