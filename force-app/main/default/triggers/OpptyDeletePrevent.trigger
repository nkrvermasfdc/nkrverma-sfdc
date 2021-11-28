trigger OpptyDeletePrevent on Opportunity (before delete) 
{
    // SOQL on Opportunity Object
    List <Opportunity> Oppty =  [select accountid from opportunity where ID IN :Trigger.OLD];
    
    integer With_Without_SOQL = 1;
    
    for (Opportunity O_T:Trigger.OLD)
    {    
        if(With_Without_SOQL == 1)
        {
            // SOQL Check and Loop
            for (Opportunity O1:Oppty)
            {
                if(O1.accountid !=NULL)
                {
                    O_T.adderror('Opportunity is asociated with an Account ,so you can not delete this Opportunity -- With SOQL Check');
                }
            }
         }
         
        if(With_Without_SOQL == 2)
        {
            // Without Query or by checking Trigger's field value    
            if(O_T.accountid!=NULL || O_T.accountid!='')
            {
                O_T.adderror('Opportunity is asociated with an Account ,so you can not delete this Opportunity -- Without SOQL Check');
            }
        }    
    }
    
}