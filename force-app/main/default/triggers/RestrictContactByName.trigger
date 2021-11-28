/*----------------------------------------------------------------------------------------------- 
Date    == 10-March-2020
purpose == Trailhead -- Hands-on Challenge
Path    == Developer Beginner -> Apex Testing -> Test Apex Triggers
URL     == https://trailhead.salesforce.com/content/learn/modules/apex_testing/apex_testing_triggers?trail_id=force_com_dev_beginner
------------------------------------------------------------------------------------------------*/

trigger RestrictContactByName on Contact (before insert, before update) 
{	
	//check contacts prior to insert or update for invalid data
	For (Contact c : Trigger.New) 
    {
		if(c.LastName == 'INVALIDNAME') 
        {	//invalidname is invalid
			c.AddError('The Last Name "'+c.LastName+'" is not allowed for DML');
		}

	}
}