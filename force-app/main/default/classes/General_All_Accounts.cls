Public Class General_All_Accounts{

    Public General_All_Accounts(Apexpages.StandardController cont){}
    
    String Hello='How are you';
    
    Public String gethello(){
    Hello = Hello+' -- Good ?';    
    return hello;
    }
}