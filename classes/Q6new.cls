public class Q6new
{

public void setRSVP(List<CampaignMember> lst)
    {
       
       System.debug('Camp'+lst);
        Id leadID;
        
        for(CampaignMember cm : lst)
        {
           
         if(cm.RSVP__c == NULL)
         {
                leadID = cm.LeadId;
                
          for(Lead ld : [select l.RSVP__c, l.Id From Lead l where l.Id = :cm.LeadID])
          {
                    
           cm.RSVP__c = ld.RSVP__c;
          }
        }
        }
    }
}