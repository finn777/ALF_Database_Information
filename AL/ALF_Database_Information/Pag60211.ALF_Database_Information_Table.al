page 60211 ALF_Database_Information_Table
{
    ApplicationArea = All;
    Caption = 'ALF Database Information Tables for Company';
    DataCaptionExpression = CompanyName;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = AllObjWithCaption;
    SourceTableView = SORTING("Object Type","Object ID")
                      ORDER(Ascending)
                      WHERE("Object Type"=CONST(TableData));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Object Type";"Object Type")
                {
                    ApplicationArea = All;
                    Caption = 'Object Type';
                }
                field("Object ID";"Object ID")
                {
                    ApplicationArea = All;
                    Caption = 'Object ID';
                }
                field("Object Name";"Object Name")
                {
                    ApplicationArea = All;
                    Caption = 'Object Name';
                }
                field("Object Caption";"Object Caption")
                {
                    ApplicationArea = All;
                    Caption = 'Object Caption';
                }
                field("Object Subtype";"Object Subtype")
                {
                    ApplicationArea = All;
                    Caption = 'Object Subtype';
                }
                field("App Package ID";"App Package ID")
                {
                    ApplicationArea = All;
                    Caption = 'App Package ID';
                }
                field("No. of Records";NoOfRecords)
                {
                    ApplicationArea = All;
                    Caption = 'No. of Records';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        TempConfigLine.Init;
        TempConfigLine."Line Type" := TempConfigLine."Line Type"::Table;
        TempConfigLine."Table ID" := Rec."Object ID";
        TempConfigLine.SetRange("Company Filter",CompanyName);
        NoOfRecords := TempConfigLine.GetNoOfRecords;
    end;

    var
        NoOfRecords: Integer;
        TempConfigLine: Record "Config. Line" temporary;
}

