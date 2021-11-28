public class NewAndExistingController 
{

    public Account account{get;private set;}
    
    public NewAndExistingController()
    {
        ID id=ApexPages.currentPage().getParameters().get('id');
        
        account = (ID==null)?new Account():[select name, phone, industry from account where Id=:id];
    }
    
    public pagereference save()
    {
        try
        {
            upsert(account);
        }
        catch(system.DMLException e)
        {
            Apexpages.addMessages(e);
            return null;
        }
        Pagereference redirectsuccess=new ApexPages.StandardController(Account).view();
        return redirectsuccess;
    }
}