global Class batch_Class implements Database.Batchable<sObject>{

global final String Query;  // Our Query
global final String Entity; // which object we want to update
global final String Field;  // field that need to be Updated
global final String Value;  // value to be assigned to the field
    
    // Defining constructor
    global batch_Class (String q, String e, String f, String v){
        Query  = q;
        Entity = e;
        Field  = f;
        Value  = v;
    }
    
    // To get the Data Ready in batches
    global Database.QueryLocator Start(Database.batchableContext BC){
        return Database.getqueryLocator(Query);
    }
    
   
     // Actual Code execution
    global void execute(Database.batchableContext BC, List<sObject> Scope){
        for(sObject s : Scope){
            s.put(Field, Value);
        }   
            update Scope;   
    }
    
    // Any thing we want to perform at the end of processing all the batches
    global void finish(Database.batchableContext BC){
        // Do Nothing
    }



// ----------------------------------------------------
// Pass this at Anonymous Block
// ----------------------------------------------------
 
// String Q = 'select Industry from Account limit 6';
// String E = 'Account';
// String F = 'Description';
// String V = 'Edited by NKV';

// ID batchInstanceID = Database.executebatch(new batch_Class(Q,E,F,V),2);

// To Schedule the batch
// System.Schedulebatch(Schedule Batch)


}