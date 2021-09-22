public with sharing class MigrateCasesService {
   
    public static List<Contact> getContactList() {
       return ContactSelector.getContactList();
     }


    
    public static List<Case>  getCasesList(String Email) {
        return CaseSelector.getCaseByContactEmail(Email);

       }

       
 
    
    public static boolean ImportCasesList(String Email) {
       boolean find=false;
   
      HTTPResponse response = CaseCallouts.makeGetCallout(Email);

            // Deserialize the JSON string into collections .
    List<Object> results = (List<Object>) JSON.deserializeUntyped(response.getBody());
 
            // Cast the values in the 'cases' list

    List<Case> cases= new List<Case>();

        for (Object   result :results)
       {
       Map<String,Object> item=( Map<String,Object>)result;
        Case mycase=new Case();

           mycase.Status=(String) item.get('Status');
           mycase.Subject=(String) item.get('Subject');
           mycase.Origin=(String) item.get('Origin');
           mycase.Priority=(String) item.get('Priority');
           
           cases.add(mycase);
       }
    
   //get the contact
 Contact contact=ContactSelector.getContactByEmail(email);
  
   //Check if there are some imported cases
    if(cases.size() > 0){

    //insert cases in the data base
      CaseDML.insertCases(cases,contact);
      find =true;
      
     }

     return  find;
  
     }
}
