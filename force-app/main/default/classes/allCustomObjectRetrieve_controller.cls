public with sharing class allCustomObjectRetrieve_controller
{

//Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();

    public List<SelectOption> getobjNames()
    {
        List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('--None','--None--'));

        for(Schema.SObjectType Obj : gd)
        {
            if(Obj.getDescribe().getName().contains('__c'))
            options.add(new SelectOption(Obj.getDescribe().getName(),Obj.getDescribe().getName()));
        }
        return options;
    }
}