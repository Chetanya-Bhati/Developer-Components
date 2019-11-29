public class c9{

    string keyword1 = 'Search >1 char';
    string keyword2 = 'Search >1 char';
    string keyword3 = 'Search last 4 Digit';

    List<account> results =[select name, type, industry, phone, fax  from account];
  
    public string getkeyword1(){
    Return keyword1;
    }
    public string getkeyword2(){
    Return keyword2;
    }
    public string getkeyword3(){
    Return keyword3;
    }

    public list<account> getresults(){
    Return results;
    }
    
    public void setkeyword1(string input1){
    keyword1 = input1;
    }
    public void setkeyword2(string input2){
    keyword2 = input2;
    }
    public void setkeyword3(string input3){
    keyword3 = input3;
    }
     
    public PageReference save() {
        update results;
        return null;
    }

    public pagereference search_all(){
    if (keyword1.length() > 1) {results = (List<account>) [Find :keyword1 IN All FIELDS returning Account(Name, Type, Industry, Phone, Fax)][0];}
    Else
    {results =[select name, type, industry, phone, fax  from account];}
    return null;
    } 
    
    public pagereference search_name(){
    if (keyword2.length() > 1) {results = (List<account>) [Find :keyword2 IN name FIELDS returning Account(Name, Type, Industry, Phone, Fax)][0];}
    Else
    {results =[select name, type, industry, phone, fax  from account];}
    return null;
    } 
    public pagereference search_phone(){
    if (keyword3.length() > 3) {results = (List<account>) [Find :keyword3 IN phone FIELDS returning Account(Name, Type, Industry, Phone, Fax)][0];}
    Else
    {results =[select name, type, industry, phone, fax  from account];}
    return null;
    } 
    
}