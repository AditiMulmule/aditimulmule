public with sharing class Hand 
{


public void check()
{
	
list<CampaignMember> listlead = [Select c.LeadId, c.CampaignId,c.RSVP__c From CampaignMember c where c.LeadId in (Select l.Id from Lead l )];
list<Lead> lileads =[Select a.Id,a.RSVP__c From Lead a where a.Id in (Select c.LeadId from CampaignMember c)   ];

for(CampaignMember CMobj:listlead)
{
 if(CMobj.RSVP__c == null)
 {
  for(Lead l:lileads)
  { 
   System.debug('******************'+l.RSVP__c);
  
   CMobj.RSVP__c=l.RSVP__c;
   //insert CMobj;
   System.debug('******************'+CMobj.RSVP__c);
    System.debug('******************'+l.RSVP__c);
  }
 }
}
}
}