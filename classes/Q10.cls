public with sharing class Q10
{
public void createRecords()
 {
  Account a = new Account(name='Aditi');
  insert a;
  
  Contact c= new Contact();
  c.LastName = 'Mulmule';
  insert c;
  
  Date date1 = System.today();
  Opportunity o =new Opportunity();
  o.Name = 'Aditi';
  o.CloseDate = date1;
  o.StageName = 'Closed Lost';
  insert o;
  
  Lead l = new Lead();
  List<RecordType> lstRT = [Select r.SobjectType, r.Name, r.Id From RecordType r where r.SobjectType = 'Lead' AND r.Name = 'Mobile'];
  Id rt;
  for(RecordType r: lstRT)
  {
   rt = r.id;
  }
  
  l.RecordTypeId = rt;
  l.LastName = 'Banekar';
  l.Company = 'Eternus';
  l.Status = 'Open - Not Contacted';
  insert l;
 }
}