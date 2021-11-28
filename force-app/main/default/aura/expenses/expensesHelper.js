({
    createExpense: function(component, expense) 
    {
        debugger;
        var action = component.get("c.saveExpense");
        action.setParams({"expense": expense});
        action.setCallback(this, function(response)
        {
            var state = response.getState();
            if (state === "SUCCESS") 
            {
                debugger;
                var expenses = component.get("v.expenses");
                expenses.push(response.getReturnValue());
                component.set("v.expenses", expenses);
            }
            else
            {
            	console.log("Create expense: Error");
            }
        });
        $A.enqueueAction(action);
    },
})

/*createExpense: function(component, expense) {
        var theExpenses = component.get("v.expenses");
 
        // Copy the expense to a new object
        // THIS IS A DISGUSTING, TEMPORARY HACK
        var newExpense = JSON.parse(JSON.stringify(expense));
        
 		console.log("Expenses before 'create': " + JSON.stringify(theExpenses));
        theExpenses.push(newExpense);
        component.set("v.expenses", theExpenses);
        console.log("Expenses after 'create': " + JSON.stringify(theExpenses));
    }*/