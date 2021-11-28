/* ==========================================================================================================================
 * Date    == 11-June-2020
 * Purpose == Trailhead -- Hands-on Challenge
 * Path    == Apex Integration Services -> Apex Web Services 
 * URL     == https://trailhead.salesforce.com/en/content/learn/modules/apex_integration_services/apex_integration_webservices
 * ========================================================================================================================== */
@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager { 
    
    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        // grab the Account from the end of the URL
        String accountId = request.requestURI.substringBetween('/Accounts/','/contacts');
        Account result   =  [SELECT Id, Name, (Select Id, Name from Contacts) from Account where Id=: accountId];
        return result;
    }
    
}