public with sharing class CaseCallouts {
    public static HttpResponse  makeGetCallout(String Email) {
        HttpRequest req = new HttpRequest();
req.setEndpoint('callout:my_credential/services/apexrest/Cases/'+Email);
req.setMethod('GET');
Http http = new Http();
HTTPResponse response = http.send(req);


 while (response.getStatusCode() == 302)
  { req.setEndpoint(response.getHeader('Location'));
   response = new Http().send(req); }

      return response;
    }

    public static HttpResponse makePostCallout() {
        HTTPResponse response=new HTTPResponse();
      //code
        return response;
    }

    public static HttpResponse makePutCallout() {
        HTTPResponse response=new HTTPResponse();
       //code
        return response;
    }

    public static HttpResponse makeDeleteCallout() {
        HTTPResponse response=new HTTPResponse();
        //code
        return response;
    }
}
