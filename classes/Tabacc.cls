public class Tabacc
 {
    public Account account{get;set;}
    public Contact contact{get;set;}
    public String acc_name{get;set;}
    public String acc_phone{get;set;}
    public String acc_website{get;set;}
    public String acc_address{get;set;}
    
    public String f_name{get;set;}
    public String l_name{get;set;}
    public String dept{get;set;}
    public String msg{get;set;}
    public String msg1{get;set;}
    
    public Boolean a{get;set;}
    public Boolean p{get;set;}
    
    public Tabacc()
    {
        a=true;
        
    }
    public String getMsg() {
        return null;
    }
  
    public void save()
    {
      account= new Account();
      account.Name=acc_name;
      account.Phone=acc_phone;
      account.Website=acc_website;
      account.Address__c=acc_address;
      insert account;
      a=false;
      p=true;
      acc_name='';
      acc_phone='';
      acc_website='';
      acc_address='';
      
      msg='Account details saved successfully!!!.';
      
        
    }
    public void cancel()
    {
        acc_name='';
        acc_phone='';
        acc_website='';
        acc_address='';
    }
    
    public void reset()
    {
        acc_name='';
      acc_phone='';
      acc_website='';
      acc_address='';
    }
    public void saveContact()
    {
        contact= new Contact();
        contact.FirstName=f_name;
        contact.LastName=l_name;
        contact.Department=dept;
        contact.accountId=account.Id;
        insert contact;
        
        f_name='';
        l_name='';
        dept='';
        p=false;
        msg1='Contact saved successfully';
    }
     public void cancelContact() {
        f_name='';
        l_name='';
        dept='';
    }
    public void resetContact()
    {
        f_name='';
        l_name='';
        dept='';
    }
}