trigger AccountTrigger on Account (before insert,after insert)
{
    
  //creating the Handler class object   
  AccountTriggerHandler handlerObject=new AccountTriggerHandler();  
  if(trigger.isAfter)
  {
    handlerObject.createTask(trigger.new);

  }
  
  if(trigger.isBefore)
  {     
    handlerObject.checkinfo(trigger.new);
  }
  
  
}