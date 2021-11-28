public class NewCaseListController
{
   
    
    public List<Case> getNewCases() 
    {    
     //List<Case> results;
     List<Case> results = Database.query('SELECT CaseNumber, Id FROM Case Limit 10');
     return results;
    }


}