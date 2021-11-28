trigger AppleWatch on Opportunity (after insert) 
{
    for (Opportunity opp : Trigger.new)
    {
     Case c        = new Case();
     c.Subject     = 'Apple watch Promo';
     c.Description = 'Send them one ASAP';
     c.Priority    = 'High'; 
     c.AccountID   = opp.AccountId;
     insert c;
    }
}