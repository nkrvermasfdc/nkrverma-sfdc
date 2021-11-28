public class Search_Interface{

    String keyword;
    List<account> acts;
    
    public void setkeyword(String s){
    keyword = s;
    }
    
    public string getkeyword(){
    return keyword;
    }
    
    public List<account> getacts(){
    return acts;
    }
    
    public PageReference search(){
    acts = (List<Account>)[Find :keyword RETURNING Account(Name, Type, Industry, Phone, Fax)][0];
    return null;
    }
    
    
}