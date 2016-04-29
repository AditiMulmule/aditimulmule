public class testacc {


    public String acc_address { get; set; }

    public String acc_website { get; set; }

    public String acc_phone { get; set; }

    public String acc_name { get; set; }

    public String msg { get; set; }

    public Boolean p { get; set; }

    public String dept { get; set; }

    public String l_name { get; set; }

    public String f_name { get; set; }

    public String msg1 { get; set; }

    public Boolean a { get; set; }
    
    public Account account{get;set;}
    public Contact con{get;set;}
    public testacc()
    {
      a=true;
    
    }
    
    public PageReference resetContact()
    {
        return null;
    }


    public PageReference cancelContact() {
        return null;
    }


    public PageReference saveContact()
    {
        return null;
    }


 

    public PageReference reset()
    {
       acc_name='';
       acc_phone='';
       acc_address='';
       acc_website=''; 
       
        return null;
    }


    public PageReference cancel()
    {
       acc_name='';
       acc_phone='';
       acc_address='';
       acc_website=''; 
        
       return null;
    }


    public PageReference save()
    {
    
      account=new Account();
      account.Name=acc_name;
      account.Phone=acc_phone;
     
      account.Website=acc_website;
      
      insert account;
      a=false;
      p=true;
        return null;
    }


}