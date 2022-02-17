@isTest
public with sharing class formAulaControllerTest {
    //private static Test_Utils testUtils = Test_Utils.getInstance();

    @TestSetup
    public static void setupTest(){
        Date today = Date.today();
        Date myDate =  today.addDays(31);
       /* Account newAccount = testUtils.createNewAccount(new Account(
            CNPJ__c='36962097000160',    
            Name='Teset'       
            
        ));
        insert newAccount;*/
        Opportunity newOpp = new Opportunity(
            Name = 'Edge SLA',
            StageName = 'Aprovação',             
            CloseDate = myDate
        );
        insert newOpp;
        Account newAccount = new Account(
            Name='Joao',
            CPFn__c ='08553072932',
            Salario__c=9000,
            Email__c='joao@teste.com'
        );
        insert newAccount;
        Account newAccount2 = new Account(
            Name='Joao',
            CPFn__c ='09642049910',
            Salario__c=4100,
            Email__c='jlucasnevessouza@gmail.com'
        );
        insert newAccount2;
        
        
    }
    @isTest public static void saveFormTest() {
        Account newAcc = new Account(
            Name='Joao',
            CPFn__c ='09642049910'
        );     
        String id = formAulaController.saveForm(newAcc);
        Account acc = [SELECT CPFn__c FROM Account WHERE Id = :id];
        System.assertEquals('09642049910', acc.CPFn__c);
    }
    @isTest public static void searchFormTest() {
        Account acc = [SELECT CPFn__c FROM Account WHERE CPFn__c = '08553072932'];
        List<Account> accList = formAulaController.searchForm(acc.CPFn__c);
        
        System.assertEquals('joao@teste.com', accList[0].Email__c);
    }
    @isTest public static void updateFormTest() {        
        Account acc = [SELECT Salario__c, CPFn__c FROM Account WHERE CPFn__c ='09642049910'];
        
        formAulaController.updateForm();
        Account acc2 = [SELECT Salario__c, CPFn__c FROM Account WHERE CPFn__c = '08553072932'];
        System.assertEquals(acc.Salario__c, acc2.Salario__c);
    }

}