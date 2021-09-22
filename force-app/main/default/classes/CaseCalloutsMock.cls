@isTest
global with sharing class CaseCalloutsMock implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest request) {
        // Create a fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json;charset=UTF-8');
        response.setBody('{"cases": ["new case", "my case"]}');
        response.setStatusCode(200);
        return response; 
    }
}
   

 