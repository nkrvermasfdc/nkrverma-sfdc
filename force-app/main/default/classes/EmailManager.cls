//=============================================================================================================================

public with sharing class EmailManager
{
    public void sendMail(String[] addresses, String[] subjects, String[] messages) 
    {
        Messaging.SingleEmailMessage[] emails = new Messaging.SingleEmailMessage[]{};
        Integer totalMails = addresses.size();
    
        for(Integer i=0; i < totalMails; i++)
        {
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setSubject(subjects[i]);
            email.setToAddresses(new List<String> { addresses[i] });
            email.setPlainTextBody(messages[i]);
            emails.add(email);
        }
    
        Messaging.sendEmail(emails);
    }                
}


//=============================================================================================================================
/* Execute the Below Code from Developer Console or from the calling class or place
String address = 'nkrverma.sfdctest1@gmail.com';
String subject = 'Speaker Confirmation';
String body    = 'Thank you for speaking at the conference.';
String[]  addresses = new String[]{},
          subjects = new String[]{},
          messages = new String[]{};
addresses.add(address);
subjects.add(subject);
messages.add(body);
EmailManager em = new EmailManager();
em.sendMail(addresses, subjects, messages);
*/                
//=============================================================================================================================