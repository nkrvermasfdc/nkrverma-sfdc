/*----------------------------------------------------------------------------------------------- 
Date    == 10-March-2020
purpose == Trailhead -- Hands-on Challenge
Path    == Developer Beginner -> Apex Testing -> Test Apex Triggers
URL     == https://trailhead.salesforce.com/content/learn/modules/apex_testing/apex_testing_triggers?trail_id=force_com_dev_beginner
------------------------------------------------------------------------------------------------*/

@istest
private class TestRestrictContactByName 
{
    @istest static void testInsert()
    {
        Contact d = new Contact(LastName='INVALIDNAME', FirstName='Error');        
        Test.StartTest();
        try
        {
            insert d;
        }
        catch (Exception e)
        {
            Test.StopTest();
        }
    }
}