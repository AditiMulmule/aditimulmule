trigger q6trigg on CampaignMember (before insert)

{
 
   Q6new cmh = new Q6new();
   cmh.setRSVP(Trigger.new);
}