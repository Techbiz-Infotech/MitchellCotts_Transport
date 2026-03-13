page 50206 Cost
{
    ApplicationArea = All;
    Caption = 'Costs';
    DataCaptionFields = "Accident No.";
    PageType = Card;
    SourceTable = Accidents;
    Editable = true;
    UsageCategory = Tasks;
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                fixed(Control1903895301)
                {
                    ShowCaption = false;
                    group(Estimated)
                    {
                        Caption = 'Estimated';
                        field(AccidendentDamage_Estimated; Estimated[1])
                        {
                            ApplicationArea = Manufacturing;
                            AutoFormatType = 1;
                            Caption = 'Accidendent Damage';
                            Editable = false;
                        }
                        field(HireCost_Estimated; Estimated[2])
                        {
                            ApplicationArea = Manufacturing;
                            AutoFormatType = 1;
                            Caption = 'Hire Cost';
                            Editable = false;
                        }
                        field(AssociatedCosts_Estimated; Estimated[3])
                        {
                            ApplicationArea = Manufacturing;
                            AutoFormatType = 1;
                            Caption = 'Associated Costs';
                            Editable = false;

                        }
                        field(StorageCost_Estimated; Estimated[4])
                        {
                            ApplicationArea = Manufacturing;
                            AutoFormatType = 1;
                            Caption = 'Storage Cost';
                            Editable = false;
                        }
                        field(SalvageCost_Estimated; Estimated[5])
                        {
                            ApplicationArea = Manufacturing;
                            AutoFormatType = 1;
                            Caption = 'Salvage Cost';
                            Editable = false;

                        }
                        field(Total_Estimated; Estimated[6])
                        {
                            ApplicationArea = Manufacturing;
                            AutoFormatType = 1;
                            Caption = 'Total';
                            Editable = false;

                        }
                    }
                    group(Actual)
                    {
                        Caption = 'Actual';
                        field(AccidendentDamage_Actcual; Actcual[1])
                        {
                            ApplicationArea = Manufacturing;
                            AutoFormatType = 1;
                            Editable = false;
                            ShowCaption = false;
                        }
                        field(HireCost_Actcual; Actcual[2])
                        {
                            ApplicationArea = Manufacturing;
                            AutoFormatType = 1;
                            Editable = false;
                            ShowCaption = false;
                        }
                        field(AssociatedCosts_Actcual; Actcual[3])
                        {
                            ApplicationArea = Manufacturing;
                            AutoFormatType = 1;
                            Editable = false;
                            ShowCaption = false;
                        }
                        field(StorageCost_Actcual; Actcual[4])
                        {
                            ApplicationArea = Manufacturing;
                            AutoFormatType = 1;
                            Editable = false;
                            ShowCaption = false;
                        }
                        field(SalvageCost_Actcual; Actcual[5])
                        {
                            ApplicationArea = Manufacturing;
                            Editable = false;
                            ShowCaption = false;
                        }
                        field(Total_Actcual; Actcual[6])
                        {
                            ApplicationArea = Manufacturing;
                            AutoFormatType = 1;
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                    group(Percentage)
                    {
                        Caption = 'Percentage';
                        field(AccidendentDamage_Percentage; Percentage[1])
                        {
                            ApplicationArea = Manufacturing;
                            AutoFormatType = 1;
                            Editable = false;
                            ShowCaption = false;
                        }
                        field(HireCost_Percentage; Percentage[2])
                        {
                            ApplicationArea = Manufacturing;
                            AutoFormatType = 1;
                            Editable = false;
                            ShowCaption = false;
                        }
                        field(AssociatedCosts_Percentage; Percentage[3])
                        {
                            ApplicationArea = Manufacturing;
                            AutoFormatType = 1;
                            Editable = false;
                            ShowCaption = false;
                        }
                        field(StorageCost_Percentage; Percentage[4])
                        {
                            ApplicationArea = Manufacturing;
                            AutoFormatType = 1;
                            Editable = false;
                            ShowCaption = false;
                        }
                        field(SalvageCost_Percentage; Percentage[5])
                        {
                            ApplicationArea = Manufacturing;
                            Editable = false;
                            ShowCaption = false;
                        }
                        field(Total_Percentage; Percentage[6])
                        {
                            ApplicationArea = Manufacturing;
                            AutoFormatType = 1;
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                }

            }
        }
    }
    var
        AccidentCost: array[6] of Decimal;
        Estimated: array[6] of Decimal;
        Actcual: array[6] of Decimal;
        Percentage: array[6] of Decimal;
        ClaimSentToAgent: Label 'Claim Sent To Agent';
        DateRecoveryReceived: Label ' Date Recovery Received';
}