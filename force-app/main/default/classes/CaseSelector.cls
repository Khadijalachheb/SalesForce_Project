public with sharing class CaseSelector {
    public static List<Case> getCases() {
        return [SELECT CaseNumber, Status, Subject, Origin, Priority
            FROM Case];
    }

    public static List<Case> getCaseByContactEmail(String email) {
        return [SELECT CaseNumber, Status, Subject, Origin, Priority
                FROM Case
                WHERE ContactEmail=:email
                ];
    }

    
    public static Case getCaseByCaseNumber(String CaseNumber) {
        return [SELECT  Status, Subject, Origin, Priority
            FROM Case
            WHERE CaseNumber=:CaseNumber
            LIMIT 1
            ];
    }

    
    public static List<Case> getCasesByCaseNumber(List<String> CaseNumberList) {
        return [SELECT   Status, Subject, Origin, Priority
               FROM Case
               WHERE CaseNumber IN :CaseNumberList
            ];
    }

    
 
}
