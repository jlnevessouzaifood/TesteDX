public class AccountHandler {
    
    public static void insertAccount (integer value){
        Integer n = 1;
        
        List<Account> addAccounts = new List<Account>();
        while(n <= value){
            
            Account store1 = new Account();
            store1.Name = 'Acme Inc ' + n;
            store1.AccountNumber = 'A000' + n;
            addAccounts.add(store1);
            n++;
                
                
                }
        insert addAccounts;
    }
}