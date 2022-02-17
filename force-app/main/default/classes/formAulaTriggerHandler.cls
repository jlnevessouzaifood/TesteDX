public with sharing class formAulaTriggerHandler {
    public with sharing class ResponseObject {
        public String name;
        public String cpf;
        public Boolean flag;
    }
    public static void afterInsert(List<Account> accListNew) {
        ResponseObject resp = new ResponseObject();
        for (Account accNew : accListNew) {
            if (accNew.CPFn__c == '09642049910')   {
                resp.name=accNew.Name;
                resp.cpf='09642049920';
                resp.flag=true;
                System.debug('Si ' + accNew.Name);
            }         
            else {
                resp.flag=false;
                System.debug('No ' + accNew.Name);
            }
        }
        if(resp.flag==true) {
            Account acc = new Account(
            CPFn__c=resp.cpf,
            Name='Trigger ' + resp.name
        );
        insert acc;
        }        
    }
    public static void beforeInsert (List<Account> accListNew) {
        Opportunity opp = [SELECT Commission__c FROM Opportunity WHERE 	Name = 'Edge SLA'];
        for (Account accNew : accListNew) {
            System.debug(accNew.Salario__c);
            accNew.Salario__c = opp.Commission__c;            
        }
        
    }

}