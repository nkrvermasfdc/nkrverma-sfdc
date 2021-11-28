// Trigger for listening to Order_Event events.
trigger OrderEventTrigger on Order_Event__e (after insert) {

    // List to hold all Task to be created.
    List<Task> tasks = new List<Task>();
    
    // Get queue Id for task owner
    //Group queue = [SELECT Id FROM Group WHERE Name='Regional Dispatch' AND Type='Queue'];
    String usr = UserInfo.getUserId();  
    
    // Iterate through each notification.
    for (Order_Event__e event : Trigger.New) {
        if (event.Has_Shipped__c == true) {
            // Create Task to dispatch new team.
            task ts = new task();
            ts.Priority = 'Medium';
            ts.Subject = 'Follow up on shipped order ' + event.Order_Number__c;
 			ts.OwnerId = usr;
            // (Note: You are assigning the task OwnerId to the same user who published the event. 
            // This step keep things simple so you don't have to perform any prerequisites.)
            tasks.add(ts);
        }
   }
    // Insert all cases corresponding to events received.
    insert tasks;
}