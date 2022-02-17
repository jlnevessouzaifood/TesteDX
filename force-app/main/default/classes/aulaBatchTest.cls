@isTest
public with sharing class aulaBatchTest {
    @isTest public static void aulaBatchTest() {
        Date today = Date.today();
        Date myDate =  today.addDays(31);
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

        String CRON_EXP = '2 0 0 * * ?';
        String jobId = System.schedule('ScheduledApexTest',
        CRON_EXP,
        new aulaBatch());
 
         Database.executeBatch(new aulaBatch(), 1);
    }
}