@RestResource(urlMapping='/BuscaDiaADia')
global with sharing class BuscaDiaADia {
 
    @HttpGet
    global static void receiveData() {
        
        
        RestRequest req = RestContext.request;  
        Map<String, String> json = req.params;
        System.debug(json);           

        List<String> teste=json.values();
        System.debug(teste);
        

        List<Atividade__c> ativList = [SELECT Name, Data__c, Projeto__c, Hora__c, Descricao__c, Username__c,  HoraExtra__c  
        FROM Atividade__c WHERE Username__c IN: teste];
             
        
        HttpResponse response = new HttpResponse();
        String jsonReturn = SerealizeJsonDiaADia.IntegrationContractJson(ativList);
        RestContext.response.addHeader('Content-Type', 'application/json');
        RestContext.response.responseBody = Blob.valueOf(jsonReturn);        
    }
   
}