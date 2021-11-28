Trigger CreateDefaultContact on Account(after insert){

    List<contact> cons =new List<contact>();
    
    for(Account a :Trigger.new){
     // We can match the fileds of both objects, what are required fileds u want before going to insert of contact
     contact c   = new contact();
     c.lastname  = a.name;
     c.phone     = a.phone;
     c.accountid = a.id;
     cons.add(c);
    }

insert cons;

}