Public class SchemaObjects{
    
    Public List<SelectOption> objects   {set; get;}
    Public List<SelectOption> fsoptions {set; get;}
    Public List<SelectOption> fnsoptions{set; get;}
    
    Public List<String> objlst {set;get;}
    Public List<String> fields {set;get;}
    Public List<String> sfields{set;get;}
    Public List<String> rfields{set;get;}
    
    Public Set<String> fselected   {set;get;}
    Public Set<String> fnotselected{set;get;}
    
    public Map<String, Schema.sObjectField> mfields;
    Public Map<String, Schema.sObjectType > mobjects {set;get;}
    
    Public String SelectedObj {set;get;}
    public string objdescription{set;get;}
    public string flddescription{set;get;}
    
    Public SchemaObjects(){
        objects          = new List<SelectOption>();
        fsoptions        = new List<Selectoption>(); 
        fnsoptions       = new List<Selectoption>();
        
        objlst           = new List<String>();
        fields           = new List<String>();
        sfields          = new List<String>();
        rfields          = new List<String>();
        
        fselected        = new Set<String>();
        fnotselected     = new Set<String>();       
        
        mobjects         = Schema.getGlobalDescribe();        
        
        objlst.addAll(mobjects.keyset());
        objlst.sort();
        SelectOption p=new SelectOption('None', '-None-');
        objects.add(p);
        
        For(String s:objlst){
            selectOption op = new SelectOption(s,s);
                        objects.add(op);            
        }
    }
    
    Public Void details(){
        Schema.DescribeSObjectResult myobj = mobjects.get(selectedobj).getDescribe();
        objdescription = '' + myobj;
        
        mfields = mobjects.get(selectedobj).getdescribe().fields.getmap();
        //Schema.DescribefieldResult sfields = mfields.get(sfields).getDescribe();
        //flddescription = '' + sfields;
        
        fields.clear();
        fields.addAll(mfields.keyset());
        fields.sort();
        
        fnotselected.clear();
        fnotselected.addAll(fields);
        show();
                
        //System.debug('Test');
        if (fields == Null){
        
        } else{
        
        }
    }
    
    Public Void show(){
        fnsoptions.clear();
        
        for(String s:fnotselected)
        {
            SelectOption op = new selectOption(s,s);    
            fnsoptions.add(op); 
        }
        
    }

}