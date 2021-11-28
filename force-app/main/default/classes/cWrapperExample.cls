public class cWrapperExample 
{

    public List<wrapperAccountCheckBox> LstWrp{get;set;}            //Variable declaration
    public List<wrapperAccountCheckBox> LstWrp_Selected{get;set;}   //Variable declaration
    
    public cWrapperExample() //Constructor 1
    {
        LstWrp=new List<wrapperAccountCheckBox>();                  //Defining Variable allocating memory
        LstWrp_Selected=new lIst<wrapperAccountCheckBox>();         //Defining Variable allocating memory
        List<Account> accLst=new List<Account>([SELECT Id,Name,AccountNumber,Active__c,CustomerPriority__c,Email__c  FROM Account]);
        
        for(integer i=0; i<accLst.size(); i++)
        {
            boolean check=true;
            
            if(accLst[i].CustomerPriority__c==null)
            {
                check=false;
            }
        
            LstWrp.add(new wrapperAccountCheckBox(check, String.ValueOf((i+1)),accLst[i]));
        }
        
    }
    
    public Pagereference RedirectSelectedAcc() //Pagereference method definition
    {
        LstWrp_Selected=new List<wrapperAccountCheckBox>(); //Defining Variable allocating memory
        
        for(wrapperAccountCheckBox wrp:LstWrp)
        {
            if(wrp.checkbox==true)
            {
                LstWrp_Selected.add(wrp);
            }
        }
        
        PageReference p=Page.WrapperExample_View;        
        return p;
    }
        

//------------------------------------------------------------------ Wrapper Class --------
    public class wrapperAccountCheckBox
    {
        public boolean checkbox{get;set;}
        public string SLNo{get;set;}
        public Account acc{get;set;}
    
        public wrapperAccountCheckBox() //Wrapper Constructor 1 -- with no argumenmt
        {
        }
    
        public wrapperAccountCheckBox(String s,Account a) //Wrapper Constructor 2 -- with 2 arguments
        {
            checkbox  = false;
            this.SLNo = s;
            this.acc  = a;
            
        }
    
        public wrapperAccountCheckBox(boolean c,String s,Account a) //Wrapper Constructor 3 -- with 3 arguments
        {
            this.checkbox=c;
            this.SLNo=s;
            this.acc=a;
        }
        
     }     
//------------------------------------------------------------------------------------------        
    
}