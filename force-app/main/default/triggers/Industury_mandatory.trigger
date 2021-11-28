Trigger Industury_mandatory on Account (before insert) 
{

    for(account a:Trigger.new)
    {
        if (a.industry == null )
        {
            a.industry.adderror('Trigger Error -- Industory is Mandatory');
        }        
    
    }

}