public class Q9 
{
  public void create()
{
 list <Account> st = [Select Name from Account where Name LIKE 'A%'];
 integer cnt=0;
 for(Account a : st)
 {
  system.debug('the records are' +a);
  cnt++;
 }
   
system.debug(''+cnt);


    for(Account ae: st )
{
    ae.Name='Updated via update DML operation';
 
    
}
update st;
    for(Account a : st)
 {
  
  system.debug('the records are' +a);

 }
}
}