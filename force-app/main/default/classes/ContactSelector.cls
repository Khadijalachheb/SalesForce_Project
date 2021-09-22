public with sharing class ContactSelector {
    
    public static List<Contact> getContactList() {
        return [SELECT Id, FirstName, LastName, Email
            FROM Contact];
    }

    
    public static Contact getContactById(String id) {
        return [SELECT  FirstName, LastName, Email
            FROM Contact
            WHERE Id=:id
            LIMIT 1
            ];
    }

    
    public static List<Contact> getContactsByIds(List<String> ids) {
        return [SELECT  FirstName, LastName, Email
               FROM Contact
               WHERE Id IN :ids
            ];
    }

    
    public static Contact getContactByEmail(String email) {
        return [SELECT Id, FirstName, LastName, Email
                FROM Contact
                WHERE Email=:email
                LIMIT 1
                ];
    }
}
