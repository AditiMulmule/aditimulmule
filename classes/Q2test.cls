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
private class Q2test {

    static testMethod void myUnitTest()
    {
          String str ='A Contact with the same email address or phone number already exists in system.';
     Account acc = new Account();
     acc.Name = 'Test';
     acc.Phone= '1234';
      insert acc;
            
      Account acc1 = new Account();
     acc1.Name = 'Test1';
     acc1.Phone= '1234';
      insert acc1;
      
      List<Account> lst = new List<Account>();
        for(Integer i = 0;i< 200 ; i++)
        {
          Account obj1 = new Account();
      obj1.Name = 'Test data'+i;
          lst.add(obj1);
        }
      insert lst;
      
  //    system.assertEquals(str, acc1.showError());
      
      
 //     Account acc1 = new Account();
 //    acc1.Name = 'Testdata1';
 //     insert acc1;
    }
    }