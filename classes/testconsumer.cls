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
private class testconsumer {

    static testMethod void myUnitTest() {
      
     
        Test.setMock(HttpCalloutMock.class, new TestResponsegenerator());
        
        // Call method to test.
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
     //   HttpResponse res = createLead.createLeadRecord();
        
        // Verify response received contains fake values
         HttpResponse res=LeadManipulatorConsumer.createLeadC('abc','xyz','a@b.com','5555');
     
     String contentType = res.getHeader('Content-Type'); 
        System.assert(contentType == 'application/json');
        String actualValue = res.getBody();
        String expectedValue = '{"isSuccess":"true"  "Id":"00Q9000000WGZHa"  "status":"success"}';
        System.assertEquals(actualValue, expectedValue);
        System.assertEquals(200, res.getStatusCode()); 
          
        res=LeadManipulatorConsumer.updateLeadC('abc','xyz','a.b.com','5555');
        contentType = res.getHeader('Content-Type'); 
        System.assert(contentType == 'application/json');
        actualValue = res.getBody();
        expectedValue = '{"isSuccess":"true"  "Id":"00Q9000000WGZHa"  "status":"success"}';
        System.assertEquals(actualValue, expectedValue);
        System.assertEquals(200, res.getStatusCode()); 
        
        res=LeadManipulatorConsumer.deleteLeadC('abc','xyz','a.b@com','5555');
        contentType = res.getHeader('Content-Type');
        System.assert(contentType == 'application/json');
        actualValue = res.getBody();
        expectedValue = '{"isSuccess":"true"  "Id":"00Q9000000WGZHa"  "status":"success"}';
        System.assertEquals(actualValue, expectedValue);
        System.assertEquals(200, res.getStatusCode()); 
     
    }
}