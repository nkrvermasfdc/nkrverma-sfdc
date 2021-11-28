/* ===========================================================================================================================
 * Date    == 30-March-2020
 * purpose == Trailhead -- Learning Objectives
 * Path    == Asynchronous Apex -> Control Processes with Queueable Apex
 * URL     == https://trailhead.salesforce.com/content/learn/modules/asynchronous_apex/async_apex_queueable
 * =========================================================================================================================== */
public class UpdateParentAccount implements Queueable {
    
    private List<Account> accounts;
    private ID parent;
    
    public UpdateParentAccount(List<Account> records, ID id) {
        this.accounts = records;
        this.parent = id;
    }
    public void execute(QueueableContext context) {
        for (Account account : accounts) {
          account.parentId = parent;
          // perform other processing or callout
        }
        update accounts;
    }
    
}

//To add this class as a job on the queue, execute the following code:
// find all accounts in ‘NY’
//List<Account> accounts = [select id from account where billingstate = ‘NY’];
// find a specific parent account for all records
//Id parentId = [select id from account where name = 'ACME Corp'][0].Id;
// instantiate a new instance of the Queueable class
//UpdateParentAccount updateJob = new UpdateParentAccount(accounts, parentId);
// enqueue the job for processing
//ID jobID = System.enqueueJob(updateJob);

/* After you submit your queueable class for execution, the job is added to the queue and will be processed when 
 * system resources become available. 
 * You can use the new job ID to monitor progress, either through the Apex Jobs page or programmatically by querying AsyncApexJob:
   SELECT Id, Status, NumberOfErrors FROM AsyncApexJob WHERE Id = :jobID
 */