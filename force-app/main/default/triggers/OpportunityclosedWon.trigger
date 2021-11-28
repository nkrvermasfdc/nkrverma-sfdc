Trigger OpportunityclosedWon on Opportunity (before Delete) { 

    for(Opportunity opp:trigger.Old) { 

        if(opp.StageName=='Closed Won') {
             opp.stagename.adderror('You cannot delete Closed Won Opportunity'); 
        } 

    } 

}