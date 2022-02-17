public with sharing class formAulaSerealize {
        public Integer campo1;
        public String campo2;
        public Campo3Obj campo3;

public with sharing class Campo3Obj {
        public Date subcampo1;
}    
    public static String  Serealize(Integer num, String nome, String data) {
        formAulaSerealize obj1 = new formAulaSerealize();
        Campo3Obj obj2 = new Campo3Obj();
        obj2.subcampo1=Date.valueOf(data);
        
        obj1.campo1=num;
        obj1.campo2=nome;
        obj1.campo3=obj2;

        String jsonSerealized = System.JSON.serialize(obj1);

        return jsonSerealized;
    }
}