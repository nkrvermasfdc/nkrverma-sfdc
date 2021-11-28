({
    getBCDlst : function(component, event, helper) {
        var spinner = component.find('spinner');
        $A.util.removeClass(spinner, "slds-hide"); 
        console.log('GetBCDList');
        helper.getBCDlst(component); 
         
        var omId = component.get("v.orderId");
        var lineId = component.get("v.soLineId");
        
        if (lineId >''){
           	var PakValue = null;
        }else if (omId > ''){  
        	var Pak = component.find("PackageSelectDynamic");
       		var PakValue = Pak.get("v.value");
        }
        
        if ((omId > '')&(PakValue ==null)){
            helper.getPackages(component);
        }
        
       
    },
    
    formPress: function(component, event, helper) {
        if (event.keyCode === 13) {
            helper.getBCDlst(component); 
        }
    },
    
    selProduct: function(component, event, helper){
        
        
        var lineId = component.get("v.soLineId");
        var omId = component.get("v.orderId");
        if (lineId >''){
            helper.selProduct(component, event);
        }else if (omId > ''){
            helper.showPopupHelper(component, 'modalConfig', 'slds-fade-in-');
            helper.showPopupHelper(component,'backdrop','slds-backdrop--');
            helper.selProductOrder(component, event);
        }
        
    },
    cancelConfig: function(component, event, helper){
         helper.getPackages(component);
        helper.hidePopupHelper(component, 'modalConfig', 'slds-fade-in-');
        helper.hidePopupHelper(component, 'backdrop', 'slds-backdrop--');
    },
     onRadioAI: function(component, event, helper){   
        component.set("v.searchAI", "On");
        
    },
    onRadioOff: function(component, event, helper){   
        component.set("v.searchAI", "Off");    
    },
    
    
})