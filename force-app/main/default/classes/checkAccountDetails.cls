@RestResource(urlMapping='/showAccounts/*')
Global Class checkAccountDetails
{
    //=======================================================================================================
    @HttpGet
    Global Static Account getAccount()
    {
        /*
        List<Account> lst;
        try
        {
            lst = [Select Name, Phone from Account];
            return lst;
        }
        Catch (Exception Ex)    
        {
        System.debug('Error: ' + Ex.getmessage());
        }                
        
        return lst;   
        */
    
        RestResponse res   = RestContext.response;
        RestRequest req    = RestContext.request;        
        String accountId   =req.requestURI.substring(req.requestURI.lastindexOf('/')+1);
        Account result     = [Select Name, Phone, Website from Account where id=: accountId];
        
        System.debug('Account Id:' + accountId);
        return result;     
    }
    
    
    //=======================================================================================================
    @HttpPost
    Global Static String doPost(String name, String phone, String AccountNumber)
    {
        Account Acc = new Account();
        Acc.name          = name;
        Acc.phone         = phone;
        Acc.Accountnumber = AccountNumber;
        Insert acc;
        return acc.id;
    }
    
    //=======================================================================================================
    @HttpDelete
    Global Static Void doDelete()
    {
        RestResponse res    = RestContext.response;
        RestRequest req     = RestContext.request;
        String AccNumber    =req.requestURI.substring(req.requestURI.lastindexOf('/')+1);
        
        Account result      = [Select Name, Phone, Website from Account where id=: AccNumber];
        delete result;
    }
    
}