({
	clickPacked : function(component, event, helper) {       
        var btnClicked = event.getSource();			// the button
        component.set("v.item.Packed__c", true);
        //document.getElementById(btnClicked.id).disabled=true;
        
		//Var a = Component.get(v.item);
        //var Packedckbx = component.get("v.item.Packed__c"); 
	}
})