public class Q17
{
	public void date()
	{
        list<Account> lst=[Select a.Id, a.CreatedById From Account a where a.CreatedDate = today ];
        
        for(Account obj : lst)
        {
            system.debug('Hello'+obj);
        }
	}   

}