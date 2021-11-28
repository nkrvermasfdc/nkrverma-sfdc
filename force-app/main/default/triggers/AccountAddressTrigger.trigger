/*----------------------------------------------------------------------------------------------- 
Date    == 28-Feb-2020
purpose == Trailhead -- Hands-on Challenge
Path    == Apex Triggers -> Get Started with Apex Triggers
URL     == https://trailhead.salesforce.com/en/content/learn/modules/apex_triggers/apex_triggers_intro
------------------------------------------------------------------------------------------------*/

trigger AccountAddressTrigger on Account (before insert, before update) 
{
     for(Account a : Trigger.New) 
     {
         if( a.Match_Billing_Address__c == True) 
         {
             if(a.BillingPostalCode != NULL)
             {
                 a.ShippingPostalCode = a.BillingPostalCode;
             }
         }
     }
}