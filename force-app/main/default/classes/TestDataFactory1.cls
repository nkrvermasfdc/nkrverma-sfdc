/*----------------------------------------------------------------------------------------------- 
Date    == 10-March-2020
purpose == Trailhead -- Learning Objective
Path    == Developer Beginner -> Apex Testing -> Create Test Data for Apex Tests
URL     == https://trailhead.salesforce.com/content/learn/modules/apex_testing/apex_testing_data?trail_id=force_com_dev_beginner
------------------------------------------------------------------------------------------------*/
@isTest
public class TestDataFactory1
{
    public static List<Account> createAccountsWithOpps(Integer numAccts, Integer numOppsPerAcct) 
    {
        List<Account> accts = new List<Account>();        
        for(Integer i=0;i<numAccts;i++) 
        {
            Account a = new Account(Name='TestAccount' + i);
            accts.add(a);
        }
        insert accts;
        
        List<Opportunity> opps = new List<Opportunity>();
        for (Integer j=0;j<numAccts;j++) 
        {
            Account acct = accts[j];
            // For each account just inserted, add opportunities
            for (Integer k=0;k<numOppsPerAcct;k++) 
            {
                opps.add(new Opportunity(Name=acct.Name + ' Opportunity ' + k,
                                       StageName='Prospecting',
                                       CloseDate=System.today().addMonths(1),
                                       AccountId=acct.Id));
            }
        }
        // Insert all opportunities for all accounts.
        insert opps;
        
        return accts;
    }
}