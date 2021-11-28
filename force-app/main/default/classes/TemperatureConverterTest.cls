/*----------------------------------------------------------------------------------------------- 
Date    == 10-March-2020
purpose == Trailhead -- Learning Objective
Path    == Developer Beginner -> Apex Testing -> Get Started with Apex Unit Tests
URL     == https://trailhead.salesforce.com/en/content/learn/modules/apex_testing/apex_testing_intro?trail_id=force_com_dev_beginner
------------------------------------------------------------------------------------------------*/

@isTest
private class TemperatureConverterTest {
    @isTest static void testWarmTemp() {
        Decimal celsius = TemperatureConverter.FahrenheitToCelsius(70);
        System.assertEquals(21.11,celsius);
    }    
    @isTest static void testFreezingPoint() {
        Decimal celsius = TemperatureConverter.FahrenheitToCelsius(32);
        System.assertEquals(0,celsius);
    }
    @isTest static void testBoilingPoint() {
        Decimal celsius = TemperatureConverter.FahrenheitToCelsius(212);        
        System.assertEquals(0,celsius,'Boiling point temperature is not expected.');
    }
    @isTest static void testNegativeTemp() {
        Decimal celsius = TemperatureConverter.FahrenheitToCelsius(-10);
        System.assertEquals(-23.33,celsius);
    }
      
}