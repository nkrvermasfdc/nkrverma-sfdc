/* ==========================================================================================================================
 * Date    == 15-June-2020
 * Purpose == Trailhead -- Hands-on Challenge
 * Path    == Asynchronous Apex -> Schedule Jobs Using the Apex Scheduler 
 * URL     == https://trailhead.salesforce.com/en/content/learn/modules/asynchronous_apex/async_apex_scheduled
 * ========================================================================================================================== */
global class DailyLeadProcessor implements Schedulable 
{
    global void execute(SchedulableContext ctx) 
    {   
        Integer i=0;
        //Retrieving the 200 first leads where lead source is in blank.
        List<Lead> Leads = [SELECT ID, LeadSource from Lead where LeadSource='' Limit 200];     

        //Setting the LeadSource field the 'Dreamforce' value.
        For (Lead L:Leads)
        {
            i = i+1;
            System.debug('Lead updated number : ' +i);
            L.LeadSource ='Dreamforce';      
        }   
        
        Update Leads;            
    } 
}