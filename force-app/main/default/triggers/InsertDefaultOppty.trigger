/**
 * Description: This trigger will evaluate account's annual
 * revenue whenever they are created and if found more than 
 * 5,00,000 then creates a new opportunity with
 * following values.
 * Name         = [Account Name] + Default Oppty
 * Close Date   = Today + 30 days
 * Stage        = Qualification
 *
 * Created By: Siddharth Pandit
 * Created Date: 15/07/17
 **/
 
trigger InsertDefaultOppty on Account (after insert) {
    List<Opportunity> opptyToInsert = new List<Opportunity> ();
    for (Account acc : Trigger.new) {
        if (acc.AnnualRevenue >= 500000) {
            Opportunity oppty       = new Opportunity ();
            oppty.Name              = acc.Name + ' --> (Opportunity)';
            oppty.StageName         = 'Qualification';
            oppty.CloseDate         = Date.today () + 30;
            //oppty.Close_Reason__c = 'Lower Price';
            oppty.AccountId         = acc.Id;
            opptyToInsert.add (oppty); // add in the list
        } // End if
    } // End for
    if (opptyToInsert.size () > 0)
        insert opptyToInsert; // inserting list oppty
} // End trigger