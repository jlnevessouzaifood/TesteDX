public with sharing class formAulaIntegration {
    public static void integration(String cep) {
        String bpdy = formAulaSerealize.Serealize(10, 'nome', '2021-04-03');
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('endpoint');
        request.setMethod('POST');
        request.setHeader('Content-type', 'aplication');
        request.setBody(bpdy);
       // request.setBody({"usuario": "atendimento_lapa@teste.com","senha": "mmQHeeiKZW"});
        request.setTimeout(10000);

        Http http2 = new Http();
        HttpRequest request2 = new HttpRequest();
        request2.setEndpoint('endpoint2');
        request2.setMethod('GET');
        request2.setHeader('Content-type', 'aplication');        
        request2.setTimeout(10000);
        HttpResponse response2 = http2.send(request2);
        if(response2.getStatusCode()==200) {
            System.debug(response2);
        }
        

        LogIntegracao__c log = new LogIntegracao__c();
        log.PayloadOut__c = request.getBody();
        HttpResponse response = http.send(request);


        String json = response.getBody().replace('campo-1', 'campo_1');
        // .replaceAll('-','_';)
        formAulaDeserealize jsonFormat =(formAulaDeserealize)System.JSON.deserialize(json, formAulaDeserealize.class);
        System.debug(jsonFormat.campo3.subcampo1);
        System.debug(response.getBody());
        System.debug(response.getStatusCode());
        log.PayloadIn__c = response.getStatusCode() + response.getStatus() + response.getBody();
        if (response.getStatusCode() != 200) {
            log.Erro__c = true;
        }
        insert log;

        
    }

}