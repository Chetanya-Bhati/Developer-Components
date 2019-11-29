public class c7{

    
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
    
    /*public list<account> getacts(){
    results = [select name, type, industry, phone, fax  from account];
    return results;
    }*/

    public PageReference save() {
        update results;
        return null;
    }

    public pagereference serach_now(){
    results = (List<account>) [Find :keyword IN All FIELDS returning Account(Name, Type, Industry, Phone, Fax)][0];
    return null;
    } 
    
    
}