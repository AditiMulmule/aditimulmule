trigger Q3 on Contact (before insert)
{
  Q3handler t=new Q3handler();
  t.check(trigger.new);
  
}