({
    // Load items from Salesforce
    doInit: function(component, event, helper) {
			var action = component.get("c.getItems");
    	// Add callback behavior for when response is received
    		action.setCallback(this, function(response) {
        	var state = response.getState();

        	if (component.isValid() && state === "SUCCESS") {
            	component.set("v.items", response.getReturnValue());
        	}
        	else {
				console.log("Failed with state: " + state);
        	}
    });
 // Send action off to be executed
    $A.enqueueAction(action);
},
handleAddItem: function(component, event, helper) {

    var action = component.get("c.saveItem");
        action.setParams({'item': event});
        action.setCallback(this, function(response){
            var state = response.getState();
            if(component.isValid() && state === "SUCCESS") {
                var items = component.get("v.items");
                items.push(response.getReturnValue());
               component.set("v.items", items); 
            }
        })
        $A.enqueueAction(action);
}
})
 


/*({
	clickCreate: function(component, event, helper) {
        var validItem = component.find('campingform').reduce(function(validSoFar, inputCmp){
		// Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        // If we pass error checking, do some real work
        if(validItem){
            // Create the new Camping
            //debugger;
            var newCampingItem = component.get('v.newItem');
            console.log("Click Create Item Controller: " + JSON.stringify(newCampingItem));
            helper.createItem(component,newCampingItem);
        }
    },
    
        // Load expenses from Salesforce on Page Load
    doInit: function(component, event, helper) {
        // Create the action
        var action = component.get("c.getItems");
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.items", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
    }
})
//
//var item=JSON.parse(JSON.stringify(newCampingItem));
//*/