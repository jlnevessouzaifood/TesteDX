({
    Lance : function(component, event, helper) {
       
        if (component.get("v.leilao.ValordoLance__c")>component.get("v.leilao.Maior_Lance__c")){
            component.set('v.lance', false);
            component.set('v.maiorlance', true);
            component.set("v.leilao.Maior_Lance__c")}
            else {
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Lance Abaixo!",
                    "message": "Seu Lance é abaixo do Maior lance.",
                    "type": "Warning"
                    
                });
                toastEvent.fire();
            }
    },
    Lance2 : function(component, event, helper) {
        if (component.get("v.leilao2.ValordoLance__c")>component.get("v.leilao2.Maior_Lance__c")){
            component.set('v.maiorlance2', true);
            component.set("v.leilao2.Maior_Lance__c")}
            else {
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Lance Abaixo!",
                    "message": "Seu Lance é abaixo do Maior lance.",
                    "type": "Warning"
                    
                });
                toastEvent.fire();
            }
    },
    Lance3 : function(component, event, helper) {
        if (component.get("v.leilao3.ValordoLance__c")>component.get("v.leilao3.Maior_Lance__c")){
            component.set('v.maiorlance3', true);
            component.set("v.leilao3.Maior_Lance__c")}
            else {
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Lance Abaixo!",
                    "message": "Seu Lance é abaixo do Maior lance.",
                    "type": "Warning"
                    
                });
                toastEvent.fire();
            }
    }
})