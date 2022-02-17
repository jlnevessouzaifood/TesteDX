public with sharing class aulaBatch implements Database.Batchable<sObject>, Database.AllowsCallouts, Schedulable{
   public void execute(SchedulableContext context) {
       Database.executeBatch(this, 1);
   }
   public Database.queryLocator start(Database.BatchableContext batchanleContext) {
       String xxx = 'SELECT CPFn__c, Salario__c FROM Account WHERE CPFn__c = \'09642049910\'';
       return Database.getQueryLocator(xxx);
   }
   public void execute(Database.BatchableContext batchanleContext, List<Account> acc) {
    AulaChangeCPF.AulaChangeCPF(acc);
   } 
   public void finish(Database.BatchableContext param1){
        System.debug(param1);
   }
}