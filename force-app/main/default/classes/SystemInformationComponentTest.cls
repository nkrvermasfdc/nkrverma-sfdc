@isTest
public class SystemInformationComponentTest{
   
    @isTest public static void TestComponent() {
          
        Account record = new Account(Name = 'Test');
        insert record;
        record = [select ownerId,createdById,lastModifiedById,createdDate,lastModifiedDate from account where id = :record.id];
        User owner = [select name,smallPhotoUrl from user where id = :record.ownerId];
              
        ComponentControllerSystemInformation controller = new ComponentControllerSystemInformation();
        //SystemInformationComponentController();
        controller.recordValue = record;
          
        System.assertEquals(record.Id, controller.recordId);
        System.assertEquals(record.CreatedById, controller.createdById);
        System.assertEquals(record.LastModifiedById, controller.lastModifiedById);
        System.assertEquals(record.OwnerId, controller.ownerId);
        System.assertEquals(record.CreatedDate.format(), controller.convertedCreatedDate);
        System.assertEquals(record.LastModifiedDate.format(), controller.convertedLastMOdifiedDate);
        System.assertEquals(owner.Name, controller.ownerName);
        System.assertEquals(owner.SmallPhotoUrl, controller.ownerPhoto);
        System.assertEquals(owner.Name, controller.lastModifiedByName);
        System.assertEquals(owner.Name, controller.createdByName);
        System.assertEquals(true, controller.isMaster);
    }
}