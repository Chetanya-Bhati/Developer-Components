public class c8{

    string keyword;
    List<account> results =[select name, type, industry, phone, fax  from account];
  
    public string getkeyword(){
    Return keyword;
    }

    public list<account> getresults(){
    Return results;
    }
    
    public void setkeyword(string input){
    keyword = input;
    }
    
    public PageReference save() {
        update results;
        return null;
    }

    public pagereference serach_all(){
    results = (List<account>) [Find :keyword IN All FIELDS returning Account(Name, Type, Industry, Phone, Fax)][0];
    return null;
    } 
    
    public pagereference serach_name(){
    results = (List<account>) [Find :keyword IN name FIELDS returning Account(Name, Type, Industry, Phone, Fax)][0];
    return null;
    } 
    public pagereference serach_phone(){
    results = (List<account>) [Find :keyword IN phone FIELDS returning Account(Name, Type, Industry, Phone, Fax)][0];
    return null;
    } 
    
}