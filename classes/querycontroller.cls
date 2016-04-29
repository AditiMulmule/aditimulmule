public class querycontroller
{

   public String selectSortOption { get; set; }

    public String selectedNumberOfRecords { get; set; }

    public String selectedId { get; set; }

    
    public List<String> selectedField{ get; set; }
    public String selectedObject { get; set; }
    public Boolean flag{get;set;}
    //public String selectedfieldList{get;set;} 
    public String selectedNewField{get;set;}  
    public List<SelectOption> fieldList{get;set;} 
    public String generatedQuery { get; set; }
       public List<sObject> listRecords{get;set;} 

      public  querycontroller()
        {
            selectedObject='Account';
            flag=true;
            //generatedQuery='hi';
            selectSortOption='ASC';
            
        }
        
   public List<SelectOption> getObjectList()
    {
           List<SelectOption> listObject = new list<SelectOption>();
           Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe(); 
           
           for(String s :gd.keyset()) 
           {
               Schema.sObjectType objType=gd.get(s);
               listObject.add(new SelectOption(s,s));
               listObject.sort();
           }
           return listObject; 
    }
    
    public List<SelectOption> getAllFields()
    {
        
         Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe(); 
            Schema.SObjectType ObjectSchema = gd.get(selectedObject);
            Map<String, Schema.SObjectField> fieldMap = ObjectSchema.getDescribe().fields.getMap();
           List<SelectOption> allFields= new List<SelectOption>();
            for (String fieldName: fieldMap.keySet()) 
            {  
                allFields.add(new SelectOption(fieldName,fieldName));
                allFields.sort();
             
            }   
      return allFields;
    }
    
    
    public PageReference generateQuery()
    {
    Integer i;
        String queryField='';
        for(i = 0;i<(selectedField.size()-1);i++)
        {
            queryField+= selectedField[i]+',';
            
        }
         queryField+= selectedField[i];
       
            generatedQuery = 'SELECT '+queryField+' FROM '+ selectedObject+ ' order by Name '+selectSortOption ;
            System.debug('*****' +generatedQuery );
           
          
            return null;   
    }
    
    public PageReference executeQuery()
     {
        
         listRecords=Database.query(generatedQuery);
        
        return null;
    }
}