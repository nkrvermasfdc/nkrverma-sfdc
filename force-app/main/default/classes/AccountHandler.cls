Public class AccountHandler
{

    Public static Account insertNewAccount (String AccountName)
    {
        try
        {
            Account acct = new Account(Name=AccountName);
            insert acct;
            return acct;    
        }
        catch (exception ex)
        {
            return null;
        }
    }
    
}