// Created on 9-March-2020 for -- Salesforce Trailhead 2020 - Apex - Write SOSL Queries Challenge

Public class ContactAndLeadSearch 
{
	 Public static List<List< SObject>> searchContactsAndLeads (String SearchText)
     {
      List<List<sObject>> searchList = [FIND :SearchText IN ALL FIELDS 
                                        RETURNING
                                        Contact(FirstName,LastName),
                                        Lead(FirstName,LastName)];  
         
      Contact[] searchContacts = (Contact[])searchList[0];
      Lead[]    searchLeads    = (Lead[])searchList[1];
         
         System.debug('Found the following Contacts.');         
         for (Contact c : searchContacts) 
         {
             System.debug(C.LastName + ', ' + C.FirstName);
         }
	
         System.debug('Found the following Leads.');         
         for (Lead L : searchLeads) 
         {
             System.debug(L.LastName + ', ' + L.FirstName);
         }
         
      Return searchList;
     }
	
}