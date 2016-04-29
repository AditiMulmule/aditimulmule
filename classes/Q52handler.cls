public class Q52handler
{
public void checkinfo(list<Account> acclist)
{
list<Account> listAccount= [Select a.Phone, a.Name, a.Id, a.Email__c, a.Address__c From Account a];
  
 Map<String,Id> accEmail =new Map<String,Id>();
 
 for(Account c : listAccount)
 {
  accEmail.put(c.Email__c,c.Id);
 }
 Map<String,Id> accPhone =new Map<String,Id>();
 for(Account c: listAccount)
 {
  accPhone.put(c.Phone,c.Id);
 }
 
 Map<String,Id> accName =new Map<String,Id>();

 for(Account c: listAccount)
 {
  accName.put(c.Name,c.Id);
 }
 
 Map<String,Id> accAddress =new Map<String,Id>();

 for(Account c: listAccount)
 {
  accAddress.put(c.Address__c,c.Id);
 } 
 for(Account c :acclist)
  {
   
   if(accEmail.containsKey(c.Email__c) && accPhone.containsKey(c.Phone))
   {
     c.ParentId = accEmail.get(c.Email__c);
   }
   if(accEmail.containsKey(c.Email__c) && accPhone.containsKey(c.Name))
   {
       c.ParentId = accEmail.get(c.Email__c);
   }
   if(accEmail.containsKey(c.Email__c) && accAddress.containsKey(c.Address__c))
   {
      c.ParentId = accEmail.get(c.Email__c);
   }
   
   if(accPhone.containsKey(c.Phone) && accName.containsKey(c.Name))
   {
      c.ParentId = accPhone.get(c.Phone);
   }
   if(accPhone.containsKey(c.Phone) && accAddress.containsKey(c.Address__c))
   {
       c.ParentId = accPhone.get(c.Phone);
   }
   
   if(accName.containsKey(c.Name) && accAddress.containsKey(c.Address__c))
   {
       c.ParentId = accName.get(c.Name);
   }
   
  }



}

}