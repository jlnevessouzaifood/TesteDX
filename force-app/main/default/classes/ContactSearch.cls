public class ContactSearch {
    
    public static List<Contact> searchForContacts (String teste, String jl)   {
         List<Contact> con = [SELECT Name FROM Contact WHERE (LastName like :teste AND MailingPostalCode like :jl)];
        
return con;
}
}