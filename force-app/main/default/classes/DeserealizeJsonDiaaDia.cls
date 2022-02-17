public with sharing class DeserealizeJsonDiaaDia {
    public Atividade atividade;

    public with sharing class Atividade {
        public String name;
        public String dataAtividade;
        public String hora;
        public String nomeProjeto;
        public String descricao;
        public String userName;
        public Boolean horaExtra;
    }  
    public DeserealizeJsonDiaaDia() {

    }
}