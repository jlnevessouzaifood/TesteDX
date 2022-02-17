public with sharing class clsCriarContasContatos {

    public static String geraGrupo(String acctName) {
        Account newAcct = new Account();
        List<String> nameSplittedbySpace = acctName.split(' ');
        List<Contact> contactList = new List<Contact>();
        Integer counter = 1;

        if(!String.isBlank(acctName)){
            newAcct.Name = acctName;
            system.debug(newAcct);
            insert newAcct;

            ID acctID = newAcct.ID;
            for (String str : nameSplittedbySpace){
                system.debug(str);
                Contact newContact = new Contact(
                        FirstName  = str,
                        LastName   = 'Contato ' + counter,
                        AccountId  = acctID);
                        counter    = counter + 1;
                contactList.add(newContact);
            }
            System.debug(contactList);
            insert contactList;

        }
        else{System.debug('Parametro vazio. Nenhuma conta ou contato foram criados.');}

    return acctName;

    }
}