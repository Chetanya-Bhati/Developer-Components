public class c2{
    list<account> acts = [select name, type, industry, phone, fax from account]; /* where type = 'Customer - Direct'];*/
    public list<account> getacts(){
    return acts;
    }
}