/*----------------------------------------------------------------------------------------------- 
Date    == 10-March-2020
purpose == Trailhead -- Hands-on Challenge
Path    == Developer Beginner -> Apex Testing -> Get Started with Apex Unit Tests
URL     == https://trailhead.salesforce.com/en/content/learn/modules/apex_testing/apex_testing_intro?trail_id=force_com_dev_beginner
------------------------------------------------------------------------------------------------*/

@isTest
public class TestVerifyDate 
{
	@isTest static void testCheckDates1() {
        Date DT1 = VerifyDate.CheckDates(Date.valueOf(system.today()),Date.valueOf(system.today()).addDays(29));
        System.assertEquals(Date.valueOf(system.today()).addDays(29),DT1);
    }
    
    @isTest static void testCheckDates2() {
        Date DT2 = VerifyDate.CheckDates(Date.valueOf(system.today()),Date.valueOf(system.today()).addDays(69));
        System.assertEquals(Date.valueOf(system.today()).addDays(21),DT2);
    }
}