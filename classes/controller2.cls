public class controller2
{
    public String optyList { get; set; }
    public List<Account> accList{get;set;}
    public List<Opportunity> oppList{get;set;}
    public List<Contact> conList{get;set;}
    public List<Lead> leadList{get; set;}

    public string searching{get;set;}
    public controller2 (){
    }
    public void getSearchstr() {
    accList = new List<Account>();
    oppList = new List<Opportunity>();
    conList = new List<Contact>();
    leadList = new List<Lead>();
    if(searching.length()>0)
    {  
    string searchstr = 'FIND  \''+searching+'*\'  IN ALL FIELDS RETURNING Account(ID,Name),Contact(Name,LastName,FirstName),Opportunity(Name),Lead(Name,FirstName,LastName)';
    List<List<sObject>> searchlist = search.query(searchstr);
    accList = ((List<Account>) searchlist[0]);
    conList= ((List<Contact>) searchlist[1]);
    oppList = ((List<Opportunity>) searchlist[2]);
    leadList = ((List<Lead>) searchlist[3]);
  }
    
   
}

}