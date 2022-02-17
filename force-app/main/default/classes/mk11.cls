public with sharing class mk11 {
    public with sharing class responseObject {
        @AuraEnabled public Decimal nJl;
        @AuraEnabled public Decimal nFa;
        @AuraEnabled public Id id;
        @AuraEnabled public List<String> listJl; 
        @AuraEnabled public List<String> listFa; 
    }
    
    @AuraEnabled

    public static responseObject searchPer() {

        mk__c mk = [SELECT Id, nextFA__c, nextJL__c, numberFA__c, numberJL__c FROM mk__c ORDER BY CreatedDate DESC LIMIT 1];

        String str = mk.nextFA__c;
        List<String> res = str.split(',', 37);
        
        String str2 = mk.nextJL__c;
        List<String> res2 = str2.split(',', 37);

        responseObject resp = new responseObject();
        resp.nJl = mk.numberJL__c; 
        resp.nFa = mk.numberFA__c;
        resp.listJl = res2;
        resp.listFa = res;   
        resp.id=mk.Id;
        
        System.debug(res.size());
        System.debug(res2.size());
        return resp;
       }
    @AuraEnabled
    public static void savePer(List<String> listFa, List<String> listJl, Decimal nFa, Decimal nJl, Id id) {
       
        mk__c mk = [SELECT Id, nextFA__c, nextJL__c, numberFA__c, numberJL__c FROM mk__c WHERE Id = :id];
        System.debug(listFa.size());
        System.debug(listJl.size());
        String str = '';
        for (String fa : listFa) {
            
            str = (str + fa + ',');
            
        }
        String str2 = '';
        for (String jl : listJl) {
            str2 = (str2 + jl + ',');
        } 
        String X = str.Substring(0,str.length()-1);
        String Y = str2.Substring(0,str2.length()-1);
        
        mk.nextFA__c=X;
        mk.nextJL__c=Y;
        mk.numberFA__c = nFa;
        mk.numberJL__c = nJl;
        update mk;
        System.debug(mk.nextFA__c);
        System.debug(mk.nextJL__c);

    }
    @AuraEnabled
    public static void renit() {        
        mk__c mk = new mk__c();
        mk.nextFA__c = 'Baraka, Cetrion, Fujin, Cassie, Kitana, Geras, Mileena, DVorah, Kollector, Nightwolf, Erron, Sindel, Sheeva, Coringa, Frost, Exterminador, JacquiBriggs, Rain, Jade, Rambo, JaxBriggs, RoboCop, JohnnyCage, ShangTsung, Kabal, ShaoKahn, Kano, KotalKahn, Spawn, KungLao, LiuKang, NoobSaibot, Raiden, Scorpion, Skarlet, SonyaBlade, SubZero';
        mk.nextJL__c = 'Baraka, Cetrion, Fujin, Cassie, Kitana, Geras, Mileena, DVorah, Kollector, Nightwolf, Erron, Sindel, Sheeva, Coringa, Frost, Exterminador, JacquiBriggs, Rain, Jade, Rambo, JaxBriggs, RoboCop, JohnnyCage, ShangTsung, Kabal, ShaoKahn, Kano, KotalKahn, Spawn, KungLao, LiuKang, NoobSaibot, Raiden, Scorpion, Skarlet, SonyaBlade, SubZero';
        mk.numberFA__c = 0;
        mk.numberJL__c = 0;
        insert mk;
        System.debug(mk.nextFA__c);
        System.debug(mk.nextJL__c);
    }
}