Public Class AddContactsOnAccountDetailPage{
    Public  static Id AccountId;
    //Public  static Id ContactsAccountId;
    
    //AccountId = '0017F00000ZBHJR';
    
    public list<Contact> getCons(){
        List<Contact> Cons= [select FirstName, LastName, AccountId, phone  from Contact where Contact.AccountId = :AccountId];
    return Cons;
    }
    
    public Id getAccountId(){
    system.debug('Account Id --> ' + AccountId);
    Return AccountId; 
    }
    /* public Id getContactsAccountId(){
    system.debug('Contacts Account Id --> ' + ContactsAccountId);
    Return ContactsAccountId; 
    } */
    
    //public Id setAccountId(){
    //AccountId = (Id)ApexPages.currentPage().getParameters().get('id');
    //Return AccountId; 
    //}
    
    public AddContactsOnAccountDetailPage(ApexPages.StandardController controller) {
    AccountId = (Id)ApexPages.currentPage().getParameters().get('id');
    system.debug('Account Id --> ' + AccountId);
    }
    
    Public PageReference AddContact(){
        //AccountId = (Id)ApexPages.currentPage().getParameters().get('id');
        PageReference addContactPage = new PageReference('/Apex/addContactPage');     //Page.AddContactPage;
        addContactPage.getParameters().put('Accountid', Accountid); 
        addContactPage.setRedirect(true);
        
        system.debug('Contacts Account Id --> ' + AccountId);
        return Page.addContactPage;
    
    //AccountId = (Id)ApexPages.currentPage().getParameters().get('id');
    //    system.debug('Account Id --> ' + AccountId);
    //Return Page.AddContactPage;
    }
    /**
    Public PageReference SaveContact(){
    Insert 
    }
    **/  
}