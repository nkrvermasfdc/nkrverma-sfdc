Public Class Checkopptytotalamount_userDailyLimit{

    Public static void check_opp(List<Opportunity> ops){
        Double total_Amount = 0, total_amount_DE = 0;
        for(Opportunity O1: [Select Amount from opportunity where createdDate = TODAY
                             And CreatedbyID = :UserInfo.getUserID()]){
            total_Amount += O1.Amount;                           
        }

        total_amount_DE = total_Amount;
        
        for(Opportunity O2: ops){        
            total_Amount += O2.Amount;        
            if(total_Amount > 100000)
            O2.adderror('Your Daily Quota as of Now is : = ' +total_amount_DE +' You have exceeded your daily Limit Quota');
        }
    }
}