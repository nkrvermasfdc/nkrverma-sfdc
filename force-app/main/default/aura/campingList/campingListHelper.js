({
	createItem: function(component, item) 
    {        
        debugger;
        //try
        //{
            var action = component.get("c.saveItem");
            action.setParams({"item": item});
            action.setCallback(this, function(response)
            {
                    var state        = response.getState();
                	var errors       = response.getError();
                	
                    if (state === "SUCCESS") 
                    {
                        debugger;
                        var items = component.get("v.items");
                        items.push(response.getReturnValue());
                        component.set("v.items", items);                        
                        console.log("Save Item Success");
                    }
                    else
                    {
                        console.log("Save Item Error : "+ state);
                        var errormessage = errors[0].message;
                        console.error(errormessage);						
                    }
            });
    	//}
        //catch (Exception e) 
        //{
            // "Convert" the exception into an AuraHandledException
            //throw new AuraHandledException('Helper -- NKV it! Something went wrong: '+ e.getMessage());    
            //yconsole.log('Helper -- NKV it! Something went wrong: '+ e.getMessage());
    	//}
        $A.enqueueAction(action);
    },
})




//var campings=component.get('v.items');
  //          campings.push(item);    		
    //        component.set('v.items', campings);
      //      component.set
    //('v.newItem',{'sobjectType':'Camping_Item__c','Name':'','Quantity__c': 0,'price__c':0,'packed__c':false});