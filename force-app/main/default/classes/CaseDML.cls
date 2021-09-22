public with sharing class CaseDML {
    public static boolean insertCases(List<Case> cases,Contact contact){
        for (Case myCase :cases){
            myCase.ContactId=contact.Id;
        }
        try{
        insert cases;
        return true;
    } catch (DmlException e) {
        System.debug('A DML exception has occurred: ' +
                    e.getMessage());
        return false;
    }
    }
    
    public static boolean upsertCases(List<Case> cases){
        //
        return true;
    }

    public static boolean updateCases(List<Case> cases){
        //
        return true;
    }

    public static boolean deleteCases(List<Case> cases){
        //
        return true;
    }
}
