Public class AccountsLast7Days{
    
    public static list<Account> getAccount(){
        //date d = system.today(); //.addDays(-7);
        List <Account> Act7Days = [SELECT Name, Industry, CreatedById, CreatedDate FROM Account WHERE Active__c = 'Yes' and CreatedDate = LAST_N_DAYS:7];
        system.debug(Act7Days);
        // where system.today - CreatedDate <= 7 and active = 'Yes'];
    return Act7Days;
    } 

}