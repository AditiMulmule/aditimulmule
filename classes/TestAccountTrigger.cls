/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
 
 @isTest
 private class TestAccountTrigger
{
    //Test method for creation of task
    static testMethod void createTask()
     {
        // TO DO: implement unit test
       
        List<Account>lstAcc=new List<Account>();
        
        for(integer i=0;i<200;i++)
         {
          Account objAccount=new Account();
          objAccount.Name='Aditi'+i;
          lstAcc.add(objAccount);          
         } 
        
       insert lstAcc;
       AccountTriggerHandler handlerObject=new  AccountTriggerHandler();
       
       Test.startTest();
       handlerObject.createTask(lstAcc);
   
       List<Task> lstTask=[select Id,Subject from Task];
 
  
       System.AssertEquals(lstTask[0].Subject,'Meeting with Aditi0');
   //insert lsttask;

       Test.stopTest();
    }
    
 //Test method for duplicate check trigger   
 static testMethod void checkdup()
  {
    List <Account>listObj=new List<Account>();
   for(Integer i=1;i<2;i++)
    {  
     Account objAccount=new Account();
     objAccount.Name='Abc'+i;
     objAccount.Phone='123456';
     objAccount.Email__c='abc@d.com';
     objAccount.Address__c='pune';
     listObj.add(objAccount);
     insert listObj;
     
     
     
     
    }
      
    AccountTriggerHandler handlerObject=new AccountTriggerHandler();
    Test.startTest();
    handlerObject.checkinfo(listObj);
    Test.stopTest();
  
   
    
  }
  
  

}