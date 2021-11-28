/*----------------------------------------------------------------------------------------------- 
Date    == 17-March-2020
purpose == Trailhead -- Hands-on Challenge
Path    == Asynchronous Apex -> Use Future Methods
URL     == https://trailhead.salesforce.com/content/learn/modules/asynchronous_apex/async_apex_future_methods
------------------------------------------------------------------------------------------------*/
public class RandomAccountContactFactory 
{
	public static List <Account> generateRandomAccounts (Integer numAccounts)
    {
        List <Account> accounts = new List<Account>();        
        for(integer i =0; i<numAccounts; i++)
        {
            Account a = new Account();
            a.Name = 'TestAccount' + i;
            accounts.add(a);
        }
        return accounts;
    }
    
    public static List<contact> generateRandomContacts(integer numofContacts, string LastNameGen)
    {
        List<Contact> contacts = new List<Contact>();
        for(Integer i=0; i<numofContacts; i++)
        {
            LastNameGen = 'TestContact' + i;
            Contact a = new Contact(FirstName = LastNameGen, LastName = LastNameGen);
            contacts.add(a);
        }
        return contacts;
    }    
}