trigger Q4 on Account (after insert)
{
   for(Account a:trigger.new)
   {
    Q4handler t =new Q4handler();
    t.createtask(a);
   }
}