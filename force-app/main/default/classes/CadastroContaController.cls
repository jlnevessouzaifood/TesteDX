public with sharing class CadastroContaController {
    
    
    
    @AuraEnabled
    public static String getPostalCode(String postalCode){
        String cepRetorno = ViaCEPController.buscaCep(postalCode);
        return cepRetorno;
        
    }
}