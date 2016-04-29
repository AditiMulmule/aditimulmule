public class Displayleadrecords
{
 public void displayleadrecords()
    {
    list<Lead> lstLead=[Select Id,Name From Lead ];            
      set<Id> setLeadtId = new set<Id>();
      for(Lead objLead : lstLead)
        {
            setLeadtId.add(objLead.Id);
            
        }                                                                                                           
    }
    }