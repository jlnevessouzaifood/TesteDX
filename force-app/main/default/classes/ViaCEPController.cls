public with sharing class ViaCEPController {
    @AuraEnabled    
    public static viaCepJson consultaJSON(String cep) {
        String dados;
        List<String> result = new List<String> ();
        //Não esquecer de cadastrar o viacep como site remoto
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://viacep.com.br/ws/' + cep + '/json/');
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json');
        request.setTimeout(5000);       
                  
        HttpResponse response = http.send(request);        
        viaCepJson query = new viaCepJson(); 
        if (response.getStatusCode() == 200) {
           dados = (response.getBody());
           query = (viaCepJson) JSON.deserialize(dados, viaCepJson.class);   
           result.add(query.bairro);    
           result.add(query.localidade);   
           result.add(query.logradouro);        
           result.add(query.uf);   
        }
        System.debug(query);
        return query;
    }
}