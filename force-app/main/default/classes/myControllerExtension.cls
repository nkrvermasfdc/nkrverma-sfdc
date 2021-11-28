public class myControllerExtension {

    Account Acc = new Account();
    
    private final account acct;    

    public myControllerExtension(ApexPages.StandardController stdcontroller) 
    {
        this.acct=(account)stdcontroller.getRecord();
    }

    public String getGreeting()
    {
        return 'hello '+acct.name + '('+acct.id+')';
    }



}


//    {!greeting} <p/>
//Account objAccount = [SELECT Name FROM Account LIMIT 1];
        //ApexPages.StandardController standctrl = new ApexPages.StandardController(objAccount );

//Account objAccount = [SELECT Name FROM Account LIMIT 1];
//ApexPages.StandardController standctrl = new ApexPages.StandardController(objAccount );


//List<account> accountList = [SELECT Name FROM Account LIMIT 20];
//ApexPages.StandardSetController ssc = new ApexPages.StandardSetController(accountList);






//