pageextension 50128 "Item Journal ext" extends "Item Journal"
{
    layout
    {

    }
    actions
    {
        addafter("&Line")
        {
            action("Update Dimensions")
            {
                Caption = 'Update Dimensions';
                ApplicationArea = All;
                AccessByPermission = tabledata "Dimension Set Entry" = rimd;
                trigger OnAction()
                var
                begin
                    IF UserId <> 'TI' then
                        Error('you do not have permission')
                    else
                        UpdateDimensionFields;
                end;
            }
        }

    }
    procedure UpdateDimensionFields()
    var
        Trip: Record "Trip";
    begin
        Rec.Reset();
        Rec.SetRange("Journal Batch Name", 'ADJUSTMENT');
        if Rec.FindFirst() then
            repeat
                Trip.Reset();
                Trip.SetRange("Trip ID", Rec."Document No.");
                if Trip.FindFirst() then begin
                    Rec."Shortcut Dimension 2 Code" := Trip."Global Dimension 2 Code";
                    ShortcutDimCode[3] := Trip."Shortcut Dimension 3 Code";
                    ShortcutDimCode[4] := Trip."Shortcut Dimension 4 Code";
                    ShortcutDimCode[5] := Trip."Shortcut Dimension 5 Code";
                    ShortcutDimCode[6] := Trip."Shortcut Dimension 6 Code";
                    rec.ValidateShortcutDimCode(2, rec."Shortcut Dimension 2 Code");
                    rec.ValidateShortcutDimCode(3, ShortcutDimCode[3]);
                    Rec.ValidateShortcutDimCode(4, ShortcutDimCode[4]);
                    Rec.ValidateShortcutDimCode(5, ShortcutDimCode[5]);
                    Rec.ValidateShortcutDimCode(6, ShortcutDimCode[6]);
                    Rec.Modify();
                end;
            until rec.Next() = 0;
    end;

}

