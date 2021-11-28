@isTest 
private class AppleWatchTest 
{ 
    @isTest static void CreateOpportunity() 
    {
     Opportunity opp     = new Opportunity();
     opp.Name            = 'Swift Deal';
     opp.StageName       = 'Prospecting';
     opp.CloseDate       = Date.today();
     //opp.RecordTypeId	 = '0127F000000kczEQAQ';
     insert opp;
    }
}