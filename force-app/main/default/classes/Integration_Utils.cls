public with sharing class Integration_Utils {
    public static HttpResponse IntegrationPost(String endpoint, String body, Integer timeout) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('POST');
        request.setHeader('Content-type', 'aplication');
        request.setBody(body);       
        request.setTimeout(timeout);

        HttpResponse response = http.send(request);

        return response;
    }
    public static HttpResponse IntegrationGet(String endpoint, Integer timeout) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        request.setHeader('Content-type', 'aplication');
        request.setTimeout(timeout);

        HttpResponse response = http.send(request);

        return response;
    }}