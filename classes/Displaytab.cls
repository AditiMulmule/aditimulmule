public class Displaytab
 {
private final Account acct;


public contact cont{get;set;}

    public Displaytab(ApexPages.StandardController controller)
   {
   
    this.acct = (Account)controller.getRecord();
  
    cont=new contact();
  
    }
    
    public string reset()
    {
      acct.Name=' ';
      acct.site=' ';
      acct.type=' ';
      acct.accountnumber=' ';
    
      return null;
        }
  
   


}