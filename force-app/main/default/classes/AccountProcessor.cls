/* ==========================================================================================================================
 * Date    == 17-March-2020
 * purpose == Trailhead -- Hands-on Challenge
 * Path    == Asynchronous Apex -> Use Future Methods
 * URL     == https://trailhead.salesforce.com/content/learn/modules/asynchronous_apex/async_apex_future_methods
 * ========================================================================================================================== */
public class AccountProcessor 
{   
    //Writting the countContacts method and marking it with the @future label.
    @future
    public static void countContacts(Set<Id> accountIDs) {
        
        // Creating a list that will contain all those accounts that are referenced through the accounIDs list.
        List<Account> accounts = [SELECT Id, Number_of_Contacts__c, (SELECT id FROM Contacts) from Account where id in :accountIDs];
     
        //Assigment from the total contact number to the Number_of_Contacts__c field for each account at accounts list.
        for( Account account : accounts ) {
          account.Number_of_Contacts__c = account.contacts.size();
        }

        //Updating all accounts in list
        update accounts;

    }      
}



    /*
    @future
    public static void countContacts(List<id> accountids)
    {
        Map<id, List<Contact>> accContacts = new Map <id,List<Contact>>();
        List<Account> accsForUpdate = new List<Account>();
        
        if(accountids != null)
        {
            for(Account acc: [Select id, (Select id, Name From Contacts) From Account Where id in: accountids])
            {
				accContacts.put(acc.id, acc.contacts);
            }
        }
        
        for(id Key :accContacts.KeySet())
        {
        	Account a = New Account(id = Key);
            a.Number_of_Contacts__C = accContacts.get(Key).Size();
            accsForUpdate.add(a);
        }
       Update accsForUpdate;
    }
*/





 /*  @future
    public static void countContacts(List<id> scope)
    {
        Account[] updates = new Account[]{};
        for(AggregateResult ar:[ Select Accountid a, count(id) c from Contact where Accountid in :scope group by Accountid ])
        {
            Updates.add( new Account(id = (id)ar.get('a'), Number_of_Contacts__c = (Decimal)ar.get('c') ));
        }
        update Updates;
    }*/