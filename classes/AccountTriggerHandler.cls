public with sharing class AccountTriggerHandler
{

   //Function for task Creation-Assignment 4
 
    public void createTask(List<Account> listAccount)
    {
        List<Task> listTask=new List<Task>();
        for(Account objAccount:listAccount)
        {
            Task objTask=new Task();
            objTask.WhatId = objAccount.Id;
            objTask.subject=System.Label.Meeting_with+' '+objAccount.name;
            listTask.add(objTask);            
        }//for
        try
        {
            insert listTask;
        }
        catch(DMLException e)
        {
            System.debug('DML Exception has occurred'+e);
        }
    }
    
  		 
  
  //Function for Duplicate Check-Assignment 5
  public void checkinfo(list<Account> accountList)
  {
	list<Account> listAccount= [Select objAccount.Phone, objAccount.Name, objAccount.Id, objAccount.Email__c,objAccount.Address__c From Account objAccount];

	
	 Map<String,Id> accountEmail =new Map<String,Id>();
     Map<String,Id> accountPhone =new Map<String,Id>();
     Map<String,Id> accountName =new Map<String,Id>();
     Map<String,Id> accountAddress =new Map<String,Id>();
         
     for(Account objAccount :listAccount)
     {
         accountEmail.put(objAccount.Email__c,objAccount.Id);
         accountPhone.put(objAccount.Phone,objAccount.Id);
         accountName.put(objAccount.Name,objAccount.Id);
         accountAddress.put(objAccount.Address__c,objAccount.Id);
     }
       
	
	
 	for(Account objAccount : accountList)
  	{
   
   		if(accountEmail.containsKey(objAccount.Email__c) && accountPhone.containsKey(objAccount.Phone))
   		{
     		objAccount.ParentId = accountEmail.get(objAccount.Email__c);
   		}
   		if(accountEmail.containsKey(objAccount.Email__c) && accountPhone.containsKey(objAccount.Name))
   		{
      	  objAccount.ParentId = accountEmail.get(objAccount.Email__c);
   		}
   		if(accountEmail.containsKey(objAccount.Email__c) && accountAddress.containsKey(objAccount.Address__c))
   		{
      	  objAccount.ParentId = accountEmail.get(objAccount.Email__c);
   		}
   
   	   if(accountPhone.containsKey(objAccount.Phone) && accountName.containsKey(objAccount.Name))
   		{
      		objAccount.ParentId = accountPhone.get(objAccount.Phone);
   		}
   		
   	   if(accountPhone.containsKey(objAccount.Phone) && accountAddress.containsKey(objAccount.Address__c))
   		{
       		objAccount.ParentId = accountPhone.get(objAccount.Phone);
  		}
   	
   	   if(accountName.containsKey(objAccount.Name) && accountAddress.containsKey(objAccount.Address__c))
   		{
       		objAccount.ParentId = accountName.get(objAccount.Name);
   		}
   
  	}//for



 }//checkinfo
  
 
}//class