public with sharing class TestOpenWeathermap 
{
    public String city{get;set;}
    public String temp{get;set;}
    public String pressure{get;set;}
    public String humidity{get;set;}
    public String temp_min{get;set;}
    public String temp_max{get;set;}        
    
    
    public TestOpenWeathermap(ApexPages.StandardController stdcontroller) 
    {
        //===== Fetching records using Constructor argument Standard Controller =====;
        Account account =(Account)stdcontroller.getrecord();
        System.debug('*** account *** --> ' + account );
        account         =[Select Id, ShippingCity from Account where Id=:account.id];
        //account         =[Select Id, ShippingCity from Account where Id='0017F00000KcdU9'];
        System.debug('*** account *** --> ' + account );
        
        //===== Setting apikey =====;
        String accountCity     = account.ShippingCity;
        //String apikey        = '8176d1528efda2a8c1c7973c447e9c52';
        String apikey          = 'fe83ecff16c90904b52f6c1755582853';
        
        //===== Setting EndPoint Variable =====;
        String requestEndPoint = 'http://api.openweathermap.org/data/2.5/weather';
        requestEndPoint       += '?q='+accountCity;
        requestEndPoint       += '&units=metric';
        requestEndPoint       += '&APPID='+apikey;        
        System.debug('requestEndPoint--> ' + requestEndPoint);
        
        //===== Generating Http reuest and making call out =====;
        Http http           = new http();
        HttpRequest request = New HttpRequest();        
        request.setEndPoint(requestEndPoint);
        request.setMethod('GET');        
        HttpResponse response = http.send(request);        
        System.debug('getStatusCode --> ' + response.getStatusCode());
        
        //===== Code as per Statuscode =====;
        if(response.getStatusCode()==200)
        {
            Map<String, Object> result = (Map<String, Object>)JSON.deserializeUntyped(response.getbody());
            city = String.valueOf(result.get('name'));            
            
            Map<String, Object> mainresult = (Map<String, Object>)(result.get('main'));
            temp     = String.valueOf(mainresult.get('temp'));
            pressure = String.valueOf(mainresult.get('pressure'));
            humidity = String.valueOf(mainresult.get('humidity'));
            temp_min = String.valueOf(mainresult.get('temp_min'));
            temp_max = String.valueOf(mainresult.get('temp_max'));
        }
        else
        {
            Apexpages.message myMsg = new ApexPages.Message(ApexPages.Severity.Error, 'There Was an error in reading data');
            ApexPages.addMessage(myMsg);
        }   
        
        
    }

}