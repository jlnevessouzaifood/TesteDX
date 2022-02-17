@isTest
public with sharing class formAulaIntegrationTest {
    @TestSetup
    public static void makeData(){
        
    }
    /*@isTest public static void formAulaIntegrationTest() {
        MultiStaticResourceCalloutMock multimock = new MultiStaticResourceCalloutMock();
        multimock.setStaticResource('endpoint', 'mockIntegracao1');
        multimock.setStaticResource('endpoint2', 'mockIntegracao2');
        multimock.setStatusCode(200);
        multimock.setHeader('Content-Type', 'application/json;charset=UTF-8');

        Test.setMock(HttpCalloutMock.class, multiMock);
        Test.startTest(); 
        formAulaIntegration.integration('12345678');
        Test.stopTest();
    }

    @isTest public static void formAulaIntegrationTestError() {
        MultiStaticResourceCalloutMock multimock = new MultiStaticResourceCalloutMock();
        multimock.setStaticResource('endpoint', 'mockIntegracao1');
        multimock.setStaticResource('endpoint2', 'mockIntegracao2');
        multimock.setStatusCode(201);
        multimock.setHeader('Content-Type', 'application/json;charset=UTF-8');

        Test.setMock(HttpCalloutMock.class, multiMock);
        Test.startTest(); 
        formAulaIntegration.integration('12345678');
        Test.stopTest();
    }*/

    @isTest public static void formAulaIntegrationTest() {
        

        Test.setMock(HttpCalloutMock.class, new formAulaMock());
        Test.startTest(); 
        formAulaIntegration.integration('12345678');
        Test.stopTest();
    }

    @isTest public static void formAulaIntegrationTest2() {
        

        Test.setMock(HttpCalloutMock.class, new formAulamock2());
        Test.startTest(); 
        formAulaIntegration.integration('12345678');
        Test.stopTest();
    }
}