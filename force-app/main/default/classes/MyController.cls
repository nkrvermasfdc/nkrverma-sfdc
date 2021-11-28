public class MyController {

    private final Account myAccount;

    public MyController() {
          myAccount = [SELECT Id, Name, Site FROM Account WHERE Id = '0017F00000KcdQU'];
//        myAccount = [SELECT Id, Name, Site FROM Account WHERE Id = :ApexPages.currentPage().getParameters().get('id')];
    }

    public Account getAccount() {
        return myAccount;
    }

    public PageReference save() {
        //Add your custom logic to update specific fields here
        //e.g. myAccount.email = 'xx@xx.com';
        Update myAccount;
        return null;
    }
}