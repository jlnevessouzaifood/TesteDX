import { LightningElement, api, wire } from 'lwc';
import {
    subscribe,
    unsubscribe,
    MessageContext
  } from "lightning/messageService";
  import CART_CHANNEL from "@salesforce/messageChannel/UpdateTable__c";
  const columns = [
    { label: 'Name', fieldName: 'name' },
    { label: 'Date', fieldName: 'date', type: 'date'},
    { label: 'Email', fieldName: 'email'},
    
];

export default class AccountCpfIterator extends LightningElement {
    @api listobj;
    @wire(MessageContext)
    messageContext;
    receivedMessage;
    subscription = null;
    data;
    columns = columns;
   

    connectedCallback() {
        if (this.subscription) {
            return;
        }
        this.subscription = subscribe(
            this.messageContext,
            CART_CHANNEL,
            (message) => {
                this.handleMessage(message);
            }
        );
    }
    handleMessage(message) {
       console.log(message);
       this.listobj=message.obj;  
       this.data=message.obj;  
    }   
    selectedRows(event) {
        var select = event.detail.selectedRows;
        console.log(select);
    }

}