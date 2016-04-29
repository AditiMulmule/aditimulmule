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
private class querytest {

    static testMethod void getlistofobjects()
    {
        // TO DO: implement unit test
        
         querycontroller querybuilderobject =new querycontroller();
         
      

     list<Selectoption> listselect = new list<Selectoption>();    
     listselect=querybuilderobject.getObjectList();
     
     //System.debug('*****Object size*********'+listselect.size());
     
      system.assertEquals(276, listselect.size());
  
  
  
   }
    
    static testMethod void  getAllFieldstest()
    {
    	
    	 querycontroller querybuilderobject =new querycontroller();
     list<Selectoption> listselect = new list<Selectoption>();    
     listselect=querybuilderobject.getAllFields();
    	
    	System.debug('///Field size////'+listselect.size());
    	
    	system.assertEquals(66,listselect.size());
    }
    
    static testmethod void generatequerytest()
    {
    	
     querycontroller querybuilderobject =new querycontroller();
       
     //querybuilderobject. generateQuery();
    	 
     querybuilderobject.selectedObject='account';
    querybuilderobject.selectSortOption='ASC';
     
     list<String> listString = new list<String>();
     listString.add('address__c');
     listString.add('name');
    querybuilderobject.selectedField=listString;
     
     querybuilderobject.generateQuery();
     system.debug('******GENRATED QUERY****'+querybuilderobject.generatedQuery);
     
     system.debug('******LIST SELECTED FIELD****'+querybuilderobject.selectedField);
     
     
     system.assertEquals('SELECT address__c,name FROM account order by Name ASC',querybuilderobject.generatedQuery);
    	
    }
    
    static testMethod void executeQueryTest() 
    {

     list<Sobject> listSobject = new list<Sobject>();
     querycontroller querybuilderobject =new querycontroller();
     querybuilderobject.generatedQuery='SELECT address__c,name FROM account order by Name ASC';
     
    querybuilderobject.executeQuery();
     
     listSobject=querybuilderobject.listRecords;
     
     System.debug('****LIST OF SOBJECT***'+listSobject.size());
     
     system.assertEquals(true, listSobject.isEmpty());

    }
    
    
    
}