trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) 
{
    List<Task> TasktoInsert = new List<Task>();
    String           userId = UserInfo.getUserId();
    
    for(Opportunity Opp : Trigger.New) 
    {
        if(Opp.StageName == 'Closed Won')
        {
            Task TSK     = new Task();
            //TSK.OwnerId  = userId;
            TSK.Subject  = 'Follow Up Test Task';
            TSK.Status   = 'New';
            TSK.Priority = 'High';
            TSK.WhatId   = Opp.Id;
            
            TasktoInsert.add(TSK);
            
            //t.OwnerId = userId;
            //t.Subject = ‘Hello World’;
            //t.Status = ‘Open’;
            //t.Priority = ‘Normal’;
            //t.WhatId = o.Id;            
            //This is the default...
            //tsk.OwnerId = UserInfo.getUserId();
            //tsk.Type = 'Call';
            //insert tsk;
            //oppList.add(new Opportunity(Name=a.Name + ' Opportunity', StageName='Prospecting', CloseDate=System.today().addMonths(1), AccountId=a.Id));

        }
    }
    
    insert TasktoInsert;
}