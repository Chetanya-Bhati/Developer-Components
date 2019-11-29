//batch apex 
global with sharing class ExtractContChrgIncmData implements Database.Batchable<sObject>,Database.Stateful
{
    //query string
    global static String query;
    global boolean isSuccess = true;
    global datetime BatchstartTime = system.now();  
    //Start method for fetching records.
    global Database.QueryLocator start(Database.BatchableContext BC){
        query = ConstructQuery() ;//+ ' LIMIT 5';        
        system.debug('###query in Start method-->'+query);
        return Database.getQueryLocator(query);
        
    }
    //query method
    public static string ConstructQuery(){
        // returning constructed Dynamic Query on Contract Object
        Query= 'Select Name, Contract_Date__c, Fees_Amount__c, Income_Accrual__c, Status__c, ' + 
               ' (Select Name, Fee_Amount__c, Fee_Due__c, Lease_Account__c, Status__c from Charges__r), ' + 
               ' (Select Name, Accrued__c, Contract__c, Date__c, Income__c from Income_Streams__r) ' + 
               ' From LS_Contract__c ';
        return Query;
    }
    //Execute method 
    global void execute(Database.BatchableContext BC, List<sObject> scope){
        //isSuccess = true;
        List<LS_Contract__c> contracts = (List<LS_Contract__c>)scope;
        list<Contracts_Report__c> ReportsToInsert = new list<Contracts_Report__c>();
        Savepoint sp = database.setsavepoint();        
        try {
            system.debug('contracts-->'+contracts);
            if(!scope.isEmpty()){
                //Contracts Report
                list<Contracts_Report__c> ContractsReport = CreateReport(contracts);
            }
            /*
            if(!ReportsToInsert.isEmpty()){
                Insert ReportsToInsert;
                system.debug('ReportsToInsert---> '+ ReportsToInsert.size());
            }
            */
        }
        Catch(exception eX){
            database.rollback(sp);
            if(!eX.getMessage().contains('Party number')){
                isSuccess = false;
            }
            System.debug(LoggingLevel.ERROR, 'Exception in execute method : '+ex.getMessage());
            System.debug(LoggingLevel.ERROR, 'Exception in linenumber : '+ex.getLineNumber());
                       
        }
    }
     /*------------------------------------- Contract Report creation starts -----------------------------------------------*/
    //@METHOD: To Create Contracts_Report__c object
    Public static list<Contracts_Report__c> CreateReport(list<LS_Contract__c> ContractsList){
        list<Contracts_Report__c> ReportsToInsert = new list<Contracts_Report__c>();
        for(LS_Contract__c lsc : ContractsList){
            ReportsToInsert.add( new Contracts_Report__c(
                Contract_Id__c = lsc.name
            )); 
        }
        System.Debug('ReportsToInsert--->' + ReportsToInsert);

        if(!ReportsToInsert.isEmpty()){
            //Insert RecordsToInsert;
            Database.insert(ReportsToInsert, false);
            System.Debug('Record saved to database');
        }
        
        return ReportsToInsert;
    }
    //@@SUBMETHOD: constructing a new Report object list
    /*Private static list<Contracts_Report__c> CreateNewReports(list<Contracts_Report__c> CRList){
        list<Contracts_Report__c> TempReportsList = new list<Contracts_Report__c>();
        
        for (Contracts_Report__c cr : TempReportsList){
            TempReportsList.add( new Contracts_Report__c(
                Contract_Id__c = cr.name
            ); 
            System.Debug('Report cr.name' + cr.name);
  
        }
        return TempReportsList;
    }   
    */ 
    /*------------------------------------- Contracts Report creation ends-----------------------------------------------*/
    //Finish method
    global void finish(Database.BatchableContext BC){
    }
}