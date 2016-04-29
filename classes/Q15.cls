public class Q15
{
	
public void sorting()
{
 list<Campaign> lst=[Select c.Name, c.Id From Campaign c order by name desc];
   for(Campaign obj:lst)
      {
      system.debug('Descending'+obj);         
      }
    lst.sort();
      for(Campaign obj:lst)
      {
      system.debug('Ascending'+obj);
          
      }
}


}