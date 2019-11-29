@isTest
Private class TestClassContact{
        
    static testmethod void InsertTestContact() {
        //TestDataClassContact.TestDataContact();
        List<Contact> Cons = New List<Contact>();
        For (integer i=0; i<10; i++){
        Contact Con = New Contact(LastName = 'Bhati'+i, FirstName = 'Chetanya'+i, Phone = '1234567'+i);
        Cons.add(Con);
        }
        System.debug('Before Contact Insert...');
        Test.Starttest();
        insert Cons;
        Test.StopTest();
        
        List<Contact> Inserted_Cons = [Select LastName, FirstName, Phone from Contact where id in:Cons];

        System.debug('Before System Assert Equals...');
        for(integer i=0; i<10; i++){
            for(Contact i_c: Inserted_Cons){
                if (Cons.get(i).LastName == i_c.LastName){
                System.assertEquals(Cons.get(i).LastName, i_c.LastName);
                System.debug('Cons.lastname = '+Cons.get(i).lastname+ 'Inserted_Cons.lastname = '+i_c.lastname); 
                }
            }
        }
     }
}