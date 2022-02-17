public with sharing class SerealizeJsonDiaADia {
    public with sharing class MeuJson {
        
        public List<TAtividades> atividades;
        
    }
    
    public with sharing class TAtividades {
        public String name;
        public String dataAtividade;
        public String hora;
        public String nomeProjeto;
        public String descricao;
        public String userName;
        public Boolean horaExtra;
    }
    
    public static String IntegrationContractJson(List<Atividade__c> ativList) {
       
        List<TAtividades> atividadesList = new List<TAtividades>();
        
        for(Atividade__c ativ : ativList) {
        TAtividades atividade = new TAtividades ();
            atividade.name=ativ.Name;
            atividade.dataAtividade=ativ.Data__c;
            atividade.hora=ativ.Hora__c;
            atividade.nomeProjeto=ativ.Projeto__c;
            atividade.descricao=ativ.Descricao__c;
            atividade.userName=ativ.Username__c;
            atividade.horaExtra=ativ.HoraExtra__c;
            atividadesList.add(atividade);
            System.debug(atividade);
        }       

        MeuJson json = new MeuJson();
        json.atividades=atividadesList;
        
       
       
        String jsonSerealized = System.JSON.serialize(json);
        System.debug(jsonSerealized);
        return jsonSerealized;
    }
}