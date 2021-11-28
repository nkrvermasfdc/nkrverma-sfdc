Public class ContactSearch 
{

    Public static List<contact> searchForContacts (String lastName, String postalCode)
    {
        List<Contact> con = [Select 
                             ID, 
                             Name
                             from contact 
                             where 
                             lastname = :lastName and
                             mailingpostalcode = :postalCode];
        return con;
    }

}