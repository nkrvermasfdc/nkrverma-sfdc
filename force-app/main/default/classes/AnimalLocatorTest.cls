@isTest 
private class AnimalLocatorTest {
    
    @isTest static  void testGetCallout(){
        
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        // Call method to test
        // This causes a fake response to be sent
    	// from the class that implements HttpCalloutMock.
        string result = AnimalLocator.getAnimalNameById(1);
        System.debug('Result : ' + result);
           	 
    	// Verify that the response received contains fake values
    	//String contentType = response.getHeader('Content-Type');
    	//System.assert(contentType == 'application/json');        
    	//String actualValue = response.getBody();
    	//System.debug(response.getBody());        
    	//String expectedValue = '{"animal":{"id":1,"name":"chicken","eats":"chicken food","says":"cluck cluck"}}';
        
    	//System.assertEquals(actualValue, expectedValue);
    	//System.assertEquals(200, response.getStatusCode()); 
    }
        

}