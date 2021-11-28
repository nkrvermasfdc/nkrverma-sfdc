trigger DedupedReminder on Account (after insert) 
{
    for(account acc : Trigger.new)
    {
    /*
    Case c= new Case();
    C.Subject    = 'Ddeupe this Account';
    C.OwnerId    = '0057F000000qEBd';
    C.AccountId  = acc.Id;
    insert c;
    */
    }
}