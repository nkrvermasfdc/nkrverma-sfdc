/**
 * Add your comment here
 **/
public with sharing class JqueryDataTableContrlr {

    public List<Case> getCaseList () {
        return [SELECT Id, CaseNumber, Priority, Status,
                            Account.Name, Contact.Name
                    FROM Case
                    WHERE IsClosed = FALSE];
    }
}