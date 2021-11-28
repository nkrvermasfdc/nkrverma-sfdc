/*----------------------------------------------------------------------------------------------- 
Date    == 10-March-2020
purpose == Trailhead -- Hands-on Challenge
Path    == Developer Beginner -> Apex Testing -> Create Test Data for Apex Tests
URL     == https://trailhead.salesforce.com/content/learn/modules/apex_testing/apex_testing_data?trail_id=force_com_dev_beginner
------------------------------------------------------------------------------------------------*/
public class RandomContactFactory 
{
    public static List<contact> generateRandomContacts(integer numofContacts, string LastNameGen)
    {
        List<Contact> con = new List<Contact>();
        for(Integer i=0; i<numofContacts; i++)
        {
            LastNameGen = 'Test' + i;
            Contact a = new Contact(FirstName = LastNameGen, LastName = LastNameGen);
            con.add(a);
        }
        return con;
    }
}