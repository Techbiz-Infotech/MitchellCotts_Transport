codeunit 50103 "Change Trip Status"
{
    trigger OnRun()
    var
        Selection: Integer;
        TripStatus: Record Trip;
    begin
        Selection := Dialog.StrMenu('Approved, Closed, Live, Raised, TripHeld', 4);
        if Selection = 3 then begin
            TripStatus.Init();
            // TripStatus."Trip Status" := 'Live';
            // if TripStatus.Get('Raised') then
            TripStatus.Insert();
        end;
        //     if Selection = 1 then begin
        //         TripStatus.Get('Raised')
        //     end;
        //     if Selection = 2 then begin
        //         TripStatus.Init();
        //         TripStatus."Trip Status" := 'Closed';
        //         if TripStatus.Get('Raised') then
        //             TripStatus.Insert();
        //     end;
        //     if Selection = 5 then begin
        //         TripStatus.Init();
        //         TripStatus."Trip Status" := 'TripHeld';
        //         if TripStatus.Get('Raised') then
        //             TripStatus.Insert();
        //     end;
    end;

}

