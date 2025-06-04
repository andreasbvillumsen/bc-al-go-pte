// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50000 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    begin
        Message('App published: Hello my very own world');
    end;

    actions
    {
        addlast(Processing)
        {
            action(CheckAPIConnection)
            {
                ApplicationArea = All;
                Caption = 'Check API Connection';
                Image = Check;
                trigger OnAction()
                var
                    Client: HttpClient;
                    Response: HttpResponseMessage;
                    IsSuccess: Boolean;
                begin
                    IsSuccess := Client.Get('https://dinapi.dk/helperapi/healthcheck', Response);
                    if IsSuccess and Response.IsSuccessStatusCode() then
                        Message('All is OK!')
                    else
                        Message('Something is wrong with the connection');
                end;
            }
        }
    }
}

