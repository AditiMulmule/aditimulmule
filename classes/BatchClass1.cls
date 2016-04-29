global class BatchClass1 implements Database.Batchable<sObject>, Database.Stateful,Schedulable
{
  Double totalAmount=0.0;
  global dateTime startdate;
  global dateTime enddate1;
  global integer totaltime;  
  global integer oppsize;
  
  List<Messaging.SingleEmailMessage> mails ;
  
  global Database.Querylocator start(Database.BatchableContext bc)
  {
    return Database.getQueryLocator ('SELECT o.Id,o.Amount FROM Opportunity o WHERE o.StageName=\'Closed Won\' AND o.CreatedDate=TODAY');
  }
  
  global void execute(Database.BatchableContext BC,List<sObject> scope)
  {
    list<Opportunity> oplist=(list<Opportunity>)scope;
    
    for(Opportunity op1:oplist)
    {
        
        totalAmount= totalAmount + op1.Amount;
      op1.put('IsAggregated__c',true);
       
        
    }
    update oplist;
  
    oppsize=oplist.size();
  }
  global void execute(SchedulableContext sc)
  {
  }
    global void finish(Database.BatchableContext BC)
    {
         system.debug('///****Total Amount is'+totalAmount);
         System.debug('---------------Finished execution');
         Messaging.sendEmail(emailSend(BC.getJobId())); 
     }
     
     global List<Messaging.SingleEmailMessage> emailsend(Id jobId1)
     {  
        list<AsyncApexJob> lstap =[SELECT CreatedDate,CompletedDate FROM  AsyncApexJob];  
         
        for(AsyncApexJob op:lstap)
        {
          startdate=op.CreatedDate;
          enddate1=op.CompletedDate;    
        }
         totaltime = enddate1.hour() - startdate.hour();
         
     Messaging.SingleEmailMessage mail = new Messaging.Singleemailmessage();
     mails = new List<Messaging.SingleEmailMessage>();
     
     List<User> sendToUser = [Select Id, u.Email From User u where u.ProfileId IN (select id from Profile where Name = 'System Administrator')];
     List<String> str = new List<String>();
     for(User u : sendToUser)
     {
      str.add(u.Email);
     }
     mail.setToAddresses(str);   
         
         
         
         
    String body = 'Start Date and Time of the Job:  \'+startdate+\'End Date and Time of the Job:   \'+enddate+ \'  Amount: \'+totalamount+\' Total Number of Opportunities Closed Won today:+ \'oppsize\' ';
    mail.setSubject('Daily Opportunity Amount Aggregator Job Complete');
    mail.setHtmlBody(body);  
         
      // AsyncApexJob a = [SELECT Id, JobItemsProcessed,TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id =:BC.getJobId()];
                          
        //String str='aditimulmule@gmail.com';
       //Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
      // String[] toAddresses = new String[]{str};
      // mail.setToAddresses(toAddresses);
     
      mails.add(mail);
      return mails;
       
         
         
    }   
    
}