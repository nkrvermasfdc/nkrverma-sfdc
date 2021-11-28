Public Class PriorityOnTask
{
    Public Task              Whoid_Task         {get;set;} // Declaring -- Defining
    Public Contact           AccountID_Contact  {get;set;} // Declaring -- Defining
    Public List<Opportunity> List_Oppty         {get;set;} // Declaring -- Defining    
    Public List<Task>        List_Task_to_Update{get;set;} // Declaring -- Defining
    
    Public Void PriorityOnTask(){}                         //Constructor; 
    
    
               
    Public Void Process_To_get_OpptyList(List<Task> Trigger_Task_List)         //Method
    {
        
        try
        {
            Whoid_Task             = NEW Task();                  //Initialization--Assignment allocates space in memory
            AccountID_Contact      = NEW Contact();               //Initialization--Assignment allocates space in memory        
            List_Oppty             = NEW LIST<OPPORTUNITY>();     //Initialization--Assignment allocates space in memory
            List_Task_to_Update    = NEW List<Task>();            //Initialization--Assignment allocates space in memory
                    
            Whoid_Task             = [SELECT ID,Whoid,Priority__C  FROM TASK where ID IN :Trigger_Task_List];  
            AccountID_Contact      = [SELECT ID,ACCOUNTID FROM CONTACT WHERE ID =:Whoid_Task.Whoid];         
            List_Oppty             = [SELECT ID, OPPORTUNITY_SIZE__C, STAGE_NAME__c FROM OPPORTUNITY WHERE ACCOUNTID =:AccountID_Contact.ACCOUNTID];
              
            for (Opportunity Oppty : List_Oppty)
            {
                
                if((Oppty.OPPORTUNITY_SIZE__C == '1') && (Oppty.STAGE_NAME__c == '1' || Oppty.STAGE_NAME__c == '3' || Oppty.STAGE_NAME__c == '6'))
                {
                    Whoid_Task.Priority__C = '1';
                }
                else if((Oppty.OPPORTUNITY_SIZE__C == '2') && (Oppty.STAGE_NAME__c == '1'))
                {
                    Whoid_Task.Priority__C = '2';
                }
                else if((Oppty.OPPORTUNITY_SIZE__C == '2') && (Oppty.STAGE_NAME__c == '6'))
                {
                    Whoid_Task.Priority__C = '3';
                }
                else
                {
                    Whoid_Task.Priority__C = '4';
                }
                
            List_Task_to_Update.add(Whoid_Task);  
            
            //Integer I = List_oppty.Size();
            //System.debug('List_oppty.Size() ==> ' + List_oppty.Size());
            //System.debug('Who Id Task ==> ' + Whoid_Task.ID + ' ------------ AccountID_Contact.ACCOUNTID  ==> ' + AccountID_Contact.ACCOUNTID + ' ----------- List_Oppty ==> ' + List_Oppty + ' ----------- List_Task_to_Update ==> ' + List_Task_to_Update);
            }
             
            System.debug('Who Id Task ==> ' + Whoid_Task.ID + ' ------------ AccountID_Contact.ACCOUNTID  ==> ' + AccountID_Contact.ACCOUNTID + ' ----------- List_Oppty ==> ' + List_Oppty + ' ----------- List_Task_to_Update ==> ' + List_Task_to_Update);
            System.debug('Loop Check ' + 'NKV');
            Update List_Task_to_Update;
        }
        Catch(exception e)
        {
        System.debug('The following exception has occurred: ' + e.getMessage());
        }

        //Update List_Task_to_Update;
        //Return List_Task_to_Update;        
    }    
}    
    
    
    
    
    
    
//=====================================================================================================//
/*
try
        {
            Whoid_Task             = NEW Task();                  //Initialization--Assignment allocates space in memory
            AccountID_Contact      = NEW Contact();               //Initialization--Assignment allocates space in memory        
            List_Oppty             = NEW LIST<OPPORTUNITY>();     //Initialization--Assignment allocates space in memory
            List_Task_to_Update    = NEW List<Task>();            //Initialization--Assignment allocates space in memory
                    
            Whoid_Task             = [SELECT ID,Whoid,Priority__C  FROM TASK where ID IN :Trigger_Task_List];  
            AccountID_Contact      = [SELECT ID,ACCOUNTID FROM CONTACT WHERE ID =:Whoid_Task.Whoid];         
            List_Oppty             = [SELECT ID, OPPORTUNITY_SIZE__C, STAGE_NAME__c FROM OPPORTUNITY WHERE ACCOUNTID =:AccountID_Contact.ACCOUNTID];
              
            for (Opportunity Oppty : List_Oppty)
            {
                
                if((Oppty.OPPORTUNITY_SIZE__C == '1') && (Oppty.STAGE_NAME__c == '1' || Oppty.STAGE_NAME__c == '3' || Oppty.STAGE_NAME__c == '6'))
                {
                    Whoid_Task.Priority__C = '1';
                }
                else if((Oppty.OPPORTUNITY_SIZE__C == '2') && (Oppty.STAGE_NAME__c == '1'))
                {
                    Whoid_Task.Priority__C = '2';
                }
                else if((Oppty.OPPORTUNITY_SIZE__C == '2') && (Oppty.STAGE_NAME__c == '6'))
                {
                    Whoid_Task.Priority__C = '3';
                }
                else
                {
                    Whoid_Task.Priority__C = '4';
                }
                
            List_Task_to_Update.add(Whoid_Task);  
            
            Integer I = List_oppty.Size();
            System.debug('List_oppty.Size() ==> ' + List_oppty.Size());
            System.debug('Who Id Task ==> ' + Whoid_Task.ID + ' ------------ AccountID_Contact.ACCOUNTID  ==> ' + AccountID_Contact.ACCOUNTID + ' ----------- List_Oppty ==> ' + List_Oppty + ' ----------- List_Task_to_Update ==> ' + List_Task_to_Update);
            }
            Update List_Task_to_Update;                     
        }
        Catch(exception e)
        {
        System.debug('The following exception has occurred: ' + e.getMessage());
        }

*/


/*Public static String PriorityOnTask_Test()
    {
        String S = 'Test String NKV';
        Return S;
    }*/


/*
    set<id> ContactIds = new set<id>();  // Declaring -- Defining
    set<id> op         = new set<id>();  // Declaring -- Defining
    
    Public List<Event>   L_Event_Whoid {get;set;}     // Declaring -- Defining
    Public List<contact> L_Contact_AccountID {get;set;}         // Declaring -- Defining
    
    public PriorityOnTask()
    {    
        L_Event_Whoid       = new List<Event>();      //Initialization allocates space in memory
        L_Contact_AccountID = new List<Contact>();    //Initialization allocates space in memory
        
        L_Event_Whoid       = [SELECT ID, WHOID FROM Event Limit 1];  
        
        for(Event E : L_Event_Whoid)
        {
            ContactIds.add(E.WhoId);
        }
        
        L_Contact_AccountID = [SELECT ID, AccountID from Contact where ID IN : ContactIds Limit 1 ];
    }
   
*/
//=====================================================================================================//