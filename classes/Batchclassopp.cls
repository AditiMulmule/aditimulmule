global class Batchclassopp implements Database.Batchable<SObject>, Database.Stateful, Schedulable
{ 
 public integer sumOfAmount = 0;          // Variable for calculating sum of amount
 public String CronExp = '0 50 15 * * MON-FRI'; 
 List<Messaging.SingleEmailMessage> mails ;
 
 global Id jobId;
 
 global Database.QueryLocator start(Database.BatchableContext BC)
 {
  String query = 'Select Id, Name, Amount, IsAggregated__c from Opportunity where CreatedDate = today AND StageName = \'Closed Won\' AND IsAggregated__c = FALSE';
  return Database.getQueryLocator(query);
 }

    global void execute(Database.BatchableContext BC,List<SObject> scope)
    {
     for(SObject s : scope)
  {
      sumOfAmount = Integer.valueOf(s.get('Amount')) + sumOfAmount;   //Calculation of sum
      s.put('IsAggregated__c',TRUE);         //Updating the IsAggregated field
     }
     update scope;
    }
 
    global void finish(Database.BatchableContext BC)
    {
     System.debug('---------------Finished execution');
  Messaging.sendEmail(emailToSend(BC.getJobId()));    // Passing the job id to email method
    } 
    
    
    // execute method of schedulable
    global void execute(SchedulableContext SC)
    {
     jobId = Database.executeBatch(new Batchclassopp(),10);
     System.debug('-------------'+jobId);
    }
       
       
    global List<Messaging.SingleEmailMessage> emailToSend(Id jobId1)
    {
  
     String body;
     DateTime start, endTime; 
     integer oppCount, duration;

     Messaging.SingleEmailMessage mail = new Messaging.Singleemailmessage();
     mails = new List<Messaging.SingleEmailMessage>();
     
     List<User> sendToUser = [Select Id, u.Email From User u where u.ProfileId IN (select id from Profile where Name = 'System Administrator')];
     List<String> sendTo = new List<String>();
     for(User u : sendToUser)
     {
      sendTo.add(u.Email);
     }
     mail.setToAddresses(sendTo);
     
     List<AsyncApexJob> aaj = [select Id, CreatedDate, CompletedDate, TotalJobItems from AsyncApexJob where id = :jobId1];
     System.debug('-------------'+jobId1);
     for(AsyncApexJob a : aaj)
     {
      start = a.CreatedDate;
      endTime = a.CompletedDate;
      oppCount = a.TotalJobItems;
     }
     
     duration = start.hour() - endTime.hour();
     
     mail.setSenderDisplayName('Scheduler Batch Mail Notification');
     mail.setSubject('Daily Opportunity Amount Aggregator Job Complete');
     
     body = 'The batch job for Daily Opportunity Amount Aggregation is completed successfully. The details associated with the job are as follows: <br/>';
     body += 'Start Date Time: '+start+'<br/>';
     body += 'End Date Time: '+endTime+'<br/>';
     body += 'Total Duration (in hours): '+duration+'<br/>';
     body += 'Number of opportunities Closed Won today: '+oppCount+'<br/>';
     body += 'Total Opportunity Amount for today: '+sumOfAmount;
     mail.setHtmlBody(body);
     
     mails.add(mail);
     return mails;
    }
}