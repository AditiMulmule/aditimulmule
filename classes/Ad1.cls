public class Ad1
{
public void d1()
 {
  List<Account> lstAccount = [Select Id, Name From Account];
  integer i; 
  
  //Traditional for loop
  System.debug('Traditional for loop');
  for(i=0; i<lstAccount.size();i++)
  {
   System.debug(lstAccount.get(i));
  } 
 
  //Advanced for loop
  System.debug('Advanced for loop');
  for(Account objAccount: lstAccount)
  {
   System.debug(objAccount);
  }
  
  //While loop
  System.debug('While loop');
  i=0;
  while(i<lstAccount.size())
  {
   System.debug(lstAccount.get(i));
   i++;
  }
 }

}