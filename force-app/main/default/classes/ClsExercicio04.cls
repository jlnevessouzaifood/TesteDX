public with sharing class ClsExercicio04 {
    public static String geraTexto(String textoInicial, Integer quantidade) {

        String textReturn = '';

        for(Integer i = 0 ; i < quantidade ; i++){
            textReturn += textoInicial + ';\n';
        }
        System.debug(textReturn);
        return textReturn;
    }
}