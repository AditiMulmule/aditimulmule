public class Q13
{
  public void parentchild()
{
    
    List<Account> lst = [Select a.Id,a.name, a.AccountNumber From Account a where a.Id in (Select c.AccountId from Contact c )]; 
    
    for(Account obj:lst)
    {
        system.debug('Hello'+obj);
    }

}

}