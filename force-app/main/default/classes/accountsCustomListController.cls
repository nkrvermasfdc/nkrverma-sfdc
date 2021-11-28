public class accountsCustomListController{

    public ApexPages.StandardSetController Acc
    {
        get
        {
            if(Acc== null)
            {
                Acc= new ApexPages.StandardSetController(Database.getQueryLocator([Select Name, AccountNumber from Account]));
            }
        return Acc;
        }
        
        set;
    }

    public List<Account> getAccount() 
    {
        return (List<Account>)Acc.getRecords();
    }

}