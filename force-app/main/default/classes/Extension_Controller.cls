Public class Extension_Controller{

    Public Extension_Controller(ApexPages.StandardController Constructor){}
    
    String hello = '--- ! How are you ?';
    String Label = 'Ann Revenue Controller';
    
    public String gethello(){
    return hello;
    }
    
    public String getLabel(){
    return Label;
    }
    
    
    List<Campaign> camps = [Select Name, StartDate, EndDate from Campaign];
    
    public List<Campaign> getcamps(){
    return camps;
    }
    
}