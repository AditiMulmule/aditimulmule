trigger Q1 on Account (before insert, before update)
{
  system.debug('Trigger'+trigger.new);
  system.debug('Trigger'+trigger.old);
  system.debug('Trigger'+trigger.NewMap);
  system.debug('Trigger'+trigger.oldMap);
  
}