@RestResource(urlMapping='/EndpointAula')
global with sharing class WebhookIntegrationAula {

    @HttpPost
    global static String  ReceiveData() {

    RestRequest req = RestContext.request; 
    String json=req.requestBody.toString();
    String jsonReplace = json.replace('dados-pessoais', 'dados_pessoais');
    jsonReplace = jsonReplace.replace('dados-contato', 'dados_contato');
    jsonReplace = jsonReplace.replace('dados-financeiros', 'dados_financeiros');
    DeserealizeWebhookAula query = (DeserealizeWebhookAula)System.JSON.deserialize(jsonReplace, DeserealizeWebhookAula.class);
        System.debug(query);
        String returnMessage = 'Exito';
        if(query.dados.dados_pessoais.nome==null || query.dados.dados_pessoais.nome=='') {
            RestContext.response.statusCode = 400 ; 
            returnMessage = 'Enviar o campo nome corretamente';            
        }
        else {
            String cpf = query.dados.dados_pessoais.cpf;
        List<Account> accList = new List<Account>();
        accList = [SELECT Id, CPFn__c, DatadeInsercao__c, Email__c, CellPhone__c, Salario__c, Name
        FROM Account WHERE CPFn__c = :cpf];
        
        for (Account acc : accList) {
            acc.DatadeInsercao__c = Date.valueOf(query.dados.dados_pessoais.data);
            acc.Email__c = query.dados.dados_contato.email;
            acc.Salario__c =  query.dados.dados_financeiros.salario;
        }
        update accList;
        }
        
        return returnMessage;
    }
}