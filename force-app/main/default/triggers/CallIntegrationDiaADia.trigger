trigger CallIntegrationDiaADia on AtividadeInterno__c (after insert) {
    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
          // CallIntegrationDiaADiaHandler.afterInsert(Trigger.New);
        }
    }

}