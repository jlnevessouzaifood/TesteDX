public with sharing class enviarDadosCpf {
    public with sharing class MeuJson {        
        public TConsulta consulta_cpf;        
    }
    
    public with sharing class TConsulta {
        public String nome;
        public String cpf;
        public String data_nascimento;
        public Consulta consulta;        
    }
    public with sharing class Consulta {
        public String status;
        public Boolean limpo;
        public List<Quem> quem_consultou;               
    }
    public with sharing class Quem {
        public String nome;
        public String cnpj;        
    }
    public static void enviarDadosCpf() {
        List<Quem> qqList = new List<Quem>();
        Quem qq = new Quem();
        qq.nome='JL Tecnologia';
        qq.cnpj ='36.456.458/0001-65';
        qqList.add(qq);
        
        Consulta con = new Consulta();
        con.status='Ativo';
        con.limpo=true;
        con.quem_consultou=qqList;

        TConsulta tcon = new TConsulta();
        tcon.nome='Russel Wilson';
        tcon.cpf='09642049910';
        tcon.data_nascimento='1996-05-06';
        tcon.consulta = con;

        MeuJson json = new MeuJson();
        json.consulta_cpf=tcon;
        
        String jsonSerealized = System.JSON.serialize(json);   
        System.debug(json);
        makePostCnpj(jsonSerealized);

    }
    public static String authorization () {
               
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://na123.salesforce.com/services/oauth2/token?username=thomas.lagos@cunning-moose-5npm39.com&password=Thomp@123;wYgLZkkucp2Zodr8FkSgoWuw&client_id=3MVG9cHH2bfKACZYxNP_iEpE50zcTofkKeWtpQSg8zM9w7lSsMLucJtDyMyYIOMJTeBw9aCqW.Ux6W4h0NBmK&client_secret=F405B1A6C20A99E333B3FE394B1169F59B259D0B9BBC2FA43FD3707F174B4A05&grant_type=password');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');  
        DeserializeToken token;
        HttpResponse response = http.send(request);            
        if (response.getStatusCode() == 200) {           
            token = (DeserializeToken)System.JSON.deserialize(response.getBody(), DeserializeToken.class);    }
        return token.access_token;
    }     

    public static void makePostCnpj(String json) {
        
        String token = authorization();
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://cunning-moose-5npm39-dev-ed.my.salesforce.com/services/apexrest/Exercicio02');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setHeader('Authorization', 'Bearer ' + token);
        request.setBody(json);    
        
        HttpResponse response = http.send(request);  

       System.debug(response.getStatusCode());
       System.debug(response.getStatus());
       System.debug(response.getBody());
    }        

    public with sharing class DeserializeToken {
        public String access_token;
        public String instance_url;
        public String id;
        public String token_type;
        public String issued_at;
        public String signature; 
    }
}