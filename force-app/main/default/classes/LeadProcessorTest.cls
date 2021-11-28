@isTest 
private class LeadProcessorTest{ 


    @testSetup 
    static void setup() { 
        List<Lead> Leads = new List<Lead>(); 

        // insert 200 Leads
        for (Integer i=0;i<200;i++) { 
            Leads.add(new Lead(LastName='New '+ i, Company='Dreamforce Company', LeadSource='Dreamforce', Status='Open')); 
        } 

        insert Leads; 
    } 

    
    static testmethod void test() {         
        Test.startTest(); 
        
        String Q = 'SELECT ID, Description FROM Lead';
        String E = 'Lead';
        String F = 'LeadSource';
        String V = 'Dreamforce';        
        
        LeadProcessor LP = new LeadProcessor(Q,E,F,V); 
        Id batchId = Database.executeBatch(LP); 
        Test.stopTest(); 

        // after the testing stops, assert records were updated properly 
         System.assertEquals(200, [select count() from Lead where LeadSource='Dreamforce']); 
    } 
   
}