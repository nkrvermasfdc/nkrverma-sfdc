/**
 * Description: You will add later on
 **/
trigger UpdateTrackingNum on Opportunity (before insert) {
    
    for (Opportunity oppty : Trigger.new) { 
        
        if (oppty.RecordTypeId == '0127F000000kczE'){
            Integer count = [SELECT COUNT() FROM Opportunity where RecordTypeID = '0127F000000kczE'];
            count ++;
            oppty.TrackingNumber__C  = 'B2B-00' +count;
            }
        
        if (oppty.RecordTypeId == '0127F000000kczT'){
           Integer count = [SELECT COUNT() FROM Opportunity where RecordTypeID = '0127F000000kczT'];  
           count ++;
           oppty.TrackingNumber__C  = 'B2C-00' +count;
            }    
    }
} // End trigger