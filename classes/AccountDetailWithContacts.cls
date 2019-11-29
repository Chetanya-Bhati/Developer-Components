public class AccountDetailWithContacts {
    Public  static Id AccountId;
    //Public  static Id ContactsAccountId;
    //AccountId = '0017F00000ZBHJR';
    
    public Id getAccountId(){
    system.debug('Account Id --> ' + AccountId);
    Return AccountId; 
    }
    
    //public Id setAccountId(){
    //AccountId = (Id)ApexPages.currentPage().getParameters().get('id');
    //Return AccountId; 
    //}
    public AccountDetailWithContacts(ApexPages.StandardController controller) {
    AccountId = (Id)ApexPages.currentPage().getParameters().get('id');
    system.debug('Account Id --> ' + AccountId);
    }
    public list<Contact> getCons(){
        List<Contact> Cons= [select FirstName, LastName, AccountId, phone  from Contact where Contact.AccountId = :AccountId];
    return Cons;
    }
    Public PageReference AddContact(){
        //ContactsAccountId = (Id)ApexPages.currentPage().getParameters().get('id');
        PageReference addContactPage = new PageReference('/Apex/addContactPage?AccountId='+Account.Id);     //Page.AddContactPage;
        addContactPage.getParameters().put('Accountid', Accountid); 
        addContactPage.setRedirect(true);
        system.debug('Contacts Account Id --> ' + AccountId);
        return addContactPage;
    }
}