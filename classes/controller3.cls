public  class controller3 
{
public string recid{get;set;}

   public string row{ get; set;}
   public list<Account> Acclst{get;set;}
   Public Account Acc;

   public List<Contact> contacts {get; set;}
   public List<Opportunity> opp {get; set;}
   
   public controller3()
   {

   Acclst = [select Id,Name,Phone, Website from Account ];
   contacts=null;
   opp=null;
   }

  public void setupContacts()
  {
     contacts=[select id, FirstName, LastName from Contact where AccountId=:recId];
      opp=[select id, Name from Opportunity where AccountId=:recId];
      system.debug('Opportunity'+ opp);
      }
     
}