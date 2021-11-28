/* ===========================================================================================================================
 * Date    == 30-March-2020
 * purpose == Trailhead -- Hands-on Challenge
 * Path    == Asynchronous Apex -> Control Processes with Queueable Apex
 * URL     == https://trailhead.salesforce.com/content/learn/modules/asynchronous_apex/async_apex_queueable
 * =========================================================================================================================== */
@isTest
public class AddPrimaryContactTest {
    
    @isTest static Void TestList(){
        List<Account> Testa = new List <Account>();
        for(Integer i=0; i<50; i++){
            Testa.add(new Account(BillingState = 'CA', name = 'Test' +i));
        }
        for(Integer j=0; j<50; j++){
            Testa.add(new Account(BillingState = 'NY', name = 'Test' +j));
        }        
        insert Testa;
        
        Contact co = new Contact();
        co.FirstName = 'demo';
        co.LastName  = 'demo';
        insert co;
        
        String State = 'CA';
        
        AddPrimaryContact apc = new AddPrimaryContact(co, State);
        Test.startTest();
        system.enqueueJob(apc);
        Test.stopTest();
        
    }

}