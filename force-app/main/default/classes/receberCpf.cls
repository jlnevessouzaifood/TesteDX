@RestResource(urlMapping='/EnvioCpf')
global with sharing class receberCpf {

    @HttpPut
    global static String receberCpf() {
        RestRequest req = RestContext.request; 
        String json=req.requestBody.toString();
        String returnMessage;
        DeserealizeJsonCpf cpfDes = (DeserealizeJsonCpf)System.JSON.deserialize(json, DeserealizeJsonCpf.class);
        System.debug(cpfDes.cpf);
        if (cpfDes.cpf==null || cpfDes.cpf=='') {
            RestContext.response.statusCode = 400 ;
            returnMessage = 'Erro, Enviar o campo cpf corretamente';               
        }
        else {
            System.debug(cpfDes);
        }
        return returnMessage;
    }

  public with sharing class DeserealizeJsonCpf {
    public String cpf;
  } 
}