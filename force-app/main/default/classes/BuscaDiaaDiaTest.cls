@isTest
public with sharing class BuscaDiaaDiaTest {
    @isTest public static void BuscaDiaaDiaTest() {
        RestRequest req = new RestRequest();
        req.requestUri = 'https://jlns-dev-ed.my.salesforce.com/services/apexrest/BuscaDiaADia';
        req.httpMethod = 'POST';
        req.requestBody=Blob.valueOf('{"userName": "joao@test.com"}');

        RestContext.request = req;
        Atividade__c ativ = new Atividade__c(
            Name='Joao', Data__c='2021-04-05', Projeto__c='teste', Hora__c='teste', Descricao__c='teste', HoraExtra__c =true, Username__c='joao@test.com'
        );
        insert ativ;

        BuscaDiaADia.receiveData();
    }
}