public class ComponentControllerSystemInformation {
    public sObject recordValue {       
           get {
               return recordValue;
           }
           set {
               recordValue = value;
                
               Schema.DescribeSObjectResult d = recordValue.getSObjectType().getDescribe();
               System.debug('DescribeSObjectResult :' + d);
            String soql = 'select CreatedById,CreatedDate,LastModifiedById,LastModifiedDate' + (isMaster?',OwnerId':'') + ' from ' + d.Name + ' where Id = \'' + recordValue.Id + '\'';
            recordValue = Database.query(soql);
           }
    }
      
    public Id recordId {
        get {
            return recordValue.Id;
        }
    }
         
    public Id createdById {
        get {
            return (Id)recordValue.get('CreatedById');
        }
    }
      
    public String createdByName {
        get {
            User createdByUser = [select name from user where id = :createdById limit 1];
            return createdByUser == null ? null : createdByUser.Name;
        }
    }
          
    public String convertedCreatedDate {
        get {
            DateTime createdDate = (DateTime)recordValue.get('CreatedDate');
            return createdDate.format();
        }
    }
      
    public Id lastModifiedById {
        get {
            return (Id)recordValue.get('LastModifiedById');
        }
    }
      
    public String lastModifiedByName {
        get {
            User lastModifiedByUser = [select name from user where id = :lastModifiedById limit 1];
            return lastModifiedByUser == null ? null : lastModifiedByUser.Name;
        }
    }
          
    public String convertedLastModifiedDate {
        get {
            DateTime lastModifiedDate = (DateTime)recordValue.get('LastModifiedDate');
            return lastModifiedDate.format();
        }
    }
          
    public String ownerName {
        get {
            User ownerUser = [select name from user where id = :ownerId limit 1];
            return ownerUser == null ? null : ownerUser.Name;
        }
    }
      
    public String ownerPhoto {
        get {
            try {
                Id ownerId = (Id)recordValue.get('ownerId');
                User owner = [select smallphotourl from user where id = :ownerId limit 1];
                return owner == null ? null : owner.SmallPhotoUrl;
            } catch(System.RequiredFeatureMissingException e) {
                System.debug('Chatter not enabled in organization:' + e.getMessage());
                return null;
            }
        }
    }
     
    public Boolean isMaster {
      get {
        Schema.DescribeSObjectResult d = recordValue.getSObjectType().getDescribe();
        Map<String, Schema.SObjectField> fields = d.fields.getMap();
        Schema.SObjectField field = fields.get('OwnerId');
        return field != null;
      }
    }
     
    public Id ownerId {
      get {
        if(!isMaster) return null;
         
        return (Id)recordValue.get('OwnerId');
      }
    }            
}