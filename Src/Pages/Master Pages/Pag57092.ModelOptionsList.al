page 57092 "Model Options List"
{
    ApplicationArea = All;
    Caption = 'Model Options';
    PageType = List;
    CardPageId = "Model Options Card";
    SourceTable = "Model Options";
    UsageCategory = Lists;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Monthly Value"; Rec."Monthly Value")
                {
                    ApplicationArea = All;
                }
                field(Retail; Rec.Retail)
                {
                    ApplicationArea = All;
                }
                field("Model Option Type"; Rec."Model Option Type")
                {
                    ApplicationArea = All;
                }
                field("Make Code"; Rec."Make Code")
                {
                    ApplicationArea = All;
                }
                field("Model Code"; Rec."Model Code")
                {
                    ApplicationArea = All;
                }
                field(Derivative; Rec.Derivative)
                {
                    ApplicationArea = All;
                }
                field("CAP No.";Rec."CAP No.")
                {
                    ApplicationArea = All;
                }
                field("Default Selection"; Rec."Default Selection")
                {
                    ApplicationArea = All;
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = All;
                }
                field("Retail Inc VAT"; Rec."Retail Inc VAT")
                {
                    ApplicationArea = All;
                }
                field("Glass/ICME ID"; Rec."Glass/ICME ID")
                {
                    ApplicationArea = All;
                }
                field(Expiry; Rec.Expiry)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}