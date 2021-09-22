public with sharing class MigrateCasesController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList() {
       return MigrateCasesService.getContactList();
    }

   

    @AuraEnabled
    public static boolean ImportCasesList(String Email) {
       
      return  MigrateCasesService.ImportCasesList(Email);
       
    }

    @AuraEnabled(cacheable=true)
    public static List<Case>  getCasesList(String Email) {
        return MigrateCasesService.getCasesList(Email);

       }
       
    




}
