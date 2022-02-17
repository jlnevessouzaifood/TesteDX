public with sharing class AulaChangeCPF {
    public static void AulaChangeCPF(List<Account> accList) {
        System.debug('ultima classe ' + accList);
        for(Account acc : accList) {
            acc.CPFn__c = '09642049910';
        }
        update accList;        
    }
}