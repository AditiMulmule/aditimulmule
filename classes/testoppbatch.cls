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
private class testoppbatch {

    static testMethod void myUnitTest() {
    	Double amt=0.0;
     Opportunity opp = new Opportunity();
  opp.Name='test';
  opp.CloseDate=date.today();
  opp.StageName='Closed Won';
  opp.Amount=1200;
  
   insert opp;
 
 Opportunity opp1 = new Opportunity();
  opp1.Name='test1';
  opp1.CloseDate=date.today();
  opp1.StageName='Closed Won';
  opp1.Amount=2500;
  
  amt=opp1.Amount+opp.Amount;
   insert opp1;
 
 //double amountt=opp.Amount + opp1.Amount;

 
String stage='Closed Won';
   System.Test.startTest();
 // Test.StartTest();
    Batchclassopp reassign = new  Batchclassopp();
 ID batchprocessid = Database.executeBatch(reassign,200);
   System.Test.StopTest();
   
 
system.assertEquals(3700,amt);    
}
     
    }