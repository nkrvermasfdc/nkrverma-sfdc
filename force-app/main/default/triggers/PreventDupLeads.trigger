/**
 * Description: You will add later on
 **/
trigger PreventDupLeads on Lead (before insert) {
    Set<String> leadEmail = new Set<String> ();
    for (Lead lead : Trigger.new) {
        if (lead.Email != null) {
            leadEmail.add (lead.Email);
        }
    } // End for

    Set<String> leadEmailExist = new Set<String> ();
    for (Lead leadExist : [SELECT Id, Email FROM Lead WHERE Email IN :leadEmail]) {
        leadEmailExist.add (leadExist.Email);
    }
    // Appnding error for dups
    for (Lead aLead : Trigger.new) {
        if (leadEmailExist.contains (aLead.Email))
            aLead.Email.addError ('Duplicate Email!');
    }
} // End trigger

/*/**
Description 

**/
/*trigger PreventDups on Lead (before insert) {
    
    Set<String> leadEmail = new Set<String> ();
    For (Lead lead : Trigger.new){
        if (Lead.Email != null) {
            leadEmail.add (lead.Email);
        }
    }
    
    Set<String> leadEmailExist = new Set<String> ();
    For (Lead leadExist : [SELECT Id, Email
                           From Lead
                           WHERE Email IN : leadEmail] ){
         leadEmailExist.add(leadExist.Email);                      
    }
    
    // Appanding error for dups
    for(Lead aLead : Trigger.new) {
        if (leadEmailExist.contains (aLead.Email))
            aLead.Email.addError ('Duplicate email');
    }    
}// End Trigger*/