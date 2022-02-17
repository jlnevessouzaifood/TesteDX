({  
    doInit : function(component, event, helper){        
        helper.dataTable(component, event, helper);
        component.set("v.checktwo", true)
    },
     saveButton: function(component, event, helper) {
         
         var campo = component.get("v.account");
                                   
       if(campo.CPFn__c != '' && 
          campo.Name    != '' && 
          campo.LastName__c  != '' && 
          campo.BirthDate__c != '' &&
          campo.Phone !=        '' &&
          campo.CellPhone__c != '' &&
          campo.Age__c   >= 18) {
            
         
      	helper.helperMethod(component, event, helper);
       
       } 
       else if (campo.Age__c < 18) {
            var toastEvent = $A.get("e.force:showToast");
    toastEvent.setParams({
        "title": "Erro de Idade!",
        "message": "A Idade mínima é 18 Anos.",
        "type": "Warning"
    });
    toastEvent.fire();
         }
         
         else {
          var toastEvent = $A.get("e.force:showToast");
    toastEvent.setParams({
        "title": "Campo Vazio!",
        "message": "Preencha Todos os Campos Corretamente.",
        "type": "Warning"
    });
    toastEvent.fire();
       }
       
     }, 
    
    cancelButton: function(component, event, helper) {
         window.location.reload();
    } 
})