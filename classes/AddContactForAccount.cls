public class AddContactForAccount {
    public AddContactForAccount(ApexPages.StandardController controller) {
    //public AddContactForAccount() {

        //Contact c = (Contact) controller.edit();  //getRecord();   //edit();
        Contact c = New Contact();
        c.AccountId = ApexPages.currentPage().getParameters().get('AccountId');
        System.Debug('Value of Account ID in AddContactForAccount Controller is --> ' + c.AccountId);
    }
}