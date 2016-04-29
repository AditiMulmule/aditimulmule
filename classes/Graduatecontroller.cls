public class Graduatecontroller
{

  

 
    public boolean grad { get; set; }
    public boolean ugrad{get; set;}
    public String value { get; set; }
    public String undergraduate { get; set; }
    public String graduate { get; set;}
     List<SelectOption> recordtypes;
    public List<Student__c> UndergraduateList { get; set; }
    public List<Student__c> GraduateList { get; set; }
    
    public Graduatecontroller()
    {
       grad=false;
       ugrad=false;
    }
    
     public List<SelectOption> getRecordTypes()
    {
       integer i = 0;  
        recordtypes = new List<SelectOption>();   
        Schema.DescribeSObjectResult S = Student__c.SObjectType.getDescribe();
        List<Schema.RecordTypeInfo> lst = S.getRecordTypeInfos();
        for(Schema.RecordTypeInfo sr: lst)
        {
            i++;
            if(i < lst.size())
                recordtypes.add(new SelectOption(sr.getName(),sr.getName()));
        }
       return recordtypes;
    }
    
    public void TopRecords() 
    {
        
        if(value == 'UnderGraduate')
        {
        
          grad=false;
          ugrad=true;
        
          UndergraduateList = [Select s.Name, s.Roll_Number__c From Student__c s where s.RecordType.Name ='UnderGraduate'];
        
        }
        else if(value == 'Graduate')
       {
          ugrad=false;
          grad=true;                        
        GraduateList = [Select s.Name,s.Roll_Number__c, s.Graduationpercentage__c From Student__c s where s.RecordType.Name ='Graduate' order by s.Graduationpercentage__c  desc];
       }                                   
       else
       {
          grad=false;
          ugrad=false;
       }
       
       
    }
    
    
  
        
}