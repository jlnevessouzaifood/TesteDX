import { LightningElement, api, wire } from 'lwc';
import CART_CHANNEL from "@salesforce/messageChannel/formAula__c";
import searchForm from '@salesforce/apex/formAulaController.searchForm';
import {
    subscribe,
    unsubscribe,
    MessageContext
  } from "lightning/messageService";
  const columns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Date', fieldName: 'DatadeInsercao__c', type: 'date'},
    { label: 'Email', fieldName: 'Email__c'},
    { label: 'CPF', fieldName: 'CPFn__c' },
    { label: 'Sálario', fieldName: 'Salario__c', type: 'currency'},
    { label: 'Celular', fieldName: 'CellPhone__c', type: 'tel'}
    
];

export default class FormAulaDatatable extends LightningElement {
    @wire(MessageContext)
    messageContext;
    receivedMessage;
    subscription = null;
    data;
    columns = columns;
    isLoading

    connectedCallback() {
        searchForm({cpf : '08553072932'})
        .then ((result)=>{
            this.data=result;
        })
        /*if (this.subscription) {
            return;
        }
        this.subscription = subscribe(
            this.messageContext,
            CART_CHANNEL,
            (message) => {
                this.handleMessage(message);
            }
        );*/
    }
    handleMessage(message) {
       console.log(message);
       this.isLoading=true ;
       this.data=message.obj;  
    }   
}