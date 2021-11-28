Public Class YT_JeetSingh_Test0000{

/* -- 1 ------------------------------------------------------------------------------------------------------------------------ */                       
    String hello = 'How are you';

    Public String getmymethod(){
    return hello;
    }
        
/* -- 2 ----------------------------------------------------------------------------------------------------------------------- */
    Account a = new Account (Name='Dell', Industry ='Technology');
      
    Public Account getmymethod2(){
    return a;
    }          
    
/* -- 3 ----------------------------------------------------------------------------------------------------------------------- */                       
    List<Account> acts = [Select Name, Type, Industry, phone, fax from Account where Industry = 'Energy'];
            
    Public List<Account> getacts(){
    return acts ;
    }
        
/* -- 4 ----------------------------------------------------------------------------------------------------------------------- */
    Account[] selectedacts;
        
    Public Account[] getselectedacts(){
    return selectedacts ;
    }
        
    Public PageReference showall(){
    selectedacts =  [select Name, Type, Industry, Phone, Fax from Account];
    return null;
    }
        
    Public PageReference direct(){
    selectedacts =  [select Name, Type, Industry, Phone, Fax from Account where Type = 'Customer - Direct'];
    return null;
    }
    /* -- E ----------------------------------------------------------------------------------------------------------------------- */        
}