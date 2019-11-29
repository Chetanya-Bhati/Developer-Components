public class FilterOppListCls {
    string keyword = 'Search- Opportunity Name';
    List<Opportunity> results =[select name, StageName, CloseDate from Opportunity];
  
    public FilterOppListCls(ApexPages.StandardSetController controller){
        
    } 
    public list<Opportunity> getresults(){
    Return results;
    }
    public string getkeyword(){
    Return keyword;
    }
    public void setkeyword(string input){
    keyword = input;
    }
    /* public list<Opportunity> getOpps(){
        List<Opportunity> Opps= [select Name, StageName, CloseDate from Opportunity limit 10]; // where Substr(name) = 'Gen'];
    return Opps;
    } */
    public pagereference serach_now(){
    	If(keyword.length() == 0)
        	results =[select name, StageName, CloseDate from Opportunity];
        Else 
       		results = (List<Opportunity>) [Find :keyword IN All FIELDS returning Opportunity(Name, StageName, CloseDate)][0];
        return null;
    } 
    public PageReference save() {
        update results;
        return null;
    }

}