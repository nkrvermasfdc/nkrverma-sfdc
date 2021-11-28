Public Class dynamicvfp_controller{

    // Initatingthe Variables
    String Label = 'Ann Revenue Controller'; 
    String Label1;
    String Label2;
    String Label3;   
    String CalledMethod;
    
    List<User> UsersCountry{get; set;}
    
    Public dynamicvfp_controller(Apexpages.StandardController cont){}

   // UsersCountry Methods
   Public List<User> UsersCountry() {
    return [SELECT Country FROM User where ID = :UserInfo.getUserID() ];
   } 

   // Method to fetch dynamic label of fields
   Public Void ProcessLabels(){  
    // Getting User Country Code from User object() ;
    UsersCountry = this.UsersCountry();
    // Preparing List of record from oFieldLabel    
    List<oFieldLabel__c> FD1L = [Select FieldLabel__c, FieldName__c from oFieldLabel__c where FieldName__c in('FD1','FD2','FD3') and Country_Code__c=:UsersCountry[0].Country];
           
    for(oFieldLabel__c F:FD1L){
    
        if (CalledMethod == 'Label1'){
              if(F.FieldName__c=='FD1'){
                    Label1 = F.FieldLabel__c;
               }
        }
        
        if (CalledMethod == 'Label2'){       
              if(F.FieldName__c=='FD2'){
                Label2 = F.FieldLabel__c;           
              }
        }
        
        if (CalledMethod == 'Label3'){      
            if(F.FieldName__c=='FD3'){
               Label3 = F.FieldLabel__c;               
               //Label3 = 'User Country : ' + UsersCountry[0].Country + ' User Name : ' + UserInfo.getUserName() ;
            }
       }
             
     }   
   }
   
   // Returns the List of all Employees            
    Public List<objfordynamicvfpage__c> getAll_Employee(){
        List<objfordynamicvfpage__c> All_Employee = [Select Name, F1_Text__c, F2_Number__c, F3_Ceckbox__c from objfordynamicvfpage__c];
        return All_Employee ;
    }

   // Returns Label1
   Public String getLabel1(){
   CalledMethod = 'Label1';
   this.ProcessLabels();   
   return Label1;
   }

   // Returns Label2   
   Public String getLabel2(){
   CalledMethod = 'Label2';
   this.ProcessLabels();
   return Label2;
   } 

   // Returns Label3    
   Public String getLabel3(){
   CalledMethod = 'Label3';
   this.ProcessLabels();
   return Label3;
   } 

}