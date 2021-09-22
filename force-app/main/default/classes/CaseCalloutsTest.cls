@isTest
public with sharing class CaseCalloutsTest {

    @isTest static  void testGetCallout() {
        // Set mock callout class 
    Test.setMock(HttpCalloutMock.class, new CaseCalloutsMock()); 
    String Email='spavlova@uog.com';
    // This causes a fake response to be sent
    // from the class that implements HttpCalloutMock. 
    HttpResponse result=  CaseCallouts.makeGetCallout(Email);
    
     // Verify mock response is not null
     String messageNull='The callout returned a null response.';
     System.assertNotEquals(null, result, messageNull);
 // Verify status code
 Integer Status=result.getStatusCode();
 String messageCode='The status code is not 200.';
 System.assertEquals(200,Status,messageCode);
 // Verify content type   
 String expectedContent='application/json;charset=UTF-8';
 String Content= result.getHeader('Content-Type');
 String messageContent='The content type value is not expected.';
 System.assertEquals(expectedContent,Content ,messageContent);  
 // Verify the array contains 2 items     
 Map<String, Object> results = (Map<String, Object>) 
 JSON.deserializeUntyped(result.getBody());
 List<Object> cases = (List<Object>) results.get('cases');
 Integer size=cases.size();
 String messageSize='The array should only contain 2 items.';
 System.assertEquals(2,size ,messageSize);      
    }   
}
