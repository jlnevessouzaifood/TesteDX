import { LightningElement, api, track, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import titulo from '@salesforce/label/c.Titulo';
import {publish, MessageContext } from "lightning/messageService";
import CART_CHANNEL from "@salesforce/messageChannel/UpdateTable__c";
import myResource from '@salesforce/resourceUrl/aula';
import teste from '@salesforce/label/c.teste';


export default class accountCpf extends LightningElement {
   
    title = false;
    label = {titulo, teste}
    list = [];
    obj;
    img = myResource;
    table = false;
    number = 1; 
    listObj = [];
    listAswers = [];
    @wire(MessageContext)
    messageContext;
    
    @track isLoading;

    connectedCallback() {    //chamada no inicio da pagina  
        var title = this.title;
        let items = [12, 548 , 'a' , 2 , 5478 , 'foo' , 8852, , 'Doe' , 2145 , 119];
        let  randomItem = items[Math.floor(Math.random() * items.length)];
        console.log(randomItem);
        
        var list1 = [];
        if (title === true) {
            this.number=2;
        }
        
        list1.push('Oie');
        this.list=list1
    }    
    handleClick() {
        var list2 = this.list;        
        list2.push('Tchau');
        this.isLoading=true;
        this.number=3;
        var number = '3';
        this.showToast(this.label.teste,number + this.number,'success'); // toast
        setTimeout(() => { this.isLoading=false; }, 5000); // timeout
        this.list= list2
    }
    handleClick2 () {
        var list2 = this.list;        
        list2.push('Hey');
        console.log(this.list);
        console.log(this.obj);
        console.log(this.listObj);
        let selectedDiv = this.template.querySelectorAll('[data-id="divTeste"]'); // busca de Elemento
                
        selectedDiv.forEach(div =>{         
            div.classList.remove('slds-m-left_x-small');
            div.classList.add('slds-m-left_x-large');        
        });
        this.list= list2
    }
    handleClick3 () {
        var obj1;
        var listObjs
        var list = this.list;
        obj1 = {
            '1' : list[0],
            '2' : list[1],
            '3' : list[2]
        }
        
        this.listObj = listObjs;
        this.obj = obj1;
        
    }
    saveEmail (event) {
        var list =  this.listAswers;
        var email = event.target.value;0        
        list.push(email);
        this.listAswers=list;

    }
    saveanswers (event) {
        var list = this.listAswers;
        var ans = event.target.value;
        list.push(ans);
        this.listAswers=list;        
        
    }
    saveDate (event) {
        var list =  this.listAswers;
        var date = event.target.value;
        var year = date.slice(0,4)
        var month = date.slice(5,7);
        var day = date.slice(8,10);
        var formatDay = day + '/' + month + '/' + year;
        list.push(formatDay);
        this.listAswers=list;  
    }
    saveText (event) {
        var list =  this.listAswers;
        var text = event.target.value;        
        list.push(text);
        this.listAswers=list;
        console.log(this.listAswers);
    }
    save (event) {
        
        var listAns = this.listAswers;
        var answ;
        var list = this.listObj;
        answ = {
            'name' : listAns[0],
            'date' : listAns[1],
            'email' : listAns[2],
            '4lista' : 'List'
        }
        //this.obj=answ;
        list.push(answ);
        this.listObj=list;
        this.listAswers = [];  
        const messaage = {obj: this.listObj};
        //this.data=list;
        publish(this.messageContext, CART_CHANNEL, messaage);
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