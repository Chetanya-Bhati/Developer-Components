trigger contact_t1 on Contact (before insert, before update) {
    /* for (Contact c : Trigger.new){
        if (c.email == null)
        c.adderror('Plz enter email field');*/
       for (Contact c : Trigger.new)
        if (trigger.Isinsert && c.email == null)
        c.adderror('You can not add contact without email field'); 
        Else 
        if (trigger.Isupdate && c.email == null)
        c.adderror('You can not update contact without email field');
}