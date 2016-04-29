public class Assg12
{
public void  mapac()
{
 list<Opportunity> lstOpportunitys=[Select o.Id,o.AccountId From Opportunity o];

                                  List<Id> opporId = new List<Id>();
                                  List<Id> opporIds = new List<Id>();
                                  
                                   for(Opportunity opr:lstOpportunitys)
                                  {
                                    opporId.add(opr.Id);
                                 }
                                  
                                  Map<Id,List<Id>> mapac = new Map<Id,List<Id>>();
                                  
                                 
                                  for(Opportunity opp :lstOpportunitys)
                                  {                               
                                   mapac.put(opp.AccountId,opporId);                                   
                                  }
                                  
        for (ID idKey : mapac.keyset()) 
        {     
          opporIds =  mapac.get(idKey);
          System.debug('+++++Contact Records Using Map: '+opporIds+'KEYYYYY--->'+ idKey);            
        }                                                                                               
}
}