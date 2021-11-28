global Class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful { 

global final String Query;  // Our Query
global final String Entity; // which object we want to update
global final String Field;  // field that need to be Updated
global final String Value;  // value to be assigned to the field
    
    // Defining constructor
    global LeadProcessor (String q, String e, String f, String v){
        Query  = q;
        Entity = e;
        Field  = 'LeadSource';
        Value  = 'Dreamforce';
    }

     // instance member to retain state across transactions 
        global Integer recordsProcessed = 0;     

        global Database.QueryLocator start(Database.BatchableContext bc) { 
            return Database.getQueryLocator(Query);
        } 

       global void execute(Database.BatchableContext bc, List<Lead> scope){ 

           // process each batch of records 
           //List<Lead> Leads = new List<Lead>(); 

             for (Lead L1 : scope) { 
                 L1.Put(Field , Value);
                 // increment the instance member counter 
                 recordsProcessed = recordsProcessed + 1; 
             } 
             update scope; 
       }     

       global void finish(Database.BatchableContext bc){ 
           System.debug(recordsProcessed + ' records processed NKV!'); 
    
           //AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id = :bc.getJobId()]; 

           // call some utility to send email 
           //EmailUtils.sendMessage(a, recordsProcessed); 
       }     

}