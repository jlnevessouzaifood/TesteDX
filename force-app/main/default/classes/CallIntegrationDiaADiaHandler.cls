public with sharing class CallIntegrationDiaADiaHandler {
    public static void afterInsert(List<AtividadeInterno__c> atividadeList) {
        String name;
        String userName;
        String descricao;
        String nomeProjeto;
        String hora;
        String dataAtividade;
        Boolean horaExtra;
        for (AtividadeInterno__c ativ : atividadeList) {
            name = ativ.Name;
            userName = ativ.Username__c;
            descricao = ativ.Descricao__c;
            nomeProjeto = ativ.Projeto__c;
            hora = ativ.Hora__c;
            dataAtividade = ativ.Data__c;
            horaExtra = ativ.HoraExtra__c;
        }
    }
}