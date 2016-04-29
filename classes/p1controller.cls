public class p1controller 
{

    public String contact { get; set; }

    public String account { get; set; }

    public PageReference conpage()
    {
        objacc.Name=name;
        objacc.Email__c=email;
        objacc.Phone =phone;
        objacc.Address__c =address; 
        upsert objacc;
        return page.p1;
        
        
      
    }


    public String p { get; set; }

    public String a { get; set; }

    public list<Account> listAccount { get; set; }
    Public String email{get;set;}
    public Account acc { get; set;}
    public String name{get;set;}
    public String phone{get;set;}
    public String address{get;set;}
    public Account objAcc=new Account();
    public PageReference getCheckacc()
    {   
    return null;      
    }


    public String save { get; set; }

    public String check { get; set; }

    public pageReference save() 
    {
       listAccount=[select Id, Email__c from Account where Email__c=:email];
         acc=new Account();
        if(listAccount.size()>=1)
        {
          ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Info,'Account already exist')); 
          objAcc=[Select Id, Name,Phone, Address__c From Account where Email__c=:email limit 1];
          phone=objAcc.phone;
          address=objAcc.Address__c;
        }
        
        else
        {
           ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Info,'Account is new')); 
          
           acc.Name=name;
           acc.Email__c=email;
                  
          insert acc;
        }
        
        return page.p2;
    }


   
   
}