//==============================================================================================================================//

@RestResource(urlmapping='/get_Post_And_Delete_Specific_Acc/*')
global Class checkAccountD
{

// Extracting Specific Account records from Salesforce with the help of passing ID in URL from Workbench
// To be passed at Workbench Rest Explorer with Get Method Selected 
// /services/apexrest/get_Post_And_Delete_Specific_Acc/0017F0000085cZy;

    @HttpGet
    Global static Account doGet()
    {
        RestRequest  req = RestContext.request;
        RestResponse res = RestContext.response;                
        String accountID = req.requestURI.substring(req.requestURI.lastindexof('/')+1);
        
        System.debug('Account ID : '+accountID);
        
        Account result   = [select ID, name, phone, website from Account where Id=:accountId];
        return result;
    }  

// Posting Data from Workbench to Salesforce by defining Body;
// /services/apexrest/get_Post_And_Delete_Specific_Acc/;
// Body of Post Message from Workbench
/*
{
"name"  : "NKV_Tech",
"phone" : "1122334455",
"AccountNumber" : "110011001100"
}
*/
    
    @HttpPost
    Global static String doPost(String name, String phone, String AccountNumber)
    {
        Account acc = new Account();
        acc.name    = name;
        acc.phone   = phone; 
        acc.AccountNumber = AccountNumber;
        insert acc;
        return acc.id;
    }
        
    
// Deleting specific record from Salesforce with the use of delete message from Workbench
//
//
     @HttpDelete
    Global static void doDelete()
    {
        RestRequest  req = RestContext.request;
        RestResponse res = RestContext.response;                
        String AccNumber = req.requestURI.substring(req.requestURI.lastindexof('/')+1);
                
        Account result   = [select ID, name, phone, website from Account where AccountNumber=:AccNumber];
        delete result;
    }      
}


//==============================================================================================================================//
// Invoking API for Get Request to extract data from salesforce to Third Part (we used Workbench here);
// Extracting Account records from Salesforce with some Limit of record count;
// To be passed at Workbench Rest Explorer with Get Method Selected 
// /services/apexrest/showAccountsDetals_N2
/*
@RestResource(urlmapping='/showAccountsDetals_N2/*')
global Class checkAccountD1
{
    @HttpGet
    Global static LIST<Account> getAccount()
    {
        LIST<Account> lst;
        
        try
        {
            lst = [select name, phone from Account limit 3];
            return lst;        
        }
        catch(Exception ex)
        {
            system.debug('Error'+ex.getmessage());        
        }
        
        return lst; 
    }
}

*/
//==============================================================================================================================//