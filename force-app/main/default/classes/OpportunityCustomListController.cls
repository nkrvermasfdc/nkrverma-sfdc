public class OpportunityCustomListController {

    public ApexPages.StandardSetController Opps
    {
        get
        {
            if(Opps == null)
            {
                Opps = new ApexPages.StandardSetController(Database.getQueryLocator([Select Name, CloseDate, Amount from Opportunity]));
            }
        return Opps;
        }
        
        set;
    }

    public List<Opportunity> getOpportunities() 
    {
        return (List<Opportunity>)Opps.getRecords();
    }

}