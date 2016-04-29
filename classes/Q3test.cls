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
private class Q3test {

    static testMethod void myUnitTest()
    {
       
      
      Integer cnt=1;
      Boolean b =false;
      
      Contact con = new Contact();
      con.Email='aditimulmule@gmail.com';
      con.FirstName='Aditi';
      con.LastName='Mulmule';
      insert con;
   
      
       Contact con1 = new Contact();
      con1.Email='aditimulmule@gmail.com';
      con1.FirstName='Aditi';
      con1.LastName='Mulmule';
      insert con1;
      
      
      List<Contact> lst = new List<Contact>();
        for(Integer i = 0;i< 200 ; i++)
        {
          Contact c = new Contact();
      c.FirstName = 'Test data'+i;
      c.LastName='Last'+i;
          lst.add(c);
        }
      insert lst;
      
      
      system.assertEquals('Aditi', con.FirstName);
     
      
    }
    
    
    
    }