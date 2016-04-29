global class SumOppoutunity implements Database.Batchable<sObject>, Database.Stateful
{
  Double totalAmount=0;
  global Database.Querylocator start(Database.BatchableContext bc)
  {
  	return Database.getQueryLocator ('SELECT o.Id, o.Amount FROM Opportunity o WHERE StageName="Closed Won" AND CreatedDate=TODAY()');
  }
  
  global void execute(Database.BatchableContext BC,List<sObject> scope)
  {
  	list<Opportunity> oplist=new list<Opportunity>();
  	
  	for(Opportunity opp:oplist)
  	{
  		
  		totalAmount= opp.Amount+totalAmount;
  	    opp.IsAggregated__c=TRUE;
  	}
  	
  	system.debug('///****Total Amount is'+totalAmount);
  	
  }
  

    global void finish(Database.BatchableContext BC)
    {
    }
}