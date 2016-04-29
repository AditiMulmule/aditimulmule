public class test2controller
{

   public List<Account> accList{get;set;}

    public void getSearchstr()
    {
      accList = new List<Account>();
       if(searching.length()>0)
    {  
    string searchstr = 'FIND  \''+searching+'*\'  IN ALL FIELDS RETURNING Account(ID,Name)';
    List<List<sObject>> searchlist = search.query(searchstr);
    accList = ((List<Account>) searchlist[0]);
     
    }
    }

    public String searching { get; set; }
}