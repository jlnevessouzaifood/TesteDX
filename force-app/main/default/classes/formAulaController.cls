public with sharing class formAulaController {
    public with sharing class ResponseObject {
        @AuraEnabled public String name;
        @AuraEnabled public Decimal salario;
    }
    @AuraEnabled    
    public static String saveForm(Account acc) {        
        insert acc;    
        return acc.Id;   
    }
    @AuraEnabled    
    public static List<Account> searchForm(String cpf) {        
        List<Account> accList = new List<Account>();
        accList = [SELECT Id, CPFn__c, DatadeInsercao__c, Email__c, CellPhone__c, Salario__c, Name
        FROM Account WHERE CPFn__c = :cpf ORDER BY Name ASC];  
        for(Account acc : accList) {
            System.debug(acc);
        }
        return accList;
    }
    @AuraEnabled    
    public static void updateForm() {                
           
        List<Account> accList = new List<Account>();
        accList = [SELECT Id, CPFn__c, DatadeInsercao__c, Email__c, CellPhone__c, Salario__c, Name
        FROM Account WHERE CPFn__c = '08553072932' ORDER BY Name ASC];  

        List<Account> accList2 = new List<Account> ();
        accList2 = [SELECT Id, CPFn__c, DatadeInsercao__c, Email__c, CellPhone__c, Salario__c, Name
        FROM Account WHERE Email__c = :'jlucasnevessouza@gmail.com'];  
        System.debug(accList2);  
        System.debug(accList);
        for(Account acc : accList) {
            for (Account acc2 : accList2) {
                if (acc.Name == acc2.Name) {
                    acc.Salario__c=acc2.Salario__c;
                    
                }
            }
        }
        
        update accList;
        System.debug(accList);        
    }
}