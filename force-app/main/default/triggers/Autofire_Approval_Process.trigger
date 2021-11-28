trigger Autofire_Approval_Process on  Opportunity (after update,after insert) {

    for (Opportunity opp :  Trigger.new) {

        if ( opp.Discount_Rate__c > 3 && opp.StageName == 'Closed Won' ) {
        
            Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();
            req.setComments('Opportunity Submitted for approval');
            req.setObjectId(opp.Id);
            Approval.ProcessResult approvalResult = Approval.process(req);
            
            System.debug('Opportunity submitted for approval successfully: '+approvalResult .isSuccess());
        }
    }
}