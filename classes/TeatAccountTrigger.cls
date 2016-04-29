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
private class TeatAccountTrigger {

    static testMethod void insertDuplicateCheck()
    {  
    	list<Account> listAccount=new list<Account>();
    	list<Account> listAccount1=new list<Account>();
        list<Account> listAccountdup=new list<Account>();
        
        Account objAccount;
    	for(Integer i = 0;i<200; i++)
       {	    	  	    	
        objAccount=new Account();
        objAccount.Name='testdata'+i;
        listAccount.add(objAccount);
       }      
        insert listAccount;         
 
       Account testObjAccount;
       for(Integer i=0;i<100;i++)
       { 	
        testObjAccount=new Account();
        testObjAccount.Name='testdata'+i;
        listAccount1.add(testObjAccount);
       }
       try
       {
       	  system.test.startTest();  
       	  insert listAccount1;    
       	  system.Test.stopTest();   	 
       }	
       catch(DMLException e)
       {            	          
       	 System.debug('Insert opereation Cannot be performed');
       	 	
       }
       
       listAccountdup=[Select Name from Account];
       
       System.debug('*********size of account***********'+listAccountdup.size());
        
       system.assertEquals(listAccountdup.size(),200);
        
        
    }
    
     static testMethod void updataDuplicateCheck()
     {
     	list<Account> listAccount=new list<Account>();
     	list<Account> listAccountNew=new list<Account>();
     	Account objAcc;
     	for(Integer i = 0;i<200; i++)
        {	    	  	    	
            objAcc=new Account();
        	objAcc.Name='testdata'+i;
        	listAccount.add(objAcc);
        }  
        
        insert listAccount;
        
        Account objAccount=[Select a.Name from Account a where Name=:'testdata1'];
        /*list<Account> listAccName=[Select Name From Account];    
     	
     	for(Account objAccount:listAccName)
     	{
     		objAccount.Name='testdata1';
     		listAccName.add(objAccount);
     	}*/
     	
     	objAccount.Name='testdata2';
     	try
     	{
     		system.test.startTest();  
     		update objAccount;
     		system.Test.stopTest();   
     	}
     	catch(DMLException e)
        {            	          
       	 System.debug('Update opereation Cannot be performed');     	 	
        } 
     	 
     	Account updatedAccount = [SELECT Name FROM Account WHERE Id = :objAccount.Id];
     	System.assertEquals('testdata1',updatedAccount.Name);     	
     }
   
}