public class sessionidclass {
    
    public static string session { get;set; }
    public static list<string> resp { get;set; }
    
    public sessionidclass(){
        //getsession();
    }
    public static void getsession(){
        partnerSoapSforceCom.LoginResult res = new  partnerSoapSforceCom.LoginResult();
        partnerSoapSforceCom.Soap Stub = new  partnerSoapSforceCom.Soap();
        
        res = Stub.login('nkrverma.sforce.kmr.developer@gmail.com','nkv23@sfdcjS9rc9G9daghL024LsZ5ABHI');
        system.debug('res sessionId==>' + res.sessionId);
        session =  res.sessionId;  
        
        /*
        soapSforceComSchemasClassInboundstu.SessionHeader_element st = new soapSforceComSchemasClassInboundstu.SessionHeader_element();
        st.sessionId = res.sessionId;
        
        soapSforceComSchemasClassInboundstu.InboundStudentSearchService orgin = new soapSforceComSchemasClassInboundstu.InboundStudentSearchService();
        orgin.SessionHeader = st;
        
        orgin.timeout_x = 1000;
        system.debug('orgin.SessionHeader==>' + orgin.SessionHeader);
        resp = orgin.StudentSearchKeyMethod('USA');
        */
        
    }
    
}