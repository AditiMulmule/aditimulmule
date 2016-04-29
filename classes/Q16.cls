public class Q16
{
       public void create()
       {  
        list<User> lstuser=[Select a.Id, a.CreatedDate From User a where a.IsActive = true ];
        
        for(User objUser : lstuser)
         
        {
            system.debug('-----lst of User record'+objUser);
        }
}
}