import { LightningElement, api, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import {publish, MessageContext } from "lightning/messageService";
import CART_CHANNEL from "@salesforce/messageChannel/formAula__c";
import saveForm from '@salesforce/apex/formAulaController.saveForm';
import updateForm from '@salesforce/apex/formAulaController.updateForm';
import { NavigationMixin } from 'lightning/navigation';

export default class FormAula extends NavigationMixin(LightningElement) {
    budget;
    cellphone;
    email;
    date;
    name;
    cpf;
    objValues = [];
    idade;
    flagSaveAllFilled = false;
    flagSaveAllCorrect = false;
    isLoading;
    @wire(MessageContext)
    messageContext;
    idNewQuery

    saveBudget(event) {
       var budget = event.target.value;
       if (budget == null || budget == '') {
            this.flagSaveAllFilled = true;
       }
       else {
        this.flagSaveAllFilled = false;
        if (budget < 2000 || budget > 5000) {
            this.showToast('Preenchimento Incorreto','Valor de Salário Incompátivel','warning');
            this.flagSaveAllCorrect = true;
        }
        else {
            
            this.flagSaveAllCorrect = false;
            this.budget=budget;
        }
       }       
    }
    saveCel(event) {
        var cell =event.target.value;  
        if (cell == null || cell == '') {
            this.flagSaveAllFilled = true;
        }
        else {
            this.cellphone=cell;
            this.flagSaveAllFilled = false;
        }
    }
    saveEmail(event) {
        var email =event.target.value;  
        if (email == null || email == '') {
            this.flagSaveAllFilled = true;
        }
        else {
            this.email=email;
            this.flagSaveAllFilled = false;
        }
    }
    saveDate(event) {
        var date = event.target.value; 
        if (date == null || date == '') {
            this.flagSaveAllFilled = true;
        }
        else {
            var idade
            var years = date.slice(0,4);
            var month = date.slice(5,7);
            var day = date.slice(8,10);
            var dataAtual = new Date();
            var anoAtual = dataAtual.getFullYear();
            var mesAtual = dataAtual.getMonth() + 1;
            var diaAtual = dataAtual.getDate();
            if (anoAtual-years!=18){
               idade = (anoAtual-years);
            }
            else {
                this.flagSaveAllFilled = false;
                if (mesAtual<month) {
                    idade = 17;
                }
                else if (mesAtual>month) {
                    idade = 18;
                }
                else {
                    if (diaAtual<day) {
                    idade = 17;
                }
                else if (diaAtual>=day) {
                    idade = 18;
                }
                }
            }
            if (idade<18) {
                this.flagSaveAllCorrect = true;
                this.showToast('Preenchimento Incorreto','Idade menor que 18 anos','warning');
            }
            else {
                this.idade=idade;
                this.date=date;
                this.flagSaveAllCorrect = false;
            }            
        }
    }
    saveName(event) {
        var name =event.target.value;  
        if (name == null || name == '') {
            this.flagSaveAllFilled = true;
        }
        else {
            this.name=name;
            this.flagSaveAllFilled = false;
        }
    }
    saveCpf(event) {
        var cpf =event.target.value;  
        if (cpf == null || cpf == '') {
            this.flagSaveAllFilled = true;
        }
        else {
            this.cpf=cpf;
            this.flagSaveAllFilled = false;
        }
    }
    save () {        
        this.isLoading=true;
        var listValues;
        var obj= this.objValues;
        listValues = {'Name' :this.name,
        'Salario__c' : this.budget,
        'CellPhone__c' :this.cellphone,
        'Email__c' :this.email,
        'DatadeInsercao__c' :this.date,
        'CPFn__c' :this.cpf};

        obj.push(listValues);
        this.objValues=obj;
        saveForm({acc : listValues})
        .then((result)=>{
            if (result != null) {
                this.showToast('Preenchimento Concluido',result,'sucess');  
            const message = {obj: this.objValues}; 
            this.idNewQuery=result;       
            //publish(this.messageContext, CART_CHANNEL, message);
            }
        })
        .catch((error) => {

        })
        .finally(() => {
            this.isLoading = false;             
            this.navigate();   
        });
            
    }
    update (){
        updateForm({id : '0013t000028dnqkAAA'})
        .then((result)=>{
           // this.idNewQuery=result;
            //this.navigate();
            window.location.reload();
            return false;
        })
        .catch((error) => {
            this.showToast('Erro','erro','sucess');
        })
    }
    navigate() {       
        var Id=this.idNewQuery;
         this[NavigationMixin.Navigate]({
             type: 'standard__recordPage',
             attributes: {
                 recordId: Id,
                 objectApiName: 'ConsultasCredito__c',
                 actionName: 'view'
             }
         });  
     } 
    showToast(title, message, variant){
        this.dispatchEvent(
            new ShowToastEvent({
                title: title,
                message: message,
                variant: variant,
            }),
        );
    }    
}