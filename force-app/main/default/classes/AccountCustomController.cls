public class AccountCustomController 
{

    public PageReference savetherecord() {
        update account;
        return null;
    }


    private final Account account;    
    public AccountCustomController() 
    {
        account = [select id,name,site from Account where Id=: ApexPages.currentPage().getParameters().get('id')];
    }
    
    public Account getAccount()
    {
        return account;
    }

}