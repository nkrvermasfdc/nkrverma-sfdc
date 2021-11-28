/*----------------------------------------------------------------------------------------------- 
Date    == 10-March-2020
purpose == Trailhead -- Learning Objective
Path    == Developer Beginner -> Apex Testing -> Get Started with Apex Unit Tests
URL     == https://trailhead.salesforce.com/en/content/learn/modules/apex_testing/apex_testing_intro?trail_id=force_com_dev_beginner
------------------------------------------------------------------------------------------------*/

public class TemperatureConverter 
{
    // Takes a Fahrenheit temperature and returns the Celsius equivalent.
    public static Decimal FahrenheitToCelsius(Decimal fh) 
    {
        Decimal cs = (fh - 32) * 5/9;
        return cs.setScale(2);
    }
}