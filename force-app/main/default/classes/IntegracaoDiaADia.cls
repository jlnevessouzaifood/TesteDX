@RestResource(urlMapping='/IntegracaoDiaADia')
global with sharing class IntegracaoDiaADia {
 
    @HttpPost
    global static String receiveData() {        
        Boolean Okrequest = false;
        RestRequest req = RestContext.request;               
        String json=req.requestBody.toString();
        DeserealizeJsonDiaaDia activity = (DeserealizeJsonDiaaDia)System.JSON.deserialize(json, DeserealizeJsonDiaaDia.class);
        String returnMessage;
        if (activity.atividade.name==null || activity.atividade.name=='') {
            RestContext.response.statusCode = 400 ; 
            returnMessage = 'Erro, Enviar o campo nome corretamente';  
            Okrequest = true;   
        }
        if (activity.atividade.dataAtividade==null || activity.atividade.dataAtividade=='') {
            RestContext.response.statusCode = 400 ;
            returnMessage = 'Erro, Enviar o campo data corretamente';  
            Okrequest = true;  
        }
        if (activity.atividade.descricao==null || activity.atividade.descricao=='') {
            RestContext.response.statusCode = 400 ;
            returnMessage = 'Erro, Enviar o campo descrição corretamente';   
            Okrequest = true; 
        }
        if (activity.atividade.hora==null || activity.atividade.hora=='') {
            RestContext.response.statusCode = 400 ;
            returnMessage = 'Erro, Enviar o campo tempo corretamente';   
            Okrequest = true; 
        }
        if (activity.atividade.horaExtra==null) {
            RestContext.response.statusCode = 400 ;
            returnMessage = 'Erro, Enviar o campo hora extra corretamente'; 
            Okrequest = true;   
        }
        if (activity.atividade.nomeProjeto==null || activity.atividade.nomeProjeto=='') {
            RestContext.response.statusCode = 400 ;
            returnMessage = 'Erro, Enviar o campo projeto corretamente';    
            Okrequest = true;
        }
        if (activity.atividade.userName==null || activity.atividade.userName=='') {
            RestContext.response.statusCode = 400 ;
            returnMessage = 'Erro, Enviar o campo username corretamente';  
            Okrequest = true;  
        }
        
        if (Okrequest ==false) {
        Atividade__c ativ = new Atividade__c();
        ativ.Name=activity.atividade.name;
        ativ.Jsonrecebido__c=json;
        ativ.Data__c=activity.atividade.dataAtividade;
        ativ.Descricao__c=activity.atividade.descricao;
        ativ.Hora__c=activity.atividade.hora;
        ativ.HoraExtra__c=activity.atividade.horaExtra;
        ativ.Projeto__c=activity.atividade.nomeProjeto;
        ativ.Username__c=activity.atividade.userName;
        insert ativ;
        }
        return returnMessage;
       
    }
    
   
}