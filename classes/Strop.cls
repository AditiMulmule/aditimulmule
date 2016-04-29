public class Strop 
{
    public void occ_str(string str)
   {
   
    system.debug(str.replace('@','A'));
   
    system.debug(str.substring(11));
    system.debug(str.toupperCase());
    system.debug(str.tolowerCase());
    
    for (string retval: str.split(' '))
    {
         System.debug(retval);
    }
      system.debug(str.trim());
   
  }
  
}