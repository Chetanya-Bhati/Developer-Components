Public class AccountsLast8To180Days{
   
    public static list<Account> getAccount(){
        date d = system.today().addDays(-8);
        List <Account> Act8To180Days = [SELECT Name, Industry, CreatedById, CreatedDate, Active__c FROM Account WHERE Active__c = 'Yes' and 
                                        CreatedDate < :d and CreatedDate >= LAST_N_DAYS:180];
        system.debug(Act8To180Days);                               
    return Act8To180Days;
   
    } 
}