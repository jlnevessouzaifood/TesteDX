public with sharing class AccountCPFController {
    @AuraEnabled
    public static String saveAcc(Account respostas){
    System.debug(respostas);
    insert respostas;    
    return respostas.Id;
    }

    @AuraEnabled
    public static String updateAcc(List<String> listUpdate, String recordId){
    List<Account> acc = [SELECT Localidade__c, Logradouro__c, Estado__c, Cep__c, Numero__c, Bairro__c FROM Account WHERE Id=:recordId];
    List<Account> accounts = new List<Account>();
    for (Account conta : acc) {        
            conta.Logradouro__c=listUpdate[0];
            conta.Numero__c=listUpdate[1];
            conta.Localidade__c=listUpdate[2];
            conta.Estado__c=listUpdate[3];
            conta.Cep__c=listUpdate[4];
            conta.Bairro__c=listUpdate[5];
            accounts.add(conta);
    }
    update accounts;
    
    return 'oi';
    }
    @AuraEnabled
    public static List<Account> selectAcc(){
    Date today = Date.today();
    List<Account> acc = [SELECT Localidade__c, Logradouro__c, Cep__c, Numero__c, BirthDate__c, CPFn__c, LastName__c, Name FROM Account WHERE CreatedDate = TODAY];
    
    return acc;
    }

   
}