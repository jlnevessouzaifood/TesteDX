public with sharing class DeserealizeWebhookAula {
    public DadosO dados;  
    
    public with sharing class DadosO {
        public PessoaisO dados_pessoais;
        public ContatosO dados_contato;
        public FinanceirosO dados_financeiros;
    }
    public with sharing class PessoaisO {
        public String nome;
        public String data;
        public String cpf;
    }
    public with sharing class ContatosO {
        public String email;
        public String celular;
    }
    public with sharing class FinanceirosO {
        public Decimal salario;
    }
}