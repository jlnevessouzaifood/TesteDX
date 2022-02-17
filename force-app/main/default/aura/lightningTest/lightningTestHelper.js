({
    helperMethod : function(component, event, helper) {
        // create a one-time use instance of the serverEcho action
        // in the server-side controller
        var action = component.get("c.insertTeste");
        action.setParams({ "acc" : component.get("v.account") });
        action.setCallback(this, function(response) {
            var state = response.getState();
            
            if (state === "SUCCESS") {
                
                var returnValue = response.getReturnValue();
                component.set('v.data', returnValue);
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Cadastro Concluído!",
                    "message": "Sua Conta foi Cadastrada com Sucesso!.",
                    "type": "success"
                });
                toastEvent.fire();
                
                console.log(component.get('v.data'));
                helper.dataTable(component, event, helper);
                
            } else {
                
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Erro",
                    "message": "Problemas no Cadastro.",
                    "type": "Error"
                });
                toastEvent.fire();
            }
        });
        
        $A.enqueueAction(action);
        
    },

    dataTable : function(component, event, helper) {

        var action = component.get("c.dataTable");
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            
            if (state === "SUCCESS") {
                
                var returnValue = response.getReturnValue();
                component.set('v.data', returnValue);
               
                console.log(component.get('v.data')); 
                
                
            }
        });
        
        $A.enqueueAction(action); 
        
        component.set("v.check", false)
       component.set("v.checktwo", true)
       var label = ("{!$Label.label_nome}"); 
        
       component.set ('v.columns', [
        { label: "c.label_nome", fieldName: 'CPFn__c'},
        { label: 'Nome', fieldName: 'Name'},
        { label: 'Sobrenome', fieldName: 'LastName__c'},
        { label: 'Data de Nascimento', fieldName: 'BirthDate__c'},
        { label: 'Idade', fieldName: 'Age__c'},
        { label: 'Telefone', fieldName: 'Phone'},
        { label: 'Celular', cellAttributes:{class:'teste' } },
        
        
    ]);
 
},
    handleRowAction: function (cmp, event, helper) {
        var action = event.getParam('action');
        var row = event.getParam('row');

        switch (action.name) {
            case 'show_details':
                alert('Showing Details: ' + JSON.stringify(row));
                break;
            case 'delete':
                helper.removeBook(cmp, row);
                break;
        }
    }
})