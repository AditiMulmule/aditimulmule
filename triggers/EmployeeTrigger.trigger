trigger EmployeeTrigger on EMPLOYEE__c (before delete) {
    list<EMPLOYEE__c> empList = new list<EMPLOYEE__c>();
    empList = [Select Id from EMPLOYEE__c];
    set<Id> salIds = new  set<Id>();
  
    for(Salary_Details__c salList :[Select Id,EMPLOYEE__c,EMPLOYEE__r.Id from Salary_Details__c where EMPLOYEE__c IN:empList])
    {
       salIds.add(salList.EMPLOYEE__r.Id); 
    }
    
    for(EMPLOYEE__c emp:trigger.old)
    {
      if(salIds.contains(emp.Id))
      {
        emp.addError('Cannot be deleted');
       }
    }
    
}