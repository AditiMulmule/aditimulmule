public class Q19
{
public void maps()
{
    list <Account> st=[select name,id from account];
 map<string, Id> m=new map<string,Id>();
 
 for (Account acc:st)
 {
  system.debug(''+acc);
  m.put(acc.Name,acc.Id);
 }

}
//19.2
public void lists()
{
   list<Account> ls=[select Id, Name,AccountNumber,Site from Account]; 
    map<Id,list<Account>> m=new map<Id,list<Account>>();
    for(Account ae: ls)
    {
       system.debug(''+ae);
        m.put(ae.Id,ls);
           
    }
  system.debug(+m);   
    
}
}