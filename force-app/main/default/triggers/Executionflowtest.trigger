trigger Executionflowtest on T_Object__c (before insert, after insert, before update, after update, before delete, after delete) {

if (Trigger.isBefore) {
    if (Trigger.isInsert) {
      // Call class logic here!
        for(T_Object__c O : Trigger.new){
        if (O.Contact_no__C == 111){
            O.adderror('Trigger -- contact cant ve saved as blank');
        }
    }

    } 
    if (Trigger.isUpdate) {
      // Call class logic here!
    }
    if (Trigger.isDelete) {
      // Call class logic here!
    }
  }

  if (Trigger.IsAfter) {
    if (Trigger.isInsert) {
      // Call class logic here!
    } 
    if (Trigger.isUpdate) {
      // Call class logic here!
    }
    if (Trigger.isDelete) {
      // Call class logic here!
    }
  }
  
  
}