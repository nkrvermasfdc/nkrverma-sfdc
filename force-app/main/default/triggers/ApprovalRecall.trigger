trigger ApprovalRecall on Opportunity (after update) 
{
    // Notifing System Administrator by mail
    String address = 'nkrverma.sfdctest1@gmail.com';
    String subject = 'NKV SFDC -- Trigger -- Recall Failed : Opportunity Approval Request Recall Failed as it been initated by unAuthorized User : "'+UserInfo.getOrganizationName()+'"';
    String body    = 'NKV SFDC -- Trigger -- Thank you for speaking at the conference.';
    String[]  addresses = new String[]{},
        	  subjects = new String[]{},
              messages = new String[]{};
              addresses.add(address);
    subjects.add(subject);
    messages.add(body);
    EmailManager em = new EmailManager();
    em.sendMail(addresses, subjects, messages);
}