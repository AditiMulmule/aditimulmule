public class Q18
{
public static void getContact()
	{
      //
       // list<Contact> lst=[Select c.FirstName, c.Email From Contact c   ];
        
          list<Contact> lst=[Select a.Id, a.CreatedById From Contact a where a.LastModifiedDate = today ];
        
        for(Contact obj : lst)
        {
            system.debug('Hello'+obj);
        }
	}   
}