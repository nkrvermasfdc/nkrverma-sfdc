/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class InsertDefaultOpptyTest{

    static testMethod void testTriggerCode () {
        // Create test data
        Account acc = new Account (Name = 'TestAcc', AnnualRevenue = 500000, Industry = 'Banking');
        insert acc;
        Test.Starttest();
        Opportunity oppty = [SELECT Id, StageName, CloseDate FROM Opportunity WHERE AccountId = :acc.Id];
        System.assertEquals (true, oppty != null);
        System.assertEquals ('Qualification', oppty.StageName);
        System.assertEquals (Date.today() + 30, oppty.CloseDate);
        Test.stopTest();        
    }
    
    static testMethod void coverControllerCode () {
        // Test data
        Account acc = new Account (Name = 'Test Acc');
        insert acc;
        Contact con = new Contact (LastName = 'Test Con',
                                    AccountId = acc.Id);
        insert con;
        Case cs = new Case (Priority = 'High', Status= 'Closed', AccountId = acc.Id, ContactId = con.Id);
        insert cs;

        JqueryDataTableContrlr dataTable = new JqueryDataTableContrlr ();
        List<Case> caseList = dataTable.getCaseList ();
        System.assertEquals (1, caseList.size ());
        System.assertEquals ('Closed', caseList.get (0).Status);
        System.assertEquals (cs.Id, caseList.get (0).Id);
    }
    
    
}