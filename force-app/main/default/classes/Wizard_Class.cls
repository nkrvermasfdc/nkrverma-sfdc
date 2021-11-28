Public Class Wizard_Class{

    Account a = new Account();
    Contact c = new Contact();
    Opportunity o = new Opportunity();
    String n = '';
    
    Public Account geta(){
    return a;    
    }

    Public Contact getc(){
    return c;    
    }
    
    Public Opportunity geto(){
    return o;    
    }
        
    // Method to redirect the control to wizard Complete accountPage
    Public Pagereference goto_accountPage(){
        return page.accountPage;
    }

    // Method to redirect the control to wizard Complete contactPage
    Public Pagereference goto_contactPage(){
        return page.contactPage;
    }
    
    // Method to redirect the control to wizard Complete opportunityPage
    Public Pagereference goto_opportunityPage(){
        return page.opportunityPage;
    }

    // Method to redirect the control to wizard Complete reviewPage
    Public Pagereference goto_reviewPage(){
        return page.reviewPage;
    }
    
    
    // Method to redirect the control to wizard Complete Page
    Public Pagereference wizard_Complete(){            
        return page.wizardComplete;
    } 

    // Method to make system Sleep for specified mili seconds
    Public void sleep(Long milliSeconds){
        Long timeDiff = 0;
        DateTime firstTime = System.now();
          do{
            timeDiff = System.now().getTime() - firstTime.getTime();
            }while(timeDiff <= milliSeconds);
    }

       
       
    // Method to Save data on page to database    
    Public Pagereference save_now(){
    Integer start = System.Now().millisecond();    
    Integer length_result = a.name.length();
    Integer Error_O       = 0;
    
        if ((a.name == null) || (a.name=='') || (a.name==' ') || (length_result==1)  ){
            Error_O = Error_O + 1;
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Enter Proper value of Account with more then one chracter'));  
        }
        
        if (Error_O == 0 ){
            insert a;        
            c.AccountID = a.ID;
            insert c;        
            o.AccountID = a.ID;
            insert o;
            
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Account, Contact and Opportunity created.'));  
            
           // while(System.Now().millisecond()< start+50){ 
            //}
            
            //this.sleep(500);            
            //this.wizard_Complete();

        }
        
        return page.wizardComplete;
    }

    

}