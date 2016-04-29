trigger Q2 on Account (before insert)
{
 Trigger_Settings__c tr = Trigger_Settings__c.getInstance(UserInfo.getUserId());
 if(tr.Disabled_Trigger__c==FALSE)
{
Q2handler t=new Q2handler();
if(Q2handler.flag==1)
{
 Q2handler.flag=0;
 t.clone(Trigger.new);
}

}
}