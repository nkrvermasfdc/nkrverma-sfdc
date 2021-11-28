/* ==========================================================================================================================
 * Date    == 15-June-2020
 * Purpose == Trailhead -- Hands-on Challenge
 * Path    == Asynchronous Apex -> Schedule Jobs Using the Apex Scheduler 
 * URL     == https://trailhead.salesforce.com/en/content/learn/modules/asynchronous_apex/async_apex_scheduled
 * ========================================================================================================================== */
@isTest
private class DailyLeadProcessorTest {
    
    @isTest
    public static void testDailyLeadProcessor(){

        //Creating new 200 Leads and inserting them.
        List<Lead> leads = new List<Lead>();
        for (Integer x = 0; x < 200; x++) {
            leads.add(new Lead(lastname='lead number ' + x, company='company number ' + x));
        }
        insert leads;

        //Starting test. Putting in the schedule and running the DailyLeadProcessor execute method.
        Test.startTest();
        String jobId = System.schedule('DailyLeadProcessor', '0 0 12 * * ?', new DailyLeadProcessor());
        Test.stopTest();

        //Once the job has finished, retrieve all modified leads.
        List<Lead> listResult = [SELECT ID, LeadSource FROM Lead where LeadSource = 'Dreamforce' LIMIT 200];

        //Checking if the modified leads are the same size number that we created in the start of this method.
        System.assertEquals(200, listResult.size());

    }
}


/*@isTest 
Public Class DailyLeadProcessorTest
{
    @testSetup 
    static void setup() 
    { 
        List<Lead> Leads  = new List<Lead>(); 
        
        // insert 200 Leads
        for (Integer i=0;i<200;i++) 
        { 
           Leads.add(new Lead(LastName='New '+ i, Company='Dreamforce Company', LeadSource='', Status='Open')); 
        } 
        
        // Inserting Leads       
        insert Leads;        
        
        // Selecting Above created Leads
        List<Lead> UL = [Select ID, LeadSource from Lead where Company='Dreamforce Company' and LeadSource='' and Status = 'open' Limit 200];
        
        //Updating Selected Leads        
        for (Lead UL_E : UL)
        {
            UL_E.LeadSource = 'Dreamforce';
        }
        
        Update UL;
            
        List<Lead> DFLSL = [Select LeadSource from Lead where Company='Dreamforce Company' and LeadSource='Dreamforce' and Status = 'open'];
        Integer Count = DFLSL.Size();
        
        system.assertequals(200,Count);
    } 



    static testmethod void test() 
    {    
    DailyLeadProcessor DLP = new DailyLeadProcessor(); 
    
    // Seconds Minutes Hours Day_of_month Month Day_of_week optional_year 
    String sch = '20 30 8 10 2 ?'; 
    String jobID = System.schedule('Daily Lead Processor', sch, DLP); 

    }
}*/