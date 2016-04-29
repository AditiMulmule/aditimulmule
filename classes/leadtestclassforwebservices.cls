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
private class leadtestclassforwebservices
{

  /*  static testMethod void  leadcreate()
    {
    
  
    list<Lead> Leadlist =new list<Lead>{};
 	RestRequest req = new RestRequest();
  	RestResponse res = new RestResponse();
 	req.requestURI = '/services/apexrest/Leadwebservice';  
 	req.httpMethod = 'POST';
  	RestContext.request = req;
  	RestContext.response= res;

 	Leadwebservice d=new  Leadwebservice();  	    
 	String result=Leadwebservice.createlead('Aditi','Mulmule','abc@gmail.com','1234568', 'eternus');   
   
   for(list<Lead> li:Leadlist)
   {
   	
   }
   
  }*/
     static testMethod Lead insertL()
     {
          
          integer i=0;
    RestRequest req = new RestRequest();
    RestResponse res = new RestResponse();
    Leadwebservice  objlead=new Leadwebservice();
    //List<Lead>ls=new List<Lead>();
    
     Lead ld=new Lead();
     ld.FirstName='Radha';
     ld.LastName='Patil';
     ld.Email='abc@gmail.com';
     ld.Phone='123456';
   ld.Company='fgf';
   
   
   
  req.requestURI = 'https://ap1.salesforce.com/services/apexrest/Leadgenerate';
  req.httpMethod = 'POST';
 System.Test.startTest();
   Leadwebservice.createlead(ld.FirstName,ld.LastName,ld.Email,ld.Phone,ld.Company);
     Database.SaveResult sr = Database.insert(ld, false);
     
    System.Test.StopTest();
    String s=Leadwebservice.createlead('Radha', 'Patil','abc@gmail.com', '123456','fgf');
  //  s1.substringBefore('.');
  String s1=s.subStringBefore('.');
    System.assertEquals(sr.IsSuccess(),TRUE);
    return ld;
     }
     
    static testMethod void updateL()
     {
      /*
      Lead ld=new Lead();
     ld.FirstName='Radha';
     ld.LastName='Patil';
     ld.Email='abc@gmail.com';
     ld.Phone='123456';
   //ld.Company='fgf';
    MyLead1.updateLead('Radha','Patil','radha@gmail.com','456789');
    
    */
    RestRequest req = new RestRequest();
    RestResponse res = new RestResponse();
    req.requestURI = 'https://ap1.salesforce.com/services/apexrest/Leadgenerate';
  req.httpMethod = 'PATCH';
   Lead ld=new Lead();
     ld.FirstName='Radha';
     ld.LastName='Patil';
     ld.Email='abc@gmail.com';
     ld.Phone='123456';
   ld.Company='fgf';
     Database.SaveResult sr = Database.insert(ld, false);
    Lead listLead=[select Email,Phone from Lead where FirstName='Radha' and LastName='Patil'];
listLead.Email='radha@gmail.com';
listLead.Phone='121212';
 Leadwebservice.updateRecord('Radha', 'Patil', 'radha@gmail.com','121212','eter');
    Database.SaveResult sup = Database.Update(listLead);
    System.assertEquals(sup.IsSuccess(),TRUE);
     }
     
     static testMethod void deleteL()
     {
     RestRequest req = new RestRequest();
    RestResponse res = new RestResponse();
    req.requestURI = 'https://ap1.salesforce.com/services/apexrest/Leadgenerate?fname=Radha&lname=Patil&email=abc@gmail.com&phone=123456'; 
    req.httpMethod = 'DELETE';
    RestContext.Request=req;
   RestContext.Response=res;
  Leadwebservice.deleteLeadRecord();
    Lead ld=new Lead();
     ld.FirstName='Radha';
     ld.LastName='Patil';
     ld.Email='abc@gmail.com';
     ld.Phone='123456';
     insert ld;
   Database.DeleteResult sup = Database.Delete(ld);
  Leadwebservice.deleteLeadRecord();
   System.assertEquals(sup.IsSuccess(),TRUE);
    
    }
}