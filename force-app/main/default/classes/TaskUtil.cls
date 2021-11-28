/*----------------------------------------------------------------------------------------------- 
Date    == 10-March-2020
purpose == Trailhead -- Learning Objective
Path    == Developer Beginner -> Apex Testing -> Get Started with Apex Unit Tests
URL     == https://trailhead.salesforce.com/en/content/learn/modules/apex_testing/apex_testing_intro?trail_id=force_com_dev_beginner
------------------------------------------------------------------------------------------------*/

public class TaskUtil 
{
    public static String getTaskPriority(String leadState) 
    {
        // Validate input
        if (String.isBlank(leadState) || leadState.length() > 2) {
            return null;
        }
            
        String taskPriority;
        
        if (leadState == 'CA') {
             taskPriority = 'High'; 
        } else {
             taskPriority = 'Normal';
        }
        
        return taskPriority;
    }
}