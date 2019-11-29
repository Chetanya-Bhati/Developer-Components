public class c12{

    string keyword1 = '';
    string keyword2 = '';
    string keyword3 = '';
    
    private integer totalRecs = 0;
    private integer OffsetSize = 0;
    private integer LimitSize= 4;
    Public Boolean search_no_flag = True;
    Public Boolean search_all_flag = False;
    Public Boolean search_name_flag = False;
    Public Boolean search_phone_flag = False;

    List<account> results =[select name, type, industry, phone, fax  from account]; 
    {totalRecs = results.size();}
    {results =[select name, type, industry, phone, fax  from account LIMIT :LimitSize OFFSET :OffsetSize]; 
    system.debug('REsults: ' + Results);
    System.debug('Offsetsize:' + Offsetsize + '| Limitsize' + Limitsize + '| totalrecs:' + totalrecs);}

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
    /*If (search_no_flag == true)
    {results =[select name, type, industry, phone, fax  from account LIMIT :LimitSize OFFSET :OffsetSize];}
    //totalRecs = results.size();}
    Else If (search_all_flag == true && keyword1.length() > 1)
    {results = (List<account>) [Find :keyword1 IN All FIELDS returning Account(Name, Type, Industry, Phone, Fax LIMIT :LimitSize OFFSET :OffsetSize)][0];}*/
    //totalRecs = results.size();}
    {system.debug('REsults in get results..: ' + Results);
    System.debug('Offsetsize:' + Offsetsize + '| Limitsize' + Limitsize + '| totalrecs:' + totalrecs);}

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
    system.debug('In beginning of search ALL');
    OffsetSize = 0;
    search_no_flag = false;
    search_all_flag = True;
    search_name_flag = False;
    search_phone_flag = False;
    if (keyword1.length() > 1){results = (List<account>) [Find :keyword1 IN All FIELDS returning Account(Name, Type, Industry, Phone, Fax)][0];
    totalRecs = results.size();
    system.debug('REsults: without limit search ..after 1st results .. in if' + Results);
    System.debug('Offsetsize:' + Offsetsize + '| Limitsize' + Limitsize + '| totalrecs:' + totalrecs);
    results = (List<account>) [Find :keyword1 IN All FIELDS returning Account(Name, Type, Industry, Phone, Fax LIMIT :LimitSize OFFSET :OffsetSize)][0];
    system.debug('REsults: with limit search.. after 2nd results..in if part ' + Results);
    System.debug('Offsetsize:' + Offsetsize + '| Limitsize' + Limitsize + '| totalrecs:' + totalrecs);}

    Else
    {results =[select name, type, industry, phone, fax  from account LIMIT :LimitSize OFFSET :OffsetSize];
    system.debug('In else part of search ALL');}
    //totalRecs = results.size();
    
    return null;
    } 
    
    public pagereference search_name(){
    if (keyword2.length() > 1) {results = (List<account>) [Find :keyword2 IN name FIELDS returning Account(Name, Type, Industry, Phone, Fax LIMIT :LimitSize OFFSET :OffsetSize)][0];}
    Else
    {results =[select name, type, industry, phone, fax  from account LIMIT :LimitSize OFFSET :OffsetSize];}
    totalRecs = results.size();
    search_no_flag = false;
    search_all_flag = False;
    search_name_flag = True;
    search_phone_flag = False;
    return null;
    } 
    public pagereference search_phone(){
    if (keyword3.length() > 3) {results = (List<account>) [Find :keyword3 IN phone FIELDS returning Account(Name, Type, Industry, Phone, Fax LIMIT :LimitSize OFFSET :OffsetSize)][0];}
    Else
    {results =[select name, type, industry, phone, fax  from account LIMIT :LimitSize OFFSET :OffsetSize];}
    totalRecs = results.size();
    search_all_flag = False;
    search_name_flag = False;
    search_phone_flag = True;
    
    return null;
    } 
    public void FirstPage(){
    OffsetSize = 0;
    /*If (search_all_flag == True){
    search_all();}
    Else If (search_name_flag == True){
    search_name();}
         Else If (search_phone_flag == True){
         search_phone();}*/
    }

    public void previous(){
    OffsetSize = (OffsetSize-LimitSize);
    /*If (search_all_flag == True){
    search_all();}
    Else If (search_name_flag == True){
    search_name();}
         Else If (search_phone_flag == True){
         search_phone();}*/
    }

    public pagereference next(){
    system.debug('In next..');
    OffsetSize = OffsetSize + LimitSize;
    
    If (search_no_flag == true)
    {results =[select name, type, industry, phone, fax  from account LIMIT :LimitSize OFFSET :OffsetSize];
    system.debug('REsults: in search NO if cond..' + Results);
    System.debug('Offsetsize:' + Offsetsize + '| Limitsize' + Limitsize + '| totalrecs:' + totalrecs);}
    if (keyword1.length() > 1 && search_all_flag == true){
    /*results = (List<account>) [Find :keyword1 IN All FIELDS returning Account(Name, Type, Industry, Phone, Fax)][0];
    totalRecs = results.size();*/
    
    results = (List<account>) [Find :keyword1 IN All FIELDS returning Account(Name, Type, Industry, Phone, Fax LIMIT :LimitSize OFFSET :OffsetSize)][0];
    system.debug('REsults: in serch all if cond ' + Results);
    System.debug('Offsetsize:' + Offsetsize + '| Limitsize' + Limitsize + '| totalrecs:' + totalrecs);}
    
    /*If ((OffsetSize + LimitSize) <= totalRecs)
    {OffsetSize = OffsetSize + LimitSize;}
    Else 
    {LimitSize = totalrecs - math.mod(totalRecs,LimitSize);}*/
    /*If (search_no_flag == True){
    List<account> results =[select name, type, industry, phone, fax  from account LIMIT :LimitSize OFFSET :OffsetSize];}
    Else If (search_all_flag == True){
    search_all();}
         Else If (search_name_flag == True){
         search_name();}
              Else If (search_phone_flag == True){
              search_phone();} */
    
    return null;
    }

    public void LastPage(){
    OffsetSize = totalrecs - math.mod(totalRecs,LimitSize);
    /*If (search_all_flag == True){
    search_all();}
    Else If (search_name_flag == True){
    search_name();}
         Else If (search_phone_flag == True){
         search_phone();}*/
    }

    public boolean getprev(){
    if(OffsetSize == 0){
    return true;}
    else {
    return false;
    }
    }

    public boolean getnxt(){
    if((OffsetSize + LimitSize) > totalRecs){
    return true;
    }
    else {
    return false;
    }
    }
}