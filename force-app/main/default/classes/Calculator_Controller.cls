Public Class Calculator_Controller
{
    public boolean Operatorclicked = false;
    Public Integer fv=0,sv, result;
    Public String Input = '';
    
    
    Calculator__C calc = new Calculator__C();
    
    Public Calculator__C getcalc()
    {
    return calc;    
    }
    
    
    
    //==============================================================================//
    Public void zero()
    {
        if (Operatorclicked == true)
        {
            Input = '';
            calc.Input__c = Input;
            Operatorclicked = false;
        }
         
        Input = Input + '0';
        calc.Input__c = Input;
    }
    
    //==============================================================================//    
    Public void one()
    {
        if (Operatorclicked == true)
        {
            Input = '';
            calc.Input__c = Input;
            Operatorclicked = false;
        }
         
        Input = Input + '1';
        calc.Input__c = Input;
    }
    
    //==============================================================================//    
    Public void two()
    {
        if (Operatorclicked == true)
        {
            Input = '';
            calc.Input__c = Input;
            Operatorclicked = false;
        }
         
        Input = Input + '2';
        calc.Input__c = Input;
    }
    
    //==============================================================================//
    Public void three()
    {
        if (Operatorclicked == true)
        {
            Input = '';
            calc.Input__c = Input;
            Operatorclicked = false;
        }
         
        Input = Input + '3';
        calc.Input__c = Input;
    }
    
    //==============================================================================//    
    Public void four()
    {
        if (Operatorclicked == true)
        {
            Input = '';
            calc.Input__c = Input;
            Operatorclicked = false;
        }
         
        Input = Input + '4';
        calc.Input__c = Input;
    }
    
    //==============================================================================//    
    Public void five()
    {
        if (Operatorclicked == true)
        {
            Input = '';
            calc.Input__c = Input;
            Operatorclicked = false;
        }
         
        Input = Input + '5';
        calc.Input__c = Input;
    }
    
    //==============================================================================//    
    Public void six()
    {
        if (Operatorclicked == true)
        {
            Input = '';
            calc.Input__c = Input;
            Operatorclicked = false;
        }
         
        Input = Input + '6';
        calc.Input__c = Input;
    }
    
    //==============================================================================//    
    Public void seven()
    {
        if (Operatorclicked == true)
        {
            Input = '';
            calc.Input__c = Input;
            Operatorclicked = false;
        }
         
        Input = Input + '7';
        calc.Input__c = Input;
    }
    
    //==============================================================================//    
    Public void eight()
    {
        if (Operatorclicked == true)
        {
            Input = '';
            calc.Input__c = Input;
            Operatorclicked = false;
        }
         
        Input = Input + '8';
        calc.Input__c = Input;
    }
    
    //==============================================================================//    
    Public void nine()
    {
        if (Operatorclicked == true)
        {
            Input = '';
            calc.Input__c = Input;
            Operatorclicked = false;
        }
         
        Input = Input + '9';
        calc.Input__c = Input;
    }
    
    //==============================================================================//    
    Public void dot()
    {
        if (Operatorclicked == true)
        {
            Input = '';
            calc.Input__c = Input;
            Operatorclicked = false;
        }
            
        Input = Input + '.';
        calc.Input__c = Input;
    }
    
    
    //==============================================================================//    
     Public void devide()
    {
        Operatorclicked = true;
        fv = fv / integer.valueof(Input);
        
        Input = string.valueof(fv);
        calc.Input__c = Input;
    }
    
    //==============================================================================//    
    Public void multply()
    {
        Operatorclicked = true;
        fv = fv * integer.valueof(Input);
        
        Input = string.valueof(fv);
        calc.Input__c = Input;
    }
    
    //==============================================================================//    
    Public void minus()
    {
        Operatorclicked = true;
        fv = fv - integer.valueof(Input);
        
        Input = string.valueof(fv);
        calc.Input__c = Input;
    }
    
    //==============================================================================//    
    Public void plus()
    {
        Operatorclicked = true;
        fv = fv + integer.valueof(Input);
        
        Input = string.valueof(fv);
        calc.Input__c = Input;
    }
    
    //==============================================================================//    
    Public void cls()
    {
        fv=0;
        Input = '';
        calc.Input__c = Input;
    }
    
    
    //==============================================================================//    
    Public void equals()
    {
        //Input = result;
        calc.Input__c = Input;
    }
}