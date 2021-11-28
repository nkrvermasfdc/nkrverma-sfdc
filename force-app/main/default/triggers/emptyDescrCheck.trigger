Trigger emptyDescrCheck on opportunity (before insert, before update) 
{
    for(opportunity opp: Trigger.new)
    {
          if(Trigger.isinsert && opp.Description == Null)
        {
            opp.adderror('You Can not Create an opportunity without Description');
        }
        Else 
        if(Trigger.isupdate && opp.Description == Null)
        {
            opp.adderror('You can not update an opportunity without Description, Please provide');
        } 
    }
}