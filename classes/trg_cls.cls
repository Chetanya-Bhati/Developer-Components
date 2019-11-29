public class trg_cls{

    public static void check_ops(list<opportunity> ops){
        Double total_amount = 0;
        for(opportunity o1: [select amount from opportunity where createdDate = today
                                                                and createdByid = :userinfo.getuserId()])
        total_amount += o1.Amount;                                                      
        
        for(opportunity o2: ops){
            total_amount += o2.Amount;
            if (total_Amount > 100000)
                o2.adderror('You have Exceeded daily limit of 100K');}
        
    }
}