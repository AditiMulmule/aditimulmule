public class Q3handler
{
	public void check(list<Contact> ls)
	{
		list<Contact> lst =[Select c.Phone, c.Email From Contact c];
		
	    for(Contact c:lst)
	    {
	    	for(Contact c1:ls)
	    	{
	    		  if((c.Phone!=Null || c.Email!=Null)&&(c.Phone==c1.Phone ||c.Email==c1.Email))
	    		  {
	    		  	c1.Email.addError('A Contact with the same email address already exists in system');
	    		  	c1.Phone.addError('A Contact with the same Phone already exists in system');
	    		  }
	    	}
	    }
		 		
		
	}
}