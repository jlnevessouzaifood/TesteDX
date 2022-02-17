({
	helperMethod : function(component, event, helper) {
        
        var cpfn = component.get("v.accounttwo");
        var Soma;
        var Resto;
        var Soma2;
        Soma = 0;
        Soma2= 0;
        if(cpfn.CPFn__c == "00000000000") return false;    
        if(cpfn.CPFn__c == "") return false;
           
            for (let i=1; i<=9; i++) Soma = Soma + parseInt
            (cpfn.CPFn__c.substring(i-1, i)) * (11 - i);
        Resto = (Soma * 10) % 11;
        
        if ((Resto == 10) || (Resto == 11))  Resto = 0;
        if (Resto != parseInt(cpfn.CPFn__c.substring(9, 10)) ){           
        
            console.log(cpfn.CPFn__c.substring(9, 10));
            return false;   }        
        
        
         for (let i = 1; i <= 10; i++) Soma2 = Soma2 + parseInt
         (cpfn.CPFn__c.substring(i-1, i)) * (12 - i);
    Resto = (Soma2 * 10) % 11;

    if ((Resto == 10) || (Resto == 11))  Resto = 0;
        if (Resto != parseInt(cpfn.CPFn__c.substring(10, 11) ) ) {
           console.log(cpfn.CPFn__c.substring(10, 11));
            return false;
        }
            
       else{ return true;
            }
        	
		
	},
    
    formatedPhone : function(event, typed) {
        var key = Number(event.key);
        let continueKey = ['Backspace','Delete','Tab','ArrowRight','ArrowLeft', 'onblur'];

		if (continueKey.includes(event.key))
			return true;

		if (isNaN(key) || event.key === null || event.key === ' ') {
			event.preventDefault();
			return false;
		}
        console.log('typed ' + typed);
        var value = typed.replace(/\D+/g, ''); //33334567
        if(value.length == 9){ 
            var phone4 = '(' + value.slice(0,2) + ')';
            var phone5 = value.slice(2,6) + '-';
            var phone6 = value.slice(6,value.length);
            return(phone4+phone5+phone6+key)
        }
        return true
    },

    formatedCellPhone : function(event, typed) {
        var key2 = Number(event.key);
        let continueKey = ['Backspace','Delete','Tab','ArrowRight','ArrowLeft', 'onblur'];

		if (continueKey.includes(event.key2))
			return true;

		if (isNaN(key2) || event.key2 === null || event.key2 === ' ') {
			event.preventDefault();
			return false;
		}
        console.log('typed ' + typed);
        var value = typed.replace(/\D+/g, '');
        if(value.length == 10){
            var phone7 = '(' + value.slice(0,2) + ')';
            var phone8 = value.slice(2,7) + '-';
            var phone9 = value.slice(7,value.length);
            return(phone7+phone8+phone9+key2)

        }
        return true
    },

    buscaCep : function(component, event, helper) {

        
        var action = cmp.get("c.ViaCEPController");
        action.setParams({'cep' : cmp.get("v.accounttwo").Cep__c});
 
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                getReturnValue();        
                } else {
                    console.log("Unknown error");
                }
            },
        $A.enqueueAction(action));
    
    }
    
    
    
})