public class testaccountcontroller
{
    public String recieved{get;set;}
    public String accclist { get; set; }
    public list<Account> acclist { get; set; }
    public list<Contact> contacts{get;set;}
    public list<Opportunity> opp{get;set;}
    public testaccountcontroller()
    {
       acclist=[Select Id,Name,Phone,Website from Account];
     
    }
    
    
    public void setupcontacts()     
    {
        contacts=[Select Id,FirstName,LastName From Contact where AccountId=:recieved];
        opp=[Select Id,Name from Opportunity where AccountId=:recieved];
        
        
    }


   
    
    
    
    
}