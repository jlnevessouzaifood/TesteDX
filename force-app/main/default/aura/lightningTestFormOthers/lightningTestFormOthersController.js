({

    doInit : function(component, event, helper){        
        
        
    },
    
    onChangePhone : function(component, event, helper) {
        console.log('component.get("v.accounttwo.Phone")) ' + component.get("v.accounttwo.Phone"));
        var formatedPhone = helper.formatedPhone(event, component.get("v.accounttwo.Phone"));
        if (formatedPhone == false) {
            return false;
        } else if (formatedPhone === true){
            return;
        } else{
            component.set("v.accounttwo.Phone", formatedPhone)
        }
    },

    onChangeCellPhone : function(component, event, helper) {
        console.log('component.get("v.accounttwo.CellPhone__c")) ' + component.get("v.accounttwo.CellPhone__c"));
        var formatedCellPhone = helper.formatedCellPhone(event, component.get("v.accounttwo.CellPhone__c"));
        if (formatedCellPhone == false) {
            return false;
        } else if (formatedCellPhone === true){
            return;
        } else{
            component.set("v.accounttwo.CellPhone__c", formatedCellPhone)
        }
    },
    
    
    
    cpfValidity : function(component, event, helper) {      
        
        if (component.get("v.accounttwo.CPFn__c").length < 11) {
		var toastEvent = $A.get("e.force:showToast");
    toastEvent.setParams({
        "title": "CPF Inválido!",
        "message": "Digite um CPF válido.",
        "type": "Warning"
        
    });
    toastEvent.fire();
        
        }  else {
        
        var cpf = helper.helperMethod(component, event, helper);
        
        if (cpf) { 
            component.set('v.check', true);
        
        }
        else {  
            var toastEvent = $A.get("e.force:showToast");
    toastEvent.setParams({
        "title": "CPF Inválido!",
        "message": "Digite um CPF válido.",
        "type": "Warning"
        
    });
    toastEvent.fire();
              }                 
           
    }
    }, 

 ageCalculator : function (component, event, helper){ 
 var dataAtual = new Date();
 var anoAtual = dataAtual.getFullYear();
 var anonascsistema = component.get("v.accounttwo")
 var anoNascParts = anonascsistema.BirthDate__c.split('-');
 var anoNasc =anoNascParts[0];
 var mesNasc =anoNascParts[1];
 var diaNasc =anoNascParts[2];     
 var idade = anoAtual - anoNasc;
     
 var mesAtual = dataAtual.getMonth() + 1; 
     
 //Se mes atual for menor que o nascimento, nao fez aniversario ainda;  
 if(mesAtual < mesNasc){
 idade--; 
 } else {
 //Se estiver no mes do nascimento, verificar o dia
 if(mesAtual == mesNasc){ 
 if(new Date().getDate() < diaNasc ){ 
 //Se a data atual for menor que o dia de nascimento ele ainda nao fez aniversario
 idade--; 
 }
 }
 } 
 component.set("v.accounttwo.Age__c", idade);
 return idade; 
},    

cepSearch : function (component, event, helper) { 
    
    component.set('v.checktwo', true);
    helper.buscaCep(component, event, helper);
    
    

}
    
    
    
})