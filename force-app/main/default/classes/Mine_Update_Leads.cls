Public Class Mine_Update_Leads{

    Public void Update_Lead(){
        integer I = 0;
        List <Lead> Leads = [SELECT ID from Lead where Status='Open' and LeadSource='Dreamforce' Limit 200];

        For (Lead LTU:Leads){
            i = i+1;
            System.debug('Lead Number : ' +i);
        
            LTU.LeadSource ='';      
        }   
         
        Update Leads; 
    }       
    
       // public void Method(){
   // };

}