public class SendAccountUsingRESTAPI 
{

    private final String clientId     = '3MVG9YDQS5WtC11qhoW21SuDGjepEoIG.fU5t9By_gdOZ3n9nVEHmkAok6ft29eCA5ec92D_XmH_jRbMVVrV5';
    private final String clientSecret = '1143981193361163271';
    private final String username     = 'nkrverma.sforce@gmail.com';
    private final String password     = 'nkv23@sfdc';
    
    public class deserializeResponse
    {
      public String id;
      public String access_token;
    }
    
    public String ReturnAccessToken (SendAccountUsingRESTAPI acount)
    {
      String reqbody = 'grant_type=password&client_id='+clientId+'&client_secret='+clientSecret+'&username='+username+'&password='+password;
      Http h = new Http();
      HttpRequest req = new HttpRequest();
      req.setBody(reqbody);
      req.setMethod('POST');
      req.setEndpoint('https://ap4.salesforce.com/auth/add_oauth_token');
      HttpResponse res = h.send(req);
      deserializeResponse resp1 = (deserializeResponse)JSON.deserialize(res.getbody(),deserializeResponse.class);
      return resp1.access_token;
    }

    @future(callout=true)
    public static void callcreateAcc (String accName, String accId)
    {
      SendAccountUsingRESTAPI acount1 = new SendAccountUsingRESTAPI();
      String accessToken;
      accessToken = acount1.ReturnAccessToken (acount1);
      
      if(accessToken != null)
      {
        String endPoint = 'https://ap4.salesforce.com/services/data/v41.0/sobjects/Account/';
        String jsonstr = '{"Name" : "' + accName + '"}';
        
        Http h2 = new Http();
        HttpRequest req1 = new HttpRequest();
        
        req1.setHeader('Authorization','Bearer ' + accessToken);
        req1.setHeader('Content-Type','application/json');
        req1.setHeader('accept','application/json');
        
        req1.setBody(jsonstr);
        req1.setMethod('POST');
        req1.setEndpoint(endPoint);
        
        HttpResponse res1 = h2.send(req1);
  
        deserializeResponse resp2 = (deserializeResponse)JSON.deserialize(res1.getbody(),deserializeResponse.class);

        Account a = [SELECT Id FROM Account WHERE Id = :accId];
        a.SFORCE_ID__c = resp2.id;

        update a;
      }
      else
      {
       //Alert 'Error :-- Error';
      }
   }

}