public class c4{

    List<account> acts= [select name, type, industry, phone, fax  from account];
    
    public list<account> getacts(){
        return acts;
    }
}