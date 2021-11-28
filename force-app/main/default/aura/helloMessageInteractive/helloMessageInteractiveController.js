/* ====================================================================================== 
Date    == 18-March-2020
purpose == Trailhead -> Hands-on Challenge
Path    == Aura Components Basics -> Handle Actions with Controllers
URL     == https://trailhead.salesforce.com/en/content/learn/modules/lex_dev_lc_basics/lex_dev_lc_basics_controllers
======================================================================================== */
    ({        
    handleClick: function(component, event, helper) {
        var btnClicked = event.getSource();         // the button
        var btnMessage = btnClicked.get("v.label"); // the button's label
        component.set("v.message", btnMessage);     // update our message
    	},
    handleClick2: function(component, event, helper) {
        var newMessage = event.getSource().get("v.label");
        component.set("v.message", newMessage);
    },
    handleClick3: function(component, event, helper) {
        component.set("v.message", event.getSource().get("v.label"));
    }
})