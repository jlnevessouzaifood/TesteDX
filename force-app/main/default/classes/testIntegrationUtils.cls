public with sharing class testIntegrationUtils {
    public static void IntegrationSF () {
        String endpointToken = 'https://na123.salesforce.com/services/oauth2/token?grant_type=password&client_id=3MVG9JEx.BE6yifNR6lHQcRJWSG85EdmCpgMiXoC7DMq0lLEP4EyjJydUqdESDnw6xv.dRqG3S4Q5a11t1GhB&client_secret=034BA09F34EF523FBB40DD33C595FE9388FCDDCFF3A8B8881DEAAFD02E806749&username=userintegracao@fti.com&password=FTI12345geczLGRnKssbyUTxr9cSOFt8t';
        String bodyToken = '';        
        Integer timeout = 10000;
        HttpResponse token = Integration_Utils.IntegrationPost(endpointToken,bodyToken,timeout);
        deserealizeToken activity = (deserealizeToken)System.JSON.deserialize(token.getBody(), deserealizeToken.class);
        
        Http conexaoConsulta = new Http();
        HttpRequest requisicaoConsulta = new HttpRequest();
        requisicaoConsulta.setEndpoint('https://jlns-dev-ed.my.salesforce.com/services/apexrest/BuscaDiaADia');
        requisicaoConsulta.setMethod('POST');
        requisicaoConsulta.setHeader('Content-Type', 'application/json');
        requisicaoConsulta.setHeader('Authorization', 'Bearer ' + activity.access_token);
        requisicaoConsulta.setBody('{ "userName": "joao.souza@ftitecnologia.com.br"}');
       
        HttpResponse retornoConsulta = conexaoConsulta.send(requisicaoConsulta);
        System.debug('STATUS CODE CONSULTA >> ' + retornoConsulta.getStatusCode());
        System.debug(retornoConsulta.getBody());
    }
        public with sharing class deserealizeToken{
            public String access_token; 
        }

}