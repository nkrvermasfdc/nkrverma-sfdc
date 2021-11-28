Public class currencyConvertToInr
{
    Public String  tCurrency {get;set;}
    Public Decimal conversionRates{get;set;}
    Public Decimal inr{get;set;}
    
    public decimal getrates()
    {   
        return conversionRates ;
    }
    
    public currencyConvertToInr(ApexPages.StandardController stdcontroller) 
    {   
        //===== Setting apikey and EndPoint Variable and Generating Http reuest to make call out =====;
        Account account =(Account)stdcontroller.getrecord();
        System.debug('*** account *** --> ' + account );
        account         =[Select Id, Currency__c from Account where Id=:account.id];        
        System.debug('*** account *** --> ' + account );        
        
        String tCurrency       = account.Currency__c ;
        String apikey          = 'fe83ecff16c90904b52f6c1755582853';
        String requestEndPoint = 'https://api.exchangeratesapi.io/latest';
        
        Http http           = new http();
        HttpRequest request = New HttpRequest();        
        request.setEndPoint(requestEndPoint);
        request.setMethod('GET');        
        HttpResponse response = http.send(request);        
        
        //===== Code as per Statuscode =====;
        if(response.getStatusCode()==200)
        {
            Map<String, Object> jsonBody = (Map<String, Object>)json.deserializeUntyped(response.getbody());
            System.debug('jsonBody --> ' + jsonBody);            
            Map<String, Object> mMap = (Map<String, Object>) jsonBody.get('rates');
            conversionRates = (Decimal) mMap.get(tCurrency);
            //tCurrency = 'Paarth'; //String.valueOf(tCurrency);   
            System.debug('tCurrency Test *** --> ' + tCurrency ); 
        }
        else
        {
            Apexpages.message myMsg = new ApexPages.Message(ApexPages.Severity.Error, '-- There Was an error in reading data --');
            ApexPages.addMessage(myMsg);
        }   
        
    }
 
}


 /*
            public String  city{get;set;}
            public String  temp{get;set;}
            public String  pressure{get;set;}
            public String  humidity{get;set;}
            public String  temp_min{get;set;}
            public String  temp_max{get;set;} 
    
             * //Map<String, Object> result = (Map<String, Object>)JSON.deserializeUntyped(response.getbody());
            //city = String.valueOf(result.get('name'));            
            
            Map<String, Object> mainresult = (Map<String, Object>)(result.get('main'));
            temp     = String.valueOf(mainresult.get('temp'));
            pressure = String.valueOf(mainresult.get('pressure'));
            humidity = String.valueOf(mainresult.get('humidity'));
            temp_min = String.valueOf(mainresult.get('temp_min'));
            temp_max = String.valueOf(mainresult.get('temp_max'));
*/