public class ContactAndLeadSearch {
    @AuraEnabled
    public static Object insertTeste(Account acc)
    {
        System.debug(acc);
        insert acc;
        return acc;
    }

    @AuraEnabled
    public static List<Account> dataTable()
    {
        List<Account> data = [SELECT             CPFn__c,
                                                Name,
                                                LastName__c,
                                                BirthDate__c,
                                                Age__c,
                                                CellPhone__c,
                                                Phone
                                        FROM Account];
        return data;
    }
}