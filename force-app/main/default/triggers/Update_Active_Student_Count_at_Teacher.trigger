Trigger Update_Active_Student_Count_at_Teacher on Student__c (after insert) {

    set<ID> setofids = new set<ID>();  

    for (Student__c S:Trigger.new){    
        if(S.Active__c){        
        setofids.add(S.My_Teacher__c);
        }        
    }

    if(!setofids.isEmpty()){
        
        List<Teacher__c> TeachersToUpdate = new List<Teacher__c>();
        integer i = 0;
            
         for(Id TID : setofids){
           List <Teacher__c> T = [Select Total_Active_Students__c from Teacher__c where ID =:TID];
           
               if (T[0].Total_Active_Students__c == null){
                   T[0].Total_Active_Students__c=0;
               }
           
           TeachersToUpdate.add(new Teacher__c(Id = TID, Total_Active_Students__c=T[0].Total_Active_Students__c+1));
           i = i +1;
        }   

        if(!TeachersToUpdate.isEmpty()){
            UPDATE TeachersToUpdate;
        }

    }
        
}
        //List <Student__c> T = [Select My_Teacher__c from Student__c where Student_ID__c =: S.Student_ID__c ];