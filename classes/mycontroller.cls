public class mycontroller
{

    public PageReference searchl() {
        return null;
    }


    public String accList { get; set; }

  public String val { get; set; }
  public Account ac {get;set;}
  public Contact c {get;set;}
  public Lead l {get;set;}
  public Opportunity o{get;set;}
  
   public void Go()
  {
  	List<List<SObject>> searchList = [FIND 'key' IN ALL FIELDS RETURNING Account (Id, Name), Contact, Opportunity, Lead];
     
   system.debug(searchList[0]);
    system.debug(searchList[1]);
    system.debug(searchList[2]);
    system.debug(searchList[3]);
   
  
  }
}
/*public list<list<sObject>> Go()
{

       if(val != null && val != '')
            {

            List<List<SObject>> s = [FIND 'key' IN ALL FIELDS RETURNING Account (Id, Name), Contact, Opportunity, Lead];

           return s ;
           system.debug(''+s);

       

         }
         
         ac=((List<Account>)searchList[0]);
   c=((List<Contact>)searchList[1]);
   l=((List<Lead>)searchList[2]);
   o=((List<Opportunity>)searchList[3]);
   


}*/