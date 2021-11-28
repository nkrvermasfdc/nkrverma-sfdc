public with sharing class BookShipMetricsController {

    public String selectedQuarter{get;set;}

    public String selectedFiscalYear{get;set;}

    public BookShipMetricsController(ApexPages.StandardController controller){
    }

    public List<SelectOption> getQuarter(){
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('Q1','Q1'));
        options.add(new SelectOption('Q2','Q2'));
        options.add(new SelectOption('Q3','Q3'));
        options.add(new SelectOption('Q4','Q4'));
        return options;
    }

    public List<SelectOption> getFiscalYear(){
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('2015','2015'));
        options.add(new SelectOption('2016','2016'));
        options.add(new SelectOption('2017','2017'));
        options.add(new SelectOption('2018','2018'));
        return options;
    }

    public PageReference TargetValues(){
    return null;
    }  

}