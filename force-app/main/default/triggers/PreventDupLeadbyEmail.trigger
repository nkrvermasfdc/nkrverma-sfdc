trigger PreventDupLeadbyEmail on Lead (before update) {    

    Set<String> leadEmail       = new Set<String>();
    Set<String> leadEmailExists = new Set<String>();
    
    for(Lead newLeads: Trigger.New){
        if (newLeads.Email != null){
               if (newLeads.Email <> Trigger.oldMap.get(newLeads.Id).Email){
                  leadEmail.add(newLeads.Email);
               }
        }
    }       
    
    for(Lead LeadExists: [SELECT ID,Email from Lead where Email in :leadEmail]){
       leadEmailExists.add(LeadExists.Email);
    }
    
    for(Lead aLead: Trigger.new){
       if (leadEmailExists.contains(aLead.Email)){
          aLead.Email.addError('Duplicate Email');//this will throw error at field level
    //  aLead.addError(); //This will throw error at page level

       }
    }    

}