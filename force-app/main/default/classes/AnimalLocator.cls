Public class AnimalLocator {
    
    public static string getAnimalNameById(Integer Id){
        
        http h = new http();        
        httpRequest request = new httpRequest();        
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + id);        
        request.setMethod('GET');        
        httpresponse response = h.send(request);
        
        string resp;
        
        if(response.getStatusCode() == 200){            

            Map<string,Object> results = (Map<string,Object>)Json.deserializeUntyped(response.getBody());
            system.debug('======================' + results);
            
            Map<string,Object> animals = (Map<string,Object>)results.get('animal');
            system.debug('======================' + animals);
            
            resp = string.valueOf(animals.get('name'));
            system.debug('=======response===========' + resp);
        }
        
        return resp;
       
    }
    
}