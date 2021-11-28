/* ==========================================================================================================================
 * Date    == 11-June-2020
 * Purpose == Trailhead -- Hands-on Challenge
 * Path    == Apex Integration Services -> Apex Web Services 
 * URL     == https://trailhead.salesforce.com/en/content/learn/modules/apex_integration_services/apex_integration_webservices
 * ========================================================================================================================== */
@IsTest
private class AccountManagerTest {
    
    @isTest static void testContactsByAccountId() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri  = 'https://nkrverma-dev-ed.my.salesforce.com/services/apexrest/Accounts/'+ recordId+'/contacts';
        request.httpMethod  = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAccount = AccountManager.getAccount();
        // Verify results
        System.assert(thisAccount != null);
        System.assertEquals('Test record', thisAccount.Name);
    }
    
    // Helper method
    static Id createTestRecord() {
        // Create test record
        Account accountTest = new Account(Name='Test record');
        insert  accountTest;
        
        Contact contactTest = new contact(FirstName='John',LastName='Doe',AccountId=accountTest.id);
        insert  contactTest;
        
        return accountTest.Id;
    }          
}