pageextension 60211 ALF_Database_Information extends "Company Information"
{
    layout
    {
        // Add changes to page layout here
    }
    
    actions
    {
        // Add changes to page actions here
        addafter("Reason Codes")
        {
                action("ALF Database Information Tables for Company")                
                {
                    Image = Table;
                    ApplicationArea = All;
                    ToolTip = 'The tables list with number of records per table. Info for specific company.';
                    trigger OnAction()
                    begin
                        Page.RUN(Page::ALF_Database_Information_Table);
                    end;
                }
               
        }        

    }

}