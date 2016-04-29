public class querybuilder
 {

    public String getGenquery() {
        return null;
    }

     public Map <String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
    public List<SelectOption> filterlist= new List<SelectOption>();
    public String selectedObject {get; set;}
    public String selectedid {get; set;}
    public List<SelectOption> selectedField {get; set;}
    public List<SelectOption> selField {get; set;}
    
    String userquery='Select ';
            
    public PageReference genquery()
    {   
            System.debug('$$$$$$$$$$$$$$$$$$$');
        userquery+=selField[0];
        
        for(integer i = 1; i< selField.size(); i++ )
        {
        
        userquery=','+selField[i];
        }
    
        userquery+=' from ';
       
        userquery+=selectedObject+' order by ';
          if(selectedId=='Ascending')
                 {
        userquery+='Ascending';
        }         
       else
       {
        userquery+='Descending';
        }
        System.debug('*************'+userquery);
        return null;
    }

     

    

    Public QueryBuilder()
    {   
        selectedObject = 'Account';
    }
    

    public List<SelectOption> getObjectNames() 
    {
        List<SelectOption> objNames = new List<SelectOption>();
        List<String> entities = new List<String>(schemaMap.keySet());
        entities.sort();
        for(String name : entities)
        {
            objNames.add(new SelectOption(name,name));
        }
        return objNames;
     }

     public List<SelectOption> getObjectFields() 
     {
            Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
            Schema.SObjectType ObjectSchema = schemaMap.get(selectedObject);
            Map<String, Schema.SObjectField> fieldMap = ObjectSchema.getDescribe().fields.getMap();
            List<SelectOption> fieldNames = new List<SelectOption>();
            for (String fieldName: fieldMap.keySet()) 
            {  
                fieldNames.add(new SelectOption(fieldName,fieldName));
              //fieldMap.get(fieldName).getDescribe().getLabel();//It provides to get the object fields label.
            }
            return fieldNames;
      }  
      
      
     
      public PageReference showInfo()
    {
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType ObjectSchema = schemaMap.get(selectedObject);
        Map<String, Schema.SObjectField> fieldMap = ObjectSchema.getDescribe().fields.getMap();
        List<SelectOption> fieldNames = new List<SelectOption>();
                 if(selectedId=='Ascending')
                 {
                   
                        for (String fieldName: fieldMap.keySet()) 
                        {  
                            fieldNames.sort();
                          //fieldMap.get(fieldName).getDescribe().getLabel();//It provides to get the object fields label.
                        }
                 }
                 else
                 {
                 
                 /*for(Integer i = sampleList.size()-1; i>=0;i--)
                {
            
                finalList.add(sampleList.get(i));
            
                }
                 */
                                   
            }
return null;   
}
}