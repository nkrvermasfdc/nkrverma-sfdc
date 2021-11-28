trigger SR1_SR2_Access on T_Object__c (after insert, after update) 
{


    if(trigger.isInsert)
    {        
        List<T_Object__Share> Outer_TObjectShares  = new List<T_Object__Share>();

        for(T_Object__c LoopTObject : trigger.new)
        {
        
             T_Object__Share Inner_TObjectShares  = new T_Object__Share();
             
        
            if ((LoopTObject.SP1__c == NULL ) && (LoopTObject.SP2__c == NULL ))
            {
                LoopTObject.adderror('Please Select value for either SP1 or SP2');
            }
        
            if (((LoopTObject.SP1__c != NULL ) && (LoopTObject.SP2__c == NULL )) || ((LoopTObject.SP1__c == NULL ) && (LoopTObject.SP2__c != NULL )))
            {
                if(LoopTObject.SP1__c != NULL)
                {
                    Inner_TObjectShares.ParentId         = LoopTObject.Id;
                    Inner_TObjectShares.UserOrGroupId    = LoopTObject.SP1__c;
                    Inner_TObjectShares.AccessLevel      = 'edit';
                    Inner_TObjectShares.RowCause         = Schema.T_Object__Share.RowCause.SR1_SR2_Access__c;
                    
                    Outer_TObjectShares.add(Inner_TObjectShares);            
                }
                
                if(LoopTObject.SP2__c != NULL)
                {
                    Inner_TObjectShares.ParentId         = LoopTObject.Id;
                    Inner_TObjectShares.UserOrGroupId    = LoopTObject.SP2__c;
                    Inner_TObjectShares.AccessLevel      = 'edit';
                    Inner_TObjectShares.RowCause         = Schema.T_Object__Share.RowCause.SR1_SR2_Access__c;
                    
                    Outer_TObjectShares.add(Inner_TObjectShares);            
                }
            }
            
            if ((LoopTObject.SP1__c != NULL ) && (LoopTObject.SP2__c != NULL ))
            {
                Inner_TObjectShares.ParentId         = LoopTObject.Id;
                Inner_TObjectShares.UserOrGroupId    = LoopTObject.SP1__c;
                Inner_TObjectShares.AccessLevel      = 'edit';
                Inner_TObjectShares.RowCause         = Schema.T_Object__Share.RowCause.SR1_SR2_Access__c;
                    
                Outer_TObjectShares.add(Inner_TObjectShares); 
                
                Inner_TObjectShares.ParentId         = LoopTObject.Id;
                Inner_TObjectShares.UserOrGroupId    = LoopTObject.SP2__c;
                Inner_TObjectShares.AccessLevel      = 'edit';
                Inner_TObjectShares.RowCause         = Schema.T_Object__Share.RowCause.SR1_SR2_Access__c; 
                
                Outer_TObjectShares.add(Inner_TObjectShares);           
            }
        
            
            
        }
        
        Database.SaveResult[] TObjectShareInsertResult = Database.insert(Outer_TObjectShares,false);
        
        // Error handling code omitted
  
    }
    
    
}