public with sharing class formAulamock2 implements HttpCalloutMock {
    public HttpResponse respond(HttpRequest request) {
        HttpResponse response = new HttpResponse();
        response.setStatusCode(200);
        response.setBody('{"campo_1" : 1,"campo2" : "Oie","campo3" : {"subcampo1" : "2021-10-10" }}');
        return response;
    }
}