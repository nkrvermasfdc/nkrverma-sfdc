Trigger priorityonTask on Task (before insert, before update)
{    
    PriorityOnTask POT = new PriorityOnTask();    
    POT.Process_To_get_OpptyList(Trigger.new);
}






//=====================================================================================================//       
    //List<Task> To_Update = NEW List<Task>();
    //account a = new <account>();
    //List<PriorityOnTask> POT = new List<PriorityOnTask>();    
    //List<Account> a1 = new list<account>();    
    //account a = [Select ID from account];    
    //String Return_String;
    //Return_String = PriorityOnTask.PriorityOnTask_Test();
    //EmailExample emailHandler = new EmailExample();
    //String Return_String;    
    //To_Update = POT.Process_To_get_OpptyList(Trigger.new);
    //To_Update.adderror('List to Update --> ' + To_Update);
     
 /* for(Task T:Trigger.new)
    {
        PriorityOnTask POT = new PriorityOnTask();
        To_Update          = POT.Process_To_get_OpptyList(T.ID);
        
        T.adderror('List to Update --> ' + To_Update);
        
        if(Return_String != 'NO_ERROR')
        {//T.adderror('No Error --> ' + Return_String);}
        else
        { T.adderror('Error -->' + Return_String);}
    }
    //Update To_update; */
//=====================================================================================================//