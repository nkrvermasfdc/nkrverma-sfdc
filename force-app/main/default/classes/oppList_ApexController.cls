public class oppList_ApexController
{   
    @AuraEnabled
    public static List<Opportunity> apexController_oppList()
    {
        return [Select Name, CloseDate, Type From Opportunity];
    }
}