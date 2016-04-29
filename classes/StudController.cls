public class StudController {

      private ApexPages.StandardController sController;
    public StudController(ApexPages.StandardController controller)
    {
        sController=controller;
    }

    
    public Student__c stud{get;set;}
    public String msg{get;set;}
    public String lang{get;set;}
    public String langCode{get;set;}
  
  
    public void save()
    {
       sController.save();
       
        msg=System.Label.msg;
    }
    public PageReference Msg()
    {
       
       
        return null;
    }
    
    public void Lang()
    {
        if(lang=='English')
        {
            langCode='en_US';
        }
        else if(lang=='French')
        {    
            langCode='fr';
        }
        else if(lang=='Spanish')
        {
            langCode='es';
        }
        
    }
}