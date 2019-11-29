@isTest
Public class TestDataClassContact{
    Public static void TestDataContact() {
        List<Contact> Cons = New List<Contact>();
        For (integer i=0; i<10; i++){
        Contact Con = New Contact(LastName = 'Bhati'+i, FirstName = 'Chetanya'+i, Phone = '1234567'+i);
        Cons.add(Con);
        }  
     }    
}