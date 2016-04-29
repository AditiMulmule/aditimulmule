trigger Q52 on Account (before insert, before update)
{
  Q52handler q2 =new Q52handler();
  
  q2.checkinfo(trigger.new);
  
  }