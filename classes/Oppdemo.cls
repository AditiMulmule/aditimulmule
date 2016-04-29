public class Oppdemo 
{
    public void displayRecord()
    {
        list<Opportunity> opp=[Select Id, AccountId From Opportunity where AccountId != NULL and StageName='Closed Won' ];
           
             for(Opportunity objOpp : opp)
             {
               system.debug('list of opportunity'+objOpp.Id);
             }
             
          
            set<Id> setoppId = new set<Id>();
            for(Opportunity objOpp : opp)
            {
            	
             setoppId.add(objOpp.AccountId);
            }
            system.debug('set of opp Id '+setoppId);
              
       //2nd ques       
         Map<ID,ID> mapIdOpportunity = new Map<ID,ID>();
        
        for(Opportunity objOpp:[Select Id,AccountId From Opportunity Limit 10])
        {
        	mapIdOpportunity.put(objOpp.Id,objOpp.AccountId);
        }
      //3rd ques
        for (ID idKey : mapIdOpportunity.keyset()) 
        {
            Id objOpportunity = mapIdOpportunity.get(idKey);
            System.debug('Opportunity Records Using Map:kkkkkkkey value'+idKey+'  '+ objOpportunity);
        }
}
}