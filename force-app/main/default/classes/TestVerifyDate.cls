@isTest
Public Class TestVerifyDate {
    
    @isTest Public Static Void TesteApex () {
        
        VerifyDate.CheckDates(System.today(), System.today().addMonths(1));
        
    }
    
    @isTest Public Static Void TesteApex2 () {
        
        VerifyDate.CheckDates(System.today().addDays(1), System.today());
        
    }
    
    @isTest Public Static Void TesteApex3 () {
        
        VerifyDate.CheckDates(System.today(), System.today().addDays(10));
        
    }
}