({
	retOppList : function(component, event, helper) {
        
        // ============================
        // Get Variable from Component        
        
        // ============================
        // Action
           var action = component.get("c.apexController_oppList");
        
        // ============================        
        // Set Call Back
         action.setCallback(this, function(response)
                               		{	var state = response.getState();
                						if(component.isValid() && state === "SUCCESS")
                						{
                                            //alert('JS Controller -- At SetCallBack Success');
                    						component.set("v.varoppList", response.getReturnValue());
                						} 
               							else
               	 						{
                                            //alert('JS Controller -- At SetCallBack Error');
                    						component.set("v.varoppList","Error -- Not able to Connect Apex Method");
                						}
            						}
                              );
            
            $A.enqueueAction(action);
         
        /* 
        alert('JS Controller -- Calling Helper Method');
		helper.helperMethod(component);
        alert('JS Controller -- Paragraph inner HTML');
        */        
        //document.getElementById('message2').innerHTML='JS Controller -- Paragraph inner HTML updated';
	}
})