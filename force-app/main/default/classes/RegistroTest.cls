@isTest
public with sharing class RegistroTest {
    @isTest
    public static void RegistroTest() {
        Date data = Date.today();
        data = data.addYears(-19);
        Account acc = new Account();
       	acc.name='myAccount'; 
        acc.lastName__c='test';
        acc.BirthDate__c=data; 
        acc.Phone='4330662018'; 
        acc.CellPhone__c='43996108148';
        
        ContactAndLeadSearch.insertTeste(acc);
        System.assertEquals(acc.name,'myAccount');
        System.assertEquals(acc.lastName__c,'test');
        System.assertEquals(acc.BirthDate__c,data);        
        System.assertEquals(acc.Phone,'4330662018');
        System.assertEquals(acc.CellPhone__c,'43996108148');
    }
}