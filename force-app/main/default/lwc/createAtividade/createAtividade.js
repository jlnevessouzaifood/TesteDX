import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import searchPer from '@salesforce/apex/mk11.searchPer';
import savePer from '@salesforce/apex/mk11.savePer';
import renit from '@salesforce/apex/mk11.renit';




export default class AccountCpf extends NavigationMixin(LightningElement)  {
    numberFA = 0;
    flagMobile = false;
    numberJL = 0;
    nextJL = 'Vazio';
    nextFA = 'Vazio';
    personFA = [];
    personJL = [];  
    flagNext = true;
    id;
    

    connectedCallback() { 
        searchPer()
        .then((result)=>{
            console.log(result);
            this.personJL=result.listJl;
            this.personFA=result.listFa;
            this.numberFA=result.nFa;
            this.numberJL = result.nJl;
            this.id=result.id;
            this.handlenextFA ();
        })
        .catch((error) => {
            console.log(error);
        })
    }
    handlenextJL () { 
        
        let items = this.personJL;
        let  randomItem = items[Math.floor(Math.random() * items.length)];
        items.forEach(picklist => {
            if(picklist == randomItem){
                
                items.splice(items.indexOf(picklist), 1);
            }
         }); 
         console.log(items);
         this.nextJL = randomItem;
         this.personJL = items;
         this.flagNext=false;
         
         
    }
    handlenextFA () { 
        
        let items = this.personFA;
        let  randomItem = items[Math.floor(Math.random() * items.length)];
        items.forEach(picklist => {
            if(picklist == randomItem){
                
                items.splice(items.indexOf(picklist), 1);
                
            }
         }); 
         this.nextFA = randomItem;
         console.log(items);
         this.personFA = items;
         
         this.handlenextJL ();
         
    }
    handlenumberJL () { 
        this.numberJL = this.numberJL + 1;
        if(this.numberJL + this.numberFA == 37) {
            renit()
            if(this.numberJL > this.numberFA) {
                this.showToast('Parabens JL','Reiniciando Contagem','success');
            }
            else {
                this.showToast('Parabens FA','Reiniciando Contagem','success');
            }
            
            setTimeout(() => {
                this.cancelButton();
            }, 5000);
        }
        else {
            savePer({listFa :this.personFA, listJl :this.personJL, nFa :this.numberFA, nJl :this.numberJL, id:this.id})
            this.handlenextFA();
        }
        
    }
    handlenumberFA () { 
        this.numberFA = this.numberFA + 1;
        if(this.numberJL + this.numberFA == 37) {
            renit()
            if(this.numberJL > this.numberFA) {
                this.showToast('Parabens JL','Reiniciando Contagem','success');
            }
            else {
                this.showToast('Parabens FA','Reiniciando Contagem','success');
            }
            
            setTimeout(() => {
                this.cancelButton();
            }, 3000);
        }
        else {
            savePer({listFa :this.personFA, listJl :this.personJL, nFa :this.numberFA, nJl :this.numberJL, id:this.id})
            this.handlenextFA();
        }
        
    }
    handledashnumberJL () { 
        this.numberJL = this.numberJL - 1;
        
    }
    handledashnumberFA () { 
        this.numberFA = this.numberFA - 1;
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
    cancelButton(){
        window.location.reload();
   } 
}