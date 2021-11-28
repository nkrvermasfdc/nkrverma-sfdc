/* ==========================================================================================================================
 * Date    == 17-March-2020
 * Purpose == Trailhead -- Hands-on Challenge
 * Path    == Asynchronous Apex -> Use Future Methods
 * URL     == https://trailhead.salesforce.com/content/learn/modules/asynchronous_apex/async_apex_future_methods
 * ========================================================================================================================== */
@isTest
public class AccountProcessorTest {
    
    @isTest
    public static void countContactsTest()
    {
        //Creating an account and inserting it
        Account account = New Account(Name = 'Account Number 1');
        insert account;

        //Creating some contacts related to the account and inserting them
        List<Contact> contacts = new List<Contact>();
        contacts.add(New Contact(lastname = 'Related Contact 1', AccountId = account.Id));
        contacts.add(New Contact(lastname = 'Related Contact 2', AccountId = account.Id));
        contacts.add(New Contact(lastname = 'Related Contact 3', AccountId = account.Id));
        contacts.add(New Contact(lastname = 'Related Contact 4', AccountId = account.Id));
        insert contacts;

        //Creating a List with account Ids to pass them throught the AccountProcessor.countContacts method
        Set<Id> accountIds = new Set<Id>();
        accountIds.add(account.id);

        //Starting Test:
        Test.startTest();

        //Calling the AccountProcessor.countContacts method
        AccountProcessor.countContacts(accountIds);

        //Finishing Test:
        Test.stopTest();
        Account ACC = [SELECT Number_of_Contacts__c FROM Account WHERE id = :account.Id LIMIT 1];
        
        //Setting Assert (We have to parse the account.Number_of_Contacts__c 
        //to integer to avoid some comparasion error between decimal and integer)
        System.assertEquals( Integer.valueOf(ACC.Number_of_Contacts__c) , 4);
    }

} 

/*
 // Create the mock response based on a static resource
        //StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        //Test.setMock(HttpCalloutMock.class, mock);
        
        //Test.setMock(HttpCalloutMock.class, new RestMock());
        //Test.setMock(HttpCalloutMock.class, new RequestCalloutMockClass());
        //Create Static Resourse from developer Console
		//GetAnimalResource = {'animals': ['pesky porcupine', 'hungry hippo', 'squeaky squirrel']};
		
        //StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        //mock.setStaticResource('animals');
        //mock.setStatusCode(200); // Or other appropriate HTTP status code
        //mock.setHeader('Content-Type', 'application/json'); // Or other appropriate MIME type like application/xml
        
        //Test.setMock(HttpCalloutMock.class, AnimalsHttpCalloutMock);
       
		//Contact Acc = [Select Accountid from Contact where id = :a.id LIMIT 1];
        //System.assert(cont.Accountid!=null);
        //System.assertequals(cont.id, Acc.Accountid);
     
@isTest
global class AnimalsHttpCalloutMock implements HttpCalloutMock 
{
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest request) 
	{
        // Create a fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"animals": ["majestic badger", "fluffy bunny", "scary bear", "chicken", "mighty moose"]}');
        response.setStatusCode(200);
        return response; 
    }
}

public class RestMock implements HttpCalloutMock 
    {
        public HTTPResponse respond(HTTPRequest req)
        {
            String fullJson = 'your Json Response';
            
            HTTPResponse res = new HTTPResponse();
            res.setHeader('Content-Type', 'text/json');
            res.setBody(fullJson);
            res.setStatusCode(200);
            return res;
        }
    }


@testSetup
    static void setupAccount()
    {
    	List <Account> accounts = RandomAccountContactFactory.generateRandomAccounts(1);
        Insert accounts;
        
        List <Contact> contacts = RandomAccountContactFactory.generateRandomContacts(3, 'Test AP');
    }
    
    @isTest
    Static void testAccountProcessor()
    {
    	List <id> accids = new List<id>();
        for(Account a: [Select id from Account])
        {
            
        }
    }
*/

/*@isTest
    Static void testAccountProcessor()
    {
    	List <id> accids = new List<id>();
        for(Account a: [Select id from Account])
        {
            
        }
    }*/

//Account a = new Account();
        //a.Name = 'Test Account';
        //Insert a;
        
        /*Contact cont = new Contact();
        cont.FirstName = 'Bob';
        cont.LastName  = 'Masters';
        cont.Accountid = a.id;        
        Insert Cont;*/