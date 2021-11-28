/*----------------------------------------------------------------------------------------------- 
Date    == 28-Feb-2020
purpose == Trailhead -- Hands-on Challenge
Path    == 
URL     == 
purpose == Trailhead -- Learning Objective for 
Path    == Developer Beginner -> Apex Testing -> Test Apex Triggers
URL     == https://trailhead.salesforce.com/content/learn/modules/apex_testing/apex_testing_triggers?trail_id=force_com_dev_beginner
------------------------------------------------------------------------------------------------*/
trigger AccountDeletion on Account (before delete)
{
    // Prevent the deletion of accounts if they have related opportunities.
    for (Account a : [SELECT Id FROM Account WHERE Id IN (SELECT AccountId FROM Opportunity) AND Id IN :Trigger.old]) 
    {
        Trigger.oldMap.get(a.Id).addError('Cannot delete account with related opportunities.');
    }   
}