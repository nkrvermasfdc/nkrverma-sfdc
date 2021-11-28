/* ===========================================================================================================================
 * Date    == 30-March-2020
 * purpose == Trailhead -- Hands-on Challenge
 * Path    == Asynchronous Apex -> Control Processes with Queueable Apex
 * URL     == https://trailhead.salesforce.com/content/learn/modules/asynchronous_apex/async_apex_queueable
 * =========================================================================================================================== */
public class AddPrimaryContact implements Queueable{
	Private Contact c;
    Private String State;
    
    public AddPrimaryContact(Contact c, String State) {
        this.c = c;
        this.State = State;
    }
    
    public void execute(QueueableContext context) {
        List<Account> ListAccount = [Select ID, Name, (Select ID, FirstName, LastName from Contacts) from Account where Billingstate =:State Limit 200];
        List<Contact> ListContact = new List<Contact>();
        
        for (Account acc : ListAccount){
            Contact cont = c.clone(false, false, false, false);
            cont.Accountid = acc.id;
            ListContact.add(cont);
        }
        
        if (ListContact.size()>0){
            insert ListContact;
        }
            
    }
}


//public AddPrimaryContact(Contact cont, String str) {
        //this.accounts = records;
        //this.parent = id;
    //}