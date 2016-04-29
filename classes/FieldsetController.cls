public class FieldsetController
{

      public FieldsetController(ApexPages.StandardController controller)
     {

        panelsToShow = new List<Boolean> {true,false,false};
    }

    public List<Boolean> panelsToShow {get;set;}
  Public String str{get;set;}
  public String information{get;set;}
  public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>(); 
        options.add(new SelectOption('si','Student Information')); 
        options.add(new SelectOption('ci','Company Information')); 
        options.add(new SelectOption('ei','Employee Information')); 
        return options; 
    }
    
     
                   
    public String getInformation() {
        return information;
    }
    
    
    
    public PageReference setInfoType()
    {
     system.debug('info:'+information);
     if(information=='si')
     {
      
      panelsToShow[0] = true;
      panelsToShow[1] = false;
      panelsToShow[2] = false;
      return null;
     }
     else if(information=='ei')
     {

      panelsToShow[0] = false;
      panelsToShow[1] = true;
      panelsToShow[2] = false;
      return null;
     }
     else if(information=='ci')
     {
      //str='pCompany';
      panelsToShow[0] = false;
      panelsToShow[1] = false;
      panelsToShow[2] = true;
      return null;
     }
     
     return null;
    }
    
    public PageReference cancle()
    {
     return null;
    }

}