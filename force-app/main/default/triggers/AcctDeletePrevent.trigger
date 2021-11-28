trigger AcctDeletePrevent on Account (before delete) 
{
    //List <Opportunity> Opp(get;set;)                            //Variable declaration
    //List <Opportunity> Opp = new List<Opportunity>();           //Initallization allocating memory
    
    List <Opportunity> Opp = [Select ID, accountID from opportunity where accountid in :TRIGGER.OLD]; 
    List <Account>     Acc = [SELECT Id, (SELECT Id FROM Opportunities) FROM Account WHERE Id IN : Trigger.old];
    
    integer SOQL_on_Oppty_Account = 2;
    
    for(Account a : Acc)
    {
        if(a.Opportunities.size()!=0)
        {
            a.addError('Account have Opportunity so you can not delete this Account -- Account 1');
        }
    }
    
    
 
    
    
    
    for(Account acct: trigger.old)
    {    
        if(Trigger.isBefore)
        {
            if(Trigger.isDelete)
            {
                //----------------------- Approach with SOQL on Account object ---------------------------
                if (SOQL_on_Oppty_Account == 2)
                { 
                    for(Account a : Acc)
                    {
                        if(a.Opportunities.size()!=0)
                        {
                            acct.addError('Account have Opportunity so you can not delete this Account -- Account 1');
                        }
                    }
                }
                
                //---------------------- Approch with SOQL on Opportunity Object -------------------
                if (SOQL_on_Oppty_Account == 1)
                {                    
                    // Second Approch error   Working
                    for(Opportunity o : Opp)
                    {
                        if(acct.id == o.accountId)
                        {
                            acct.addError('Account have Opportunity so you can not delete this Account -- Approach 2');
                        }
                    }
                
                    // First Approch error    Working
                    if (Opp.size() !=0 || !Opp.isempty())
                    {
                        acct.addError('Account have Opportunity so you can not delete this Account -- Approach 1');
                    }
                }
                //---------------------------------------------------------------------------------------
                
                
                   
            }
        }
        
        
        
        
    }
}






//=================================================== Generic ==================================================

// Approach two //

/*
trigger AcctDeletePrevent on Account (before delete) 
{
    for(Account acct: trigger.old)
    {
        if(Trigger.isBefore)
        {
            if(Trigger.isDelete)
            {
                acct.adderror('You cannot delete the record -- NKV'); 
            }
        }
    }
}
*/

/*
@isTest

private class PreventAcctDel
{
    private static testMethod void testDeleteFail()
    {
           Account acc=new Account(Name='Test Account');
           insert acc;
           try
           {
              delete acc;
              System.assert(false);
           }
           catch (DMLException e)
           {
 
           }
    }
}
*/


// Approach One //
/*
trigger preventAccountDeletion on Account (before delete) 
{

   for(Account acc : trigger.old)
   {
        acc.adderror('Account Cannot be -- deleted');

   }

}
*/

/*
@isTest
private class testPreventAccountDeletion {
    
    static testmethod void testPreventAccDel(){
        Account accRecord = new Account(name='testAccount');
        insert accRecord;
        
        try{
            delete accRecord;
        }catch(DMLexception e){
            system.assert(e.getMessage().contains('Account Cannot be deleted'),'Account Cannot be deleted');                       
        }
    }
}
*/