@RestResource(urlMapping='/Leadgenerate/*')                                                                                                                                                
global with sharing class Leadwebservice
{
   @HttpPost
  global static String createlead(String FirstName,String LastName,String Phone,String Email,String Company)
  {
  	String status;
  	
  	Lead l=new Lead();
  	l.FirstName=FirstName;
  	l.LastName=LastName;
  	l.Phone=Phone;
  	l.Email=Email;
  	l.Company=Company;
  	
  	Database.SaveResult result=Database.insert(l,false);
   if(result.isSuccess())
   {
     status='The Status is'+result.isSuccess() + ' Lead Id:' +result.getId() + '.';   
   }
   else 
   {
                   
         status='The Status is' + result.isSuccess() + '\n';
      
        for(Database.Error err : result.getErrors())
         {
     
            status='The following error has occurred. \n';                    
            status= ' ' +err.getStatusCode() + ': ' + err.getMessage()+ '.';
        
        }
    
  
  }
   return status;
   
  

  } 

@HttpDelete
  global static string deleteLeadRecord()
  {
  String status;
  
  String firstname=RestContext.request.params.get('firstname');
  String lastname=RestContext.request.params.get('lastname');
  
  String email=RestContext.request.params.get('email');
  String phone=RestContext.request.params.get('phone');
  
  Lead objlead=[select Id,FirstName,LastName,Email, Phone ,Company from Lead where FirstName=:firstname and LastName=:lastname];
  
Database.deleteResult result=Database.delete(objlead,false);
   if(result.isSuccess())
   {
     status='The Status is'+result.isSuccess() + 'And the Lead Id' +result.getId() + '.';   
   }
   else 
   {            
         status='The Status is' + result.isSuccess() + '\n';
      
        for(Database.Error err : result.getErrors())
         {
     
            status='The following error has occurred. \n';                    
            status= ' ' +err.getStatusCode() + ': ' + err.getMessage()+ '.';
       
        }
    
  
  }
   return status;
   
   
  
  }
  
  
  @HttpPatch
 global static String updateRecord(String FirstName,String LastName,String Email,String Phone,String Company)
{
 String status;
 
 Lead objleadupdate=[select FirstName,LastName,Email,Phone,Company from Lead where FirstName=:FirstName and LastName=:LastName];
 
 objleadupdate.Email=Email;
 objleadupdate.Phone=Phone;
 
 Database.saveResult result=Database.update(objleadupdate,false);
 
 if(result.isSuccess())
   {
     status='The Status is'+result.isSuccess() + 'And the Lead Id' +result.getId() + '.';   
   }
   else 
   {            
         status='The Status is' + result.isSuccess() + '\n';
      
        for(Database.Error err : result.getErrors())
         {
     
            status='The following error has occurred. \n';                    
            status= ' ' +err.getStatusCode() + ': ' + err.getMessage()+ '.';
     
        }
    
  
  }
   return status;
   
   
  
}
}