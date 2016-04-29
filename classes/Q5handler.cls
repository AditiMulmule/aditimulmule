public class Q5handler 
{
public void checkinfo(list<Account> acclist)
{
list<Account> listAccount= [Select a.Phone, a.Name, a.Id, a.Email__c, a.Address__c From Account a];
 
 set<String> setEmail = new set<String>();
 for(Account c :listAccount)
 {
  setEmail.add(c.Email__c );
 }
 
 set<String> setPhone = new set<String>();
 for(Account c: listAccount)
 {
  setPhone.add(c.Phone);
 }
 
 
  set<String> setName = new set<String>();
 for(Account c: listAccount)
 {
  setName.add(c.Name);
 }
 
  set<String> setAddress = new set<String>();
 for(Account c: listAccount)
 {
  setAddress.add(c.Address__c);
 }
 
 for(Account c : acclist)
  {
  
   if(setEmail.contains(c.Email__c) && setPhone.contains(c.Phone))
   {
       c.addError('A Account with the same email or phone number already exists in system.');
   }
   if(setEmail.contains(c.Email__c) && setName.contains(c.Name))
   {
       c.addError('A Account with the same email or name already exists in system.');
   }
   if(setEmail.contains(c.Email__c) && setAddress.contains(c.Address__c))
   {
       c.addError('A Account with the same email or address already exists in system.');
   }
   
   if(setPhone.contains(c.Phone) && setName.contains(c.Name))
   {
       c.addError('A Account with the same phone number or number already exists in system.');
   }
   if(setPhone.contains(c.Phone) && setAddress.contains(c.Address__c))
   {
       c.addError('A Account with the same phone number or address already exists in system.');
   }
   
   if(setName.contains(c.Name) && setAddress.contains(c.Address__c))
   {
       c.addError('A Account with the same name or address already exists in system.');
   }
  }

}

 


}