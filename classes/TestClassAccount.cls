@isTest
Private class TestClassAccount{
    //List<Account> Acts = New List<Account>();
    static testmethod void InsertTestAccount() {
        Account TestAct = New Account(Name = 'CKBTest1', Industry = 'Education', Website = 'www.ckb.com');
        //Account Act = New Account();
        System.debug('Before Insert...');
        insert TestAct;
        Account Act = [Select Name, Industry, Description from Account where id = :TestAct.id];
        System.debug('Before System Assert Equals...');
        System.assertEquals(TestAct.name, Act.name);
        System.assertEquals('This is Education Account', Act.Description); 
        System.debug('TestAct.name ----> '+TestAct.name+ 'Act.name ----> '+Act.Name); 
        System.debug('Act.Description = '+Act.Description); 
    }
}