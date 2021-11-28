Trigger prevent_Deletion on account(before delete){

    for (account a : Trigger.old){   
     
       List<Opportunity> opp = [Select ID from opportunity where accountid=:a.id];  //trigger.old[0]
    
        if (Trigger.isDelete && Trigger.isBefore){      

            if (opp.isempty()){
              a.adderror('--Error: -- No Linked Opportunity exist with Account ID :'+ a.id +' that is going to delete. --'); //Trigger.old[0]
            }else{
            
              a.adderror('--Error: -- Cant Delete the Account with ID # :  that is linked with an Opportunity ID --');
              //a.adderror('-Cant Delete a Banking Account 2-');
              //a.adderror('-Cant Delete a Banking Account 1-');
              //a.adderror('-Cant Delete a Banking Account 3-');              
            }             
        }
        
    }    
            
}