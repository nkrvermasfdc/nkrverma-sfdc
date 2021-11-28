Trigger Op_trigger1 on Opportunity(before insert, before update){

    Checkopptytotalamount_userDailyLimit.check_opp(Trigger.New);
    
}