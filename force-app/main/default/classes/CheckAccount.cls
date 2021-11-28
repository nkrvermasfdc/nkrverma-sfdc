@RestResource(urlmapping='/showAccountsDetails/*')

    //---------------------------------------------------//
    Global Class CheckAccount
    {
        @HttpGet
        global static LIST<Account> getAccount()
        {
        
            RestResponse res = RestContext.response;
            RestRequest  req = RestContext.request;
            
            //String accountID = req.requestURL.Substring(req.request.UR
            
            LIST <Account> LST;
        
            try
            {
                LST = [Select Name, Phone from Account LIMIT 10];
                Return LST;
            }
        
            Catch(Exception Ex)
            {
                System.debug('Error'+Ex.getmessage());
            } 
            
            Return LST;
        }                   
        
    }
    //---------------------------------------------------//