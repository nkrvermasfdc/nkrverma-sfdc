Public Class TAWC{

    Public TAWC(Apexpages.StandardController cont){}
    
    List<Campaign> camps = [Select name, Description, StartDate, Enddate, BudgetedCost, ActualCost, Status from Campaign];
    
    Public List<Campaign> getcamps(){
        return camps;
    }
    
    
}