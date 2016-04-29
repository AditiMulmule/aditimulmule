trigger Q51 on Account (before insert, before update)
{
    Q5handler q=new Q5handler();
    q.checkinfo(trigger.new);

}